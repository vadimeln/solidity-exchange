// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.7;

contract Offer{
    address owner;
    uint8 tokenIn; // токен, НА который владелец обменивает
    uint8 tokenOut; // токен, КОТОРЫЙ владелец обменивает
    uint8 amountIn; // сколько владелец хочет других токенов за свои
    uint8 amountOut; // сколько владелец готов отдать за токены
    bool isAvailable;
    
    // ВНИМАНИЕ
    // ВРЕМЕННО убран модификатор onlyOwner на функциях setAmountIn и setAmountOut
    // Нужно найти способ получать адрес человека, а не контракта биржи в msg.sender!
    constructor(address _owner, uint8 _tokenIn, uint8 _tokenOut,uint8 _amountIn, uint8 _amountOut){
        owner = _owner;
        tokenIn = _tokenIn;
        tokenOut = _tokenOut;
        amountIn = _amountIn;
        amountOut = _amountOut;
        isAvailable = true;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Nigger alarm");
        _;
    }

    modifier onlyAvailable(){
        require(isAvailable == true, "Outdated offer");
        _;
    }

    function setAmountIn(uint8 _amountIn)public onlyAvailable{
        amountIn = _amountIn;
    }

    function setAmountOut(uint8 _amountOut)public onlyAvailable{
        amountOut = _amountOut;
    }

    function getInfo() public view  returns(uint8[4] memory){
        return [tokenIn, tokenOut, amountIn, amountOut];
    }

    function getOwner() public view  returns(address){
        return owner;
    }

}

    interface OfferInterface{
    
    function setAmountIn(uint8 _amountIn) external;

    function setAmountOut(uint8 _amountOut) external;

    function getInfo() external view returns(uint8[4] memory);

    function getOwner() external view returns(address);

}
