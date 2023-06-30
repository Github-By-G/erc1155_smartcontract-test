
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts-upgradeable/token/ERC1155/ERC1155Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC1155/extensions/ERC1155SupplyUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts/token/ERC1155/utils/ERC1155Receiver.sol";


contract ampersand is Initializable, ERC1155Upgradeable, OwnableUpgradeable, ERC1155SupplyUpgradeable {
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() initializer {}

    function initialize() initializer public {
        __ERC1155_init("");
        __Ownable_init();
        __ERC1155Supply_init();
    }

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

//event TransferSingle




//we can  use  " event "     uri  feature to function uri which is same  URI
    function uri(uint256  _id)
    public override  view returns (string memory){

    }


/**we can use either calldata or memory **/


/**
     * @dev Transfers `amount` tokens of token type `id` from `from` to `to`.
     *
     * Emits a {TransferSingle} event.
     *
     * Requirements:
     *
     * - `to` cannot be the zero address.
     * - `from` must have a balance of tokens of type `id` of at least `amount`.
     * - If `to` refers to a smart contract, it must implement {IERC1155Receiver-onERC1155Received} and return the
     * acceptance magic value.
     */
 // Emits a {TransferSingle} event. ERC-1155
    function safeTransferFrom(address _from,
     address _to, uint256 _id, 
     uint256 _value, 
     bytes calldata _data )
    public override 
    /**i dont know "external;" used or not **/{
 
    }

 // ERC-1155
    function balanceOf(address _owner,
     uint256 _id)
    public override view returns (uint256) 
    /** i don't know "external view returns (uint256[] memory);used or not **/{
    
    }

// ERC-1155
    function setApprovalForAll(
    address _operator,
    bool _approved )
    public override
    /**external;**/ {

    }

    function isApprovedForAll(
    address _owner,
    address _operator ) 
    public override view returns (bool isOperator)
    /**external view returns (bool);**/{
    }




//Recevier
    function onERC1155Received(address _operator, 
    address _from, uint256 _id,
     uint256 _value, 
     bytes calldata _data ) 
    internal
     /**here i'm used internal command cas getting when i used external comd**/
    /**external returns(bytes4);**/ {
    }



//minting
    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
    {
        _mint(account, id, amount, data);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address operator, address from, address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        internal
        override(ERC1155Upgradeable, ERC1155SupplyUpgradeable)
    {
        super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
    }
}
