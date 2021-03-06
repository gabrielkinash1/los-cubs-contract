// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/LosCubs.sol";

contract LosCubsTest is Test {
    LosCubs losCubs;

    function setUp() public {
        losCubs = new LosCubs("kinash/");
    }

    function testMint() public {
        losCubs.mint{value: losCubs.mintPrice() * 10}(10);
        assertEq(losCubs.balanceOf(address(this)), 10);
    }

    function testGive() public {
        losCubs.give(address(1), 10);
        assertEq(losCubs.balanceOf(address(1)), 10);
    }

    function testTokenURI() public {
        assertEq(losCubs.tokenURI(1), "kinash/1.json");
    }

    function testSetBaseURI() public {
        losCubs.setBaseURI("testing123/");
        assertEq(losCubs.tokenURI(1), "testing123/1.json");
    }

    function testSetMintPrice() public {
        uint256 newPrice = losCubs.mintPrice() / 100;
        losCubs.setMintPrice(newPrice);
        assertEq(losCubs.mintPrice(), newPrice);
    }
}