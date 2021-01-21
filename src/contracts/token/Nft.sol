pragma solidity >=0.6.2 <0.8.0;

import "./SharesToken.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NftToken is ERC721{ 
    string nftName;
    string nftSymbol;
    address owner;
    
    
    constructor( string memory _name, string memory _symbol, address _owner, uint id ) ERC721 ( 'Land', 'LND' ) public {
        nftName = _name;
        nftSymbol = _symbol;
        owner = _owner;
        _mint(_owner, id);
    }
    
    function getNftName () public view returns (string memory){
        return nftName;
    }
    
    function getNftSymbol () public view returns (string memory){
        return nftSymbol;
    }
    
    function getNftOwner () public view returns (address) {
        return owner;
    }
}