pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract GenContract {
    using SafeERC20 for IERC20;

    address public manager;
    mapping(string => string) public requestedDatas;

    receive() external payable {}

    constructor() { manager = msg.sender; }

    function version() public pure returns (string memory) {
        return "0.0.1";
    }

    function name() public pure returns (string memory) {
        return "Gen Contract";
    }

    // event for EVM logging
    event ManagerSet(address indexed oldManager, address indexed newManager);

    // modifier to check if caller is manager
    modifier isManager() {
        // If the first argument of 'require' evaluates to 'false', execution terminates and all
        // changes to the state and to Ether balances are reverted.
        // This used to consume all gas in old EVM versions, but not anymore.
        // It is often a good idea to use 'require' to check if functions are called correctly.
        // As a second argument, you can also provide an explanation about what went wrong.
        require(msg.sender == manager, "Caller is not manager");
        _;
    }
    
    function changeManager(address newManager) public isManager {
        emit ManagerSet(manager, newManager);
        manager = newManager;
    }

    function getManager() external view returns (address) {
        return manager;
    }

    function addDataUidAndIpfsHash(string memory dataUid, string memory ipfsHash) public isManager {
        requestedDatas[dataUid] = ipfsHash;
    }

    function getRequestedDataHash(string memory dataUid) external view returns (string memory) {
        return requestedDatas[dataUid];
    }

    function removeDataUidAndIpfsHash(string memory dataUid) public isManager {
        delete requestedDatas[dataUid];
    }

    function transferReward(address _token, address receiver, uint amount) public isManager {
        IERC20(_token).safeTransfer(receiver, amount);
    }

    function withdrawETH() public isManager returns(bool) {
        payable(msg.sender).transfer(address(this).balance);
        return true;
    }
}