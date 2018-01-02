pragma solidity ^0.4.13;

contract secondContract {
  uint public number = 0;

  function increaseNumber() {
    number += 1;
  }

  function thisThrowsARever() {
    rever();
  }

  function() payable {
    thisThrowsARevert();
  }
}

contract TestRevertAssert {

  secondContract _secondContract;

  function TestRevertAssert() {
    _secondContract = new secondContract();
  }

  mapping(address => uint) balance; // balance = { [address]: 23 }

  function throwInSecondContract() {
    _secondContract.thisThrowsARevert();
  }
}
