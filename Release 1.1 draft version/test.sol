// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts-upgradeable/token/ERC1155/ERC1155Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC1155/extensions/ERC1155SupplyUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts/token/ERC1155/utils/ERC1155Receiver.sol";
import "openzeppelin-solidity/contracts/utils/math/SafeMath.sol";




contract TestToken is Initializable, ERC1155Upgradeable, OwnableUpgradeable, ERC1155SupplyUpgradeable {

  address proxyRegistryAddress;
  uint256 private _currentTokenID = 0;
  mapping (uint256 => address) public creators;
  mapping (uint256 => uint256) public tokenSupply;
  // Contract name
  string public name;
  // Contract symbol
  string public symbol;

    /**
   * @dev Require msg.sender to be the creator of the token id
   */
  modifier creatorOnly(uint256 _id) {
    require(creators[_id] == msg.sender, "ERC1155Tradable#creatorOnly: ONLY_CREATOR_ALLOWED");
    _;
  }

  
    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() initializer {
    }

    function initialize() initializer public {
        __ERC1155_init("");
        __Ownable_init();
        __ERC1155Supply_init();
    }

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

//event TransferSingle same / related to safeTransferFrom  



//we can  use  " event "     uri  feature to function uri which is same  URI
    function uri(uint256  _id)
    public override  view returns (string memory){

    }

  /**
    * @dev Returns the total quantity for a token ID
    * @param _id uint256 ID of the token to query
    * @return amount of token in existence
    */
  function totalSupply(
    uint256 _id
  ) public override view returns (uint256) {
    return tokenSupply[_id];
  }

  /**
    * @dev Creates a new token type and assigns _initialSupply to an address
    * NOTE: remove onlyOwner if you want third parties to create new tokens on your contract (which may change your IDs)
    * @param _initialOwner address of the first owner of the token
    * @param _initialSupply amount to supply the first owner
    * @param _uri Optional URI for this token type
    * @param _data Data to pass if receiver is contract
    * @return The newly created token ID
    */
  function create(
    address _initialOwner,
    uint256 _initialSupply,
    string calldata _uri,
    bytes calldata _data
  ) external onlyOwner returns (uint256) {

    uint256 _id = _getNextTokenID();
    _incrementTokenTypeId();
    creators[_id] = msg.sender;

    if (bytes(_uri).length > 0) {
      emit URI(_uri, _id);
    }

    _mint(_initialOwner, _id, _initialSupply, _data);
    tokenSupply[_id] = _initialSupply;
    return _id;
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
//(added)
    function mint(address _to, uint256 _id, 
    uint256 _quantity,
     bytes memory _data)
        public
        creatorOnly(_id)

    {
        _mint(_to, _id, _quantity, _data);
        _quantity=1;
        tokenSupply[_id] = tokenSupply[_id].add(_quantity);
    }


    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address operator, address from,
     address to, uint256[] memory ids, 
     uint256[] memory amounts, 
     bytes memory data)
        internal
        override(ERC1155Upgradeable, ERC1155SupplyUpgradeable)
    {
        super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
    }

    function _getNextTokenID() private view returns (uint256) {

     return _currentTokenID.add(1);
    }
    function _incrementTokenTypeId() private  {

     _currentTokenID++;

    }

}
