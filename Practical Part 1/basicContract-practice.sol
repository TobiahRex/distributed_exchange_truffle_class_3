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

  function callSecondContract() payable {
    _secondContract.call.gas(100000).value(msg.value)(msg.data);
  }

  function sendFundsToSecondContract() payable {
    _secondContract.send(msg.value);
  }

  function getNumber() constant return(uint) {
    return _secondContract.number();
  }

  function changeWithoutRever() {
    _secondContract.increaseNumber();
  }

  function depositFunds() payable {
    uint new_balance = msg.value;
    require(balance[msg.sender] + msg.value >= balance[msg.sender]);
    balance[msg.sender] += new_balance;
  }
}
