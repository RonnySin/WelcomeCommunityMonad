// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract WelcomeCommunity {
    
    mapping(address => uint256) public interactions;

    event Interaction(address indexed user, uint256 count);

    modifier trackInteraction() {
        interactions[msg.sender] += 1;
        emit Interaction(msg.sender, interactions[msg.sender]);
        _;
    }

    function welcome() public trackInteraction returns (string memory) {
        return "Welcome to the Monad Community!";
    }

    /// @notice Checks interaction history for the caller
    function checkHistory() public view returns (string memory) {
        uint256 count = interactions[msg.sender];

        if (count > 100) {
            return string(
                abi.encodePacked(
                    "You have interacted ",
                    uintToString(count),
                    " times. Thank you for being loyal with us!"
                )
            );
        } else {
            return string(
                abi.encodePacked(
                    "You have interacted ",
                    uintToString(count),
                    " times. Keep going!"
                )
            );
        }
    }

    function uintToString(uint256 v) internal pure returns (string memory str) {
        if (v == 0) return "0";
        uint256 j = v;
        uint256 length;
        while (j != 0) {
            length++;
            j /= 10;
        }
        bytes memory bstr = new bytes(length);
        uint256 k = length;
        j = v;
        while (j != 0) {
            bstr[--k] = bytes1(uint8(48 + j % 10));
            j /= 10;
        }
        str = string(bstr);
    }
}
