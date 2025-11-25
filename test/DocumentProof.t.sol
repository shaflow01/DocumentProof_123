// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Test.sol";
import "../src/DocumentProof.sol";

contract DocumentProofTest is Test {
    DocumentProof public docProof;

    function setUp() public {
        docProof = new DocumentProof();
    }

    function testSignDocument() public {
        string memory hash = "abc123";

        docProof.signDocument(hash);

        (address signer, uint256 timestamp) = docProof.verifyDocument(hash);

        assertEq(signer, address(this));
        assertGt(timestamp, 0);
    }

    function testCannotSignSameDocumentTwice() public {
        string memory hash = "abc123";
        docProof.signDocument(hash);

        vm.expectRevert("Document already signed");
        docProof.signDocument(hash);
    }

    function testVerifyNonExistentDocument() public {
        string memory hash = "notSigned";

        vm.expectRevert("Document not found");
        docProof.verifyDocument(hash);
    }
}
