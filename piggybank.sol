pragma solidity ^0.4.0;

contract PiggyBank {
    address owner;
    uint balance;
    // was: uint248
    // allows for larger balances sinc uint is 256-bit

    // made piggyBank payable since msg.value used
    function piggyBank() payable {
        owner = msg.sender;
        balance += uint(msg.value);
        // was: uint248, but if msg.value is large, this might be a problem.
    }

    // made payable so msg.value can be used. otherwise ether will be rejected.
    function () payable {
        if (msg.sender != owner) throw;
        balance += uint(msg.value); // was: uint248
    }

    function kill() {
        if (msg.sender != owner) throw;
        selfdestruct(owner);
    }
}
