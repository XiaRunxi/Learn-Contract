// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract Finance{

    //可见性 public internal external private

    uint256 public money=0;
    uint256 internal money1=0;//默认
    uint256 private  money3=0;

    //函数可见性public internal private external p
    function addMoney(uint256 _money) external  {
        money=_money;
    }
    //可访问性 view pure
    function getMoney() external view returns(uint256){
        return money;
    }

    function compute(uint256 a,uint256 b) internal  pure returns (uint256){
        return a+b;
    }

    function getComputes(uint256 a,uint256 b)public pure returns (uint256){
        // 由于是external 不允许合约内部访问
        // return compute(a, b);
    }

    //存储位置 
    //memory 临时存储 函数调用结束后 数据内容会清空
    //storage 永久存储在区块链上 默认
    //calldata 存储外部函数调用时传入的数据 
    function exampleFunction(uint256 _param1,uint256[] memory _param2)public pure  returns (uint256){
         uint256 num=_param1+10+_param2[0];
         return num;
    }

    //异常处理 revert assert  require
    function exampleFunction(uint256 _value)external pure {
        require(_value > 0, "Value must be greater than 0");
        _value=100;
    }
}
contract ChildFinance is Finance{

    function getMoneys() public view returns (uint256){
        return money;
    }

    function getCompute(uint256 a,uint256 b) external pure returns (uint256){
         return super.compute(a,b);
    }

}
// contract Stake{
//     uint256 money=0;
//     function curUserMoney(address user) public {
//         money=Finance(user).money;
//     }
// }
