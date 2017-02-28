pragma solidity ^0.4.0;

contract Splitter {
    address one;
    address two;

    function Splitter(address _two) {
        if (_two == 0) throw;
        one = msg.sender;
        two = _two;
    }

    function () {
        uint amount = this.balance / 2;
        if (!one.send(amount)) throw;
        if (!two.send(amount)) throw;
    }
}
