// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

interface IBilling {
    /**
     * @dev User adds tokens
     */
    event TokensAdded(address indexed user, uint256 amount);
    /**
     * @dev User removes tokens
     */
    event TokensRemoved(address indexed user, address indexed to, uint256 amount);

    /**
     * @dev Gateway pulled tokens from a user
     */
    event TokensPulled(address indexed user, uint256 amount);

    /**
     * @dev Gateway address updated
     */
    event GatewayUpdated(address indexed newGateway);

    /**
     * @dev Tokens rescued by the gateway
     */
    event TokensRescued(address indexed to, address indexed token, uint256 amount);

    /**
     * @dev Set the new gateway address
     * @param _newGateway  New gateway address
     */
    function setGateway(address _newGateway) external; // onlyGateway or onlyGovernor, or something

    /**
     * @dev Add tokens into the billing contract
     * @param _amount  Amount of tokens to add
     */
    function add(uint256 _amount) external;

    /**
     * @dev Add tokens into the billing contract for any user
     * @param _to  Address that tokens are being added to
     * @param _amount  Amount of tokens to add
     */
    function addTo(address _to, uint256 _amount) external;

    /**
     * @dev Remove tokens from the billing contract
     * @param _to  Address that tokens are being removed from
     * @param _amount  Amount of tokens to remove
     */
    function remove(address _to, uint256 _amount) external;

    /**
     * @dev Gateway pulls tokens from the billing contract
     * @param _user  Address that tokens are being pulled from
     * @param _amount  Amount of tokens to pull
     * @param _to Destination to send pulled tokens
     */
    function pull(
        address _user,
        uint256 _amount,
        address _to
    ) external;

    /**
     * @dev Gateway pulls tokens from many users in the billing contract
     * @param _users  Addresses that tokens are being pulled from
     * @param _amounts  Amounts of tokens to pull from each user
     * @param _to Destination to send pulled tokens
     */
    function pullMany(
        address[] calldata _users,
        uint256[] calldata _amounts,
        address _to
    ) external;
}
