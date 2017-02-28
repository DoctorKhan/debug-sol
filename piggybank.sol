pragma solidity ^0.4.0;

contract PiggyBank {
    address owner;
    uint balance;

    function piggyBank() payable {
        owner = msg.sender;
        balance += uint(msg.value);
    }

    function () payable {
        if (msg.sender != owner) throw;
        balance += uint(msg.value);
    }

    function kill() {
        if (msg.sender != owner) throw;
        selfdestruct(owner);
    }
}
