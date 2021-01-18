pragma solidity >=0.6.0 <0.8.0;

import "../interfaces/IERC20.sol";
import "@openzeppelin/contracts/math/SafeMath.sol";

contract ShareToken is IERC20 {
    string  public name;
    string  public symbol;
    uint public tokenPrice;
    uint256 totalSupply_;
    
    using SafeMath for uint256;
    
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    event Transfer(address indexed from, address indexed to, uint tokens);
    
    mapping(address => uint256) balances;
    mapping(address => mapping (address => uint256)) allowed;
    
    constructor(string memory _name, string memory _symbol, uint256 total) public {
        totalSupply_ = total;
        balances[msg.sender] = totalSupply_;
        name = _name;
        symbol = _symbol;
        
        approve(msg.sender, total);
    }
    
    function totalSupply() public override view returns (uint256) {
       return totalSupply_;
    }
    
    function balanceOf(address tokenOwner) public override view returns (uint256) {
        return balances[tokenOwner];
    }
    
    function transfer(address receiver, uint256 numTokens) public override returns (bool) {
        require(numTokens <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender].sub(numTokens);
        balances[receiver] = balances[receiver].add(numTokens);
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }
    
    function approve(address delegate, uint256 numTokens) public override returns (bool) {
        allowed[msg.sender][delegate] = numTokens;
        emit Approval(msg.sender, delegate, numTokens);
        return true;
    }
    
    function allowance(address owner, address delegate) public override view returns (uint) {
        return allowed[owner][delegate];
    }
    
    function transferFrom(address owner, address buyer, uint256 numTokens) public override returns (bool) {
        require(numTokens <= balances[owner]);
        require(numTokens <= allowed[owner][msg.sender]);
        balances[owner] = balances[owner].sub(numTokens);
        allowed[owner][msg.sender] = allowed[owner][msg.sender].sub(numTokens);
        balances[buyer] = balances[buyer].add(numTokens);
        emit Transfer(owner, buyer, numTokens);
        return true;
    }
    
    function buyShare(address owner, address buyer, uint256 numTokens) public returns (bool) {
        require(numTokens <= balances[owner]);
        require(numTokens <= allowed[owner][msg.sender]);
        balances[owner] = balances[owner].sub(numTokens);
        allowed[owner][msg.sender] = allowed[owner][msg.sender].sub(numTokens);
        balances[buyer] = balances[buyer].add(numTokens);
        emit Transfer(owner, buyer, numTokens);
        return true;
    }
    
    function returnName() public view returns (string memory){
        return name;
    }
}


