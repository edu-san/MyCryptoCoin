pragma solidity ^0.4.0;

contract Cancoin
{
    mapping(address=>uint) balances;
    uint256 supply;
    mapping(address => mapping(address=>uint)) approved;
    
    
    // ERC20 function
    function totalSupply() constant returns (uint256 totalSupply){
        return supply;
    }
    
    function balanceOf(address _owner) constant returns (uint256 balance){
        return balances[_owner];
    }
    
    function transfer(address _to,uint256 _value)  returns (uint256 value){
        if(balances[msg.sender] >= _value && _value > 0)
        {
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            
            return _value;
        }
        else
        {
            return 0;
        }
    }
    
   function transferFrom(address _from, address _to, uint _value) returns (bool success)
   {
       if(balances[_from] >= _value && _value > 0 && approved[_from][msg.sender] >= _value)
       {
           approved[_from][msg.sender] -= _value;
           balances[_from] -= _value;
           balances[_to] += _value;
           return true;
       }
       else
       {
           return false;
       }
   }
    
     function allowance(address _owner, address _spender) constant returns (uint256 remaining)
     {
         return approved[_owner][_spender];
     }
    
    function approve(address _spender, uint256 _value) returns (bool success)
    {
         if (balances[msg.sender] > _value)
        {
            approved[msg.sender][_spender] = _value;
            return true;
        }
        return false;
    }
    
    
    //My functions
    function mint(uint256 numberofcoins)
    {
        balances[msg.sender] += numberofcoins;
        supply += numberofcoins;
    }
    
    function getMyBalance() returns (uint256) {
        return balances[msg.sender];
    }
    
    
   
}
