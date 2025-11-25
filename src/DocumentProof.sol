// SPDX-License-Identifier: TLNCL-1.0
pragma solidity ^0.8.0;

contract DocumentProof {
    struct Document {
        address signer;
        uint256 timestamp;
    }

    mapping(string => Document) private documents;

    function addDocument(string memory _hash) public {
        require(documents[_hash].timestamp == 0, "Document already exists");
        documents[_hash] = Document({
            signer: msg.sender,
            timestamp: block.timestamp
        });
    }

    function getDocuments(string memory _hash) public view returns (Document memory) {
        return documents[_hash];
    }

    function removeDocument(string memory _hash) public {
        delete documents[_hash];
    }

    function verifyDocument(string memory _hash) public view returns (address, uint256) {
        require(documents[_hash].timestamp != 0, "Document not found");
        return (documents[_hash].signer, documents[_hash].timestamp);
    }
}
