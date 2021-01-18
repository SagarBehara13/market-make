pragma solidity >=0.6.0 <0.7.5;

import "./token/ShareToken.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract LandRFT is ERC721{
    
    ShareToken[] public shareTokens;
    
    constructor()  ERC721("LAND", "LND") public {
        
    }
    
    function mint(string memory _name, string memory _symbol, uint _totalSupply, uint _id) public {
        ShareToken _shareToken = new ShareToken(_name, _symbol, _totalSupply);
        shareTokens.push(_shareToken);
        address(_shareToken);
        
        _mint(msg.sender, _id);
    }
    
    function getERC20Name(uint id) public view returns(string memory) {
        return shareTokens[id].returnName();
    }
    
    function approveCrowdSale(uint amount,uint id) public {
        shareTokens[id].approve(address(this), amount);
    }
    
    function buyShare(uint amount, uint id) public {
        shareTokens[id].transferFrom(address(this), msg.sender, amount);
    }
}