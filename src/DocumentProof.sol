// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DocumentProof {
    
    struct Document {
        address signer;       
        uint256 timestamp;    
        string hash;          
    }

    mapping(string => Document) public documents;

    function signDocument(string memory _hash) public {
        require(documents[_hash].timestamp == 0, "Document already signed");

        documents[_hash] = Document({
            signer: msg.sender,
            timestamp: block.timestamp,
            hash: _hash
        });
    }

    function verifyDocument(string memory _hash) public view returns (address, uint256) {
        require(documents[_hash].timestamp != 0, "Document not found");
        return (documents[_hash].signer, documents[_hash].timestamp);
    }
}
