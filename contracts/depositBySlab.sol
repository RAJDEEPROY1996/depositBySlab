// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "./Ownable.sol";

interface IERC20 {
    function transferFrom(address from,address to,uint256 amount) external returns (bool);
}

contract deposit is Ownable{
    uint[5] public slab;
    uint[5] public slabTotal;
    struct userDeposit{
        uint balance;
        uint level;
    }
    mapping(address => userDeposit) public depositAmount;

    function setLevel(uint[5] calldata _amount) public onlyOwner{
        slab[0] = _amount[0];
        slabTotal[0] += _amount[0];
        for(uint i=1;i<5;i++){
            slab[i] = _amount[i];
            slabTotal[i] =slabTotal[i-1] + _amount[i];
        }
    }
//100,200,300,400,500
    function depositByUser(uint _amount) public {
        userDeposit memory user = depositAmount[msg.sender];
        uint bal = user.balance;
        if(bal)
        uint userSlab = user.level;
        uint total = Tslab[userSlab];
        uint space = total - bal;
        if(_amount > space){
            _amount -= space;
            while(_amount != 0){
                uint y = slab[userSlab+1]);
                if(_amount > y){
                    _amount = _amount - y;
                    userSlab +=1;
                }
                else{
                    user.level = userSlab+1;
                }
            }
        }

}