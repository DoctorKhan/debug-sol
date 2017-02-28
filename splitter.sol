pragma solidity ^0.4.0;

contract Splitter {
    address one;
    address two;

    function Splitter(address _two) {
        /* removed: if (msg.value > 0) throw;
        since this function is not payable, this will reject ether automatically */
        
        // added line below to check if the second address is valid
        if (_two == 0) throw;
        one = msg.sender;
        two = _two;
    }

    function () {
        uint amount = this.balance / 2;

        /* changed .call.value to .send
        this prevents reentry exploit since .send is gas-limited */
        if (!one.send(amount)) throw;
        if (!two.send(amount)) throw;
    }
}
