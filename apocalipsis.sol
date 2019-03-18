pragma solidity ^0.4.24;

contract Appocalipsis {
    uint256 private decimals;
    uint256 public minBid;
    uint256 public numMembers;
    string public  name;
    mapping (address => uint256) private _payments;
    mapping (address => uint256) private _outgoing;
    mapping (address => address[5]) private _uprefs;
    mapping (address => address[]) private _downrefs;

    event PaymentReceived(address indexed sender, address indexed referal, uint256 value);


    constructor() public {
       decimals = 18;
       numMembers = 0;
       name = 'Appocalipsis';
       minBid = uint256((5 * 10 ** decimals)/100);
       _uprefs[0xdFd49C767f58629f76E8CF0B4dC51D9a7aA14943] = [0xbe2c1dDA9Bd38D800339d05C4Af6E42f669634f2,
                              0x4d35b945fC3c1393c6bdc694F2b2aE7417F9b94f,
                              0x998862d717fC396777dCFF4Dc66ed6a8Ed466041,
                              0x33a65ac88c7fd111504Bb42af0443bC4d3916A0d,
                              0xdFd49C767f58629f76E8CF0B4dC51D9a7aA14943];
    }


function SendMoney(address referal) public payable returns (uint256) {
  require(msg.value >= minBid);
  if (numMembers<8000) {
    require(_payments[referal]<8);
  } else {
    require(_payments[referal]<7);
  }
  require(msg.sender != referal);
  require(referal != address(0));
  require(referal != address(this));
  require(_outgoing[msg.sender] == 0);
  numMembers = numMembers + uint256(1);
  _downrefs[referal].push(msg.sender);
  _payments[referal] = _payments[referal] + uint256(1);
  _outgoing[msg.sender] = _outgoing[msg.sender] + uint256(1);
  for (uint i = 0; i < _uprefs[referal].length; i++) {
    uint256 amount = msg.value/uint256(5);
    _uprefs[referal][i].transfer(amount);
  }
  for (i = 1; i < _uprefs[referal].length; i++) {
    _uprefs[msg.sender][i-1] = _uprefs[referal][i];
  }
  _uprefs[msg.sender][4] = msg.sender;
  emit PaymentReceived(msg.sender, referal, msg.value);
  return msg.value;
}

function numRefFirstLevel(address beneficiary) public view returns (uint256) {
  return _payments[beneficiary];

}

function meAnd4AboveMyHead(address beneficiary) public view returns (address[5]) {
  return _uprefs[beneficiary];

}

function myRefFirstLevel(address beneficiary) public view returns (address[]) {
  return _downrefs[beneficiary];

}


}
