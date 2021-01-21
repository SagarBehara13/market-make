pragma solidity >=0.6.0 <0.7.5;

import "./token/SharesToken.sol";
import "./token/Nft.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract LandRFT {
    
    address owner;
    uint landCounter = 0;
    
    struct NFTDetailsStruct {
        uint id;
        string name;
        string symbol;
        address admin;
        address erc20Holdable;
        uint sqft;
        uint pricePerSqft;
        uint monthlyRent;
        string image;
        uint sqftRemaining;
        uint shareCounter;
    }
    
    struct NFTSharesStruct {
        uint nftId;
        uint landBlockId;
        address owner;
        bool onLoan;
        address loanedOwner;
        uint cleanlinessScore;
        uint aavegotchiId;
        uint loanDeadLine;
    }
    
    mapping(uint => ShareToken) public shareTokens;
    mapping(uint => NftToken) public nftTokens;
    mapping(uint => NFTDetailsStruct) public nftDetails;
    mapping(uint => mapping(address => NFTSharesStruct)) public sharesdetails;
    mapping(uint => mapping(address => uint)) public sharesCount;
    
    modifier onlyOwner {
      require(msg.sender == owner);
      _;
    }
    
    constructor() public {
        owner = msg.sender;
    }
    
    function _mint(
        string memory _name,
        string memory _symbol, 
        uint _totalSqft, 
        uint _pricePerSqft,
        uint _monthlyRent,
        string memory _image
    ) public onlyOwner {
        
        landCounter++;
        
        NftToken _nftToken = new NftToken(_name, _symbol, msg.sender, landCounter);
        nftTokens[landCounter] = _nftToken;
        
        ShareToken _shareToken = new ShareToken(_name, _symbol, _totalSqft);
        shareTokens[landCounter] = _shareToken;
        
        nftDetails[landCounter] = NFTDetailsStruct(landCounter, _name, _symbol, msg.sender, address(_shareToken), _totalSqft, _pricePerSqft, _monthlyRent, _image, _totalSqft, 0);
    }
    
     function buyShare(uint _amount, uint _nftID, uint[] memory _landBlockID) public payable {
        require(msg.sender != owner, 'Admin cannot buy shares');
        
        NFTDetailsStruct memory _nftDetails = nftDetails[_nftID];
        _nftDetails.shareCounter = _nftDetails.shareCounter + 1;
        _nftDetails.sqftRemaining = _nftDetails.sqftRemaining - _amount;
        nftDetails[_nftID] = _nftDetails;
       
        uint userShare = sharesCount[_nftID][msg.sender];
        
        for (uint i = 0; i < _landBlockID.length; i++) {
            sharesdetails[_nftID][msg.sender] = NFTSharesStruct(_nftID, _landBlockID[i], msg.sender, false, msg.sender, 0, 0, 0);
        }
        
        if (userShare > 0) {
            userShare = userShare + _amount;
            sharesCount[_nftID][msg.sender] = userShare;
        }
        
        shareTokens[_nftID].transferFrom(address(this), msg.sender, _amount);
    }
    
    // // unsed function
    // function approveCrowdSale(uint amount,uint id) public onlyOwner {
    //     shareTokens[id].approve(address(this), amount);
    // }
    
    // // helper functions
    // function getERC20Name(uint id) public view returns(string memory) {
    //     return shareTokens[id].returnName();
    // }
    
    // function getNftBalance(uint id) public view returns (string memory){
    //     return nftTokens[id].getNftName();
    // }
    
    // function nftOwner(uint id) public view returns (address) {
    //     return nftTokens[id].getNftOwner();
    // }
}