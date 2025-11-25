// SPDX-License-Identifier: TLNCL-1.0
pragma solidity ^0.8.18;

import "forge-std/Script.sol";
import "../src/DocumentProof.sol";

contract DeployDocumentProof is Script {
    function run() external {
        vm.startBroadcast();
        DocumentProof docProof = new DocumentProof();
        console.log("DocumentProof deployed at:", address(docProof));
        vm.stopBroadcast();
    }
}
