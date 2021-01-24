pragma solidity >=0.6.0 <0.7.5;

import "./LandCrowdSale.sol";

contract Business {
    
    struct businessDetails {
        string name;
        address ownerAddress;
        uint landBlockId;
        uint nftId;
        uint rent;
        string link;
        string lastMileStone;
        string currentMileStone;
        uint rentDate;
        bool rentDue;
    }
    
    mapping(uint => businessDetails[]) public nftsBusiness;
    
    LandCrowdSale _landCrowdSale;
    
    constructor(address _landSale) public {
        _landCrowdSale = LandCrowdSale(_landSale);
    }
    
    function getSharesDetails(uint _nftId, uint _landBlockId) public view returns (
        uint nftId, 
        uint landBlockId,
        address owner,
        bool available,
        bool onLoan,
        address loanedOwner,
        uint cleanlinessScore,
        uint aavegotchiId,
        uint loanDeadLine
    ) {
        return _landCrowdSale.sharesdetails(_nftId, _landBlockId - 1);
    }
    
    function getNftDetails(uint _nftId) public view returns (
        uint id,
        string memory name,
        string memory symbol,
        address admin,
        address erc20Holdable,
        uint sqft,
        uint pricePerSqft,
        uint monthlyRent,
        string memory image,
        uint sqftRemaining,
        uint shareCounter
    ) {
        return _landCrowdSale.nftDetails(_nftId);
    }
    
    function installBusiness (
        uint _nftId,
        uint _landBlockId,
        string memory _name,
        string memory _link,
        string memory _lastMileStone,
        string memory _currentMileStone,
        uint _rent
    ) public {
        nftsBusiness[_nftId].push(businessDetails( _name, msg.sender, _landBlockId, _nftId, _rent, _link, _lastMileStone, _currentMileStone, block.timestamp + 30 * 86400, false));
    }
}