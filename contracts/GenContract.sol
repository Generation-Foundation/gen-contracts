pragma solidity ^0.8.13;

contract GenContract {
    function version() public pure returns (string memory) {
        return "0.0.1";
    }

    function name() public pure returns (string memory) {
        return "Gen Contract";
    }
}