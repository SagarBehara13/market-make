pragma solidity >=0.6.0 <0.7.5;

import "./token/ShareToken.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract LandRFT is ERC721{
    
    address owner;
    uint landCounter = 0;
    
    struct NFTDetails {
        uint id;
        string name;
        string symbol;
        address admin;
        uint sqft;
        uint pricePerSqft;
        uint monthlyRent;
        uint image;
    }
    
    struct NFTShares {
        uint id;
        address owner;
        uint shares;
        bool onLoan;
        address loanedOwner;
    }
    
    ShareToken[] public shareTokens;
    
    modifier onlyOwner {
      require(msg.sender == owner);
      _;
   }
    
    constructor()  ERC721("LAND", "LND") public {
        owner = msg.sender;
    }
    
    function _mint(string memory _name, string memory _symbol, uint _totalSupply) public onlyOwner {
        landCounter++;
        ShareToken _shareToken = new ShareToken(_name, _symbol, _totalSupply);
        shareTokens.push(_shareToken);
        address(_shareToken);
  
        _mint(msg.sender, landCounter);
    }
    
    function getERC20Name(uint id) public view returns(string memory) {
        return shareTokens[id].returnName();
    }
    
    function approveCrowdSale(uint amount,uint id) public onlyOwner {
        shareTokens[id].approve(address(this), amount);
    }
    
    function buyShare(uint amount, uint id) public {
        shareTokens[id].transferFrom(address(this), msg.sender, amount);
    }
}