pragma solidity ^0.4.0;

contract WarehouseI {
    function ship(uint id, address customer) returns (bool handled);
}

contract Store {
    address wallet;
    WarehouseI warehouse;

    function Store(address _wallet, address _warehouse) {
        wallet = _wallet;
        warehouse = WarehouseI(_warehouse);
    }

    // made payable so msg.value can be used
    function purchase(uint id) payable returns (bool success) {
        // uses output of .send to throw if send failed
        if (!wallet.send(msg.value)) throw;
        return warehouse.ship(id, msg.sender);
    }
}
