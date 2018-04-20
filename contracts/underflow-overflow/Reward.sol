pragma solidity 0.4.21;


contract Reward {
    address public owner;

    mapping(address => uint256) public rewards;

    event Rewarded(address indexed winner, uint256 value);

    modifier onlyOwner {
        require(msg.sender == owner);

        _;
    }

    function Reward() public {
        owner = msg.sender;
    }

    function setReward(address _winner, uint256 _reward) external onlyOwner {
        rewards[_winner] = _reward;
    }

    function claimReward(uint256 _reward) public {
        rewards[msg.sender] -= _reward;

        emit Rewarded(msg.sender, _reward);
    }
}
