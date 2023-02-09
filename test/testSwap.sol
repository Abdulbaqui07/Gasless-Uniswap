// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./ERC2771Recipient.sol";
import "./interfaces/IERC20.sol";
import "./interfaces/Uniswap.sol";

contract testSwap is ERC2771Recipient {
    uint256 deadline;
    address payable public owner;
    // address forward = 0x7A95fA73250dc53556d264522150A940d4C50238;

    //address of the uniswap v2 router
    address private constant UNISWAP_V2_ROUTER =
        0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;

    constructor(address forwarder) public {
        forwarder = 0x7A95fA73250dc53556d264522150A940d4C50238;
        _setTrustedForwarder(forwarder);
    }

    modifier onlyOwner() {
        require(_msgSender() == owner, "Only Owner");
        _;
    }

    // swap function
    function swap(
        address _tokenIn,
        address _tokenOut,
        uint256 _amountIn,
        address _to,
        uint256 _deadline
    ) external onlyOwner {
        // transfer the amount in tokens from msg.sender to this contract
        IERC20(_tokenIn).transferFrom(msg.sender, address(this), _amountIn);

        //by calling IERC20 approve you allow the uniswap contract to spend the tokens in this contract
        IERC20(_tokenIn).approve(UNISWAP_V2_ROUTER, _amountIn);

        address[] memory path;
        path = new address[](2);
        path[0] = _tokenIn;
        path[1] = _tokenOut;

        uint256[] memory amountsExpected = IUniswapV2Router(UNISWAP_V2_ROUTER)
            .getAmountsOut(_amountIn, path);

        IUniswapV2Router(UNISWAP_V2_ROUTER).swapExactTokensForTokens(
            amountsExpected[0],
            (amountsExpected[1] * 990) / 1000, // accpeting a slippage of 1%
            path,
            _to,
            _deadline
        );
    }
}
