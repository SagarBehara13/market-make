pragma solidity >=0.5.0 <0.8.0;

import "./token/Nft.sol";

contract CreateLandNft { 
    struct tokens {
        string name;
        address tokenAddress;
    }
    
    uint counter;
    mapping(uint => tokens) public landsAddress;
    
    function _mint(
        string memory _name,
        string memory _symbol, 
        uint _id
    ) public  {
        counter++;
        NftToken _nftToken = new NftToken(_name, _symbol, msg.sender, _id);
        landsAddress[counter] = tokens(_name, address(_nftToken));
    }
}