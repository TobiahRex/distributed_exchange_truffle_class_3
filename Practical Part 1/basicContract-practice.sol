pragma solidity ^0.4.13;

contract secondContract {
  uint public number = 0;

  function increaseNumber() {
    number += 1;
  }

  function thisThrowsARevert() {
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

  function callSecondContractWithTransfer() payable {
    _secondContract.transfer(msg.value);
  }

  function changeWithRever() {
    _secondContract.increaseNumber();
    revert();
  }

  function safeWithdraw(uint amount) {
    require(balance[msg.sender] >= amount);
    require(balance[msg.sender] - amount <= balance[msg.sender]);
    balance[msg.sender] -= amount;
    msg.sender.transfer(amount);
  }

}
