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
//slab[0] = 500; slab[1] = 400; slab[2] = 300 ....
//slabTotal[0] = 500 ; slabTotal[1] = 900
    function depositByUser(uint _amount) public {
        userDeposit memory user = depositAmount[msg.sender];
        uint bal = user.balance;
        uint userSlab = user.level;

        if(bal >= slabTotal[4]){
            user.balance += _amount;
            depositAmount[msg.sender] = user;
        }
        else{        
            uint total = slabTotal[userSlab];
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

}