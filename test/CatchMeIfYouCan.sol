// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/CatchMeIfYouCan.sol";

contract CatchMeIfYouCanTest is Test {
    FeedDataGatherer public gatherer;
    EvilFeedContractA public evilA;
    EvilFeedContractB public evilB;
    EvilFeedContractC public evilC;
    EvilFeedContractD public evilD;
    EvilFeedContractE public evilE;
    EvilFeedContractF public evilF;
    EvilFeedContractG public evilG;

    function setUp() public {
        gatherer = new FeedDataGatherer();
        evilA = new EvilFeedContractA();
        evilB = new EvilFeedContractB();
        evilC = new EvilFeedContractC();
        evilD = new EvilFeedContractD();
        evilE = new EvilFeedContractE();
        evilF = new EvilFeedContractF();
        evilG = new EvilFeedContractG();
    }

    function encodeCall(address evilX) internal {
        // Prepare the function call
        bytes memory data = abi.encodeWithSignature("getDataFromFeed(address)", evilX);

        // Make the function call
        (bool success, bytes memory result) = address(gatherer).call(data);

        // Code to check for reverts:
        if (!success) {
            if (result.length > 0) {
                // A revert message was returned
                revert(string(result));
            } else {
                // No revert message, just "bubble up" the error (revert())
                revert();
            }
        }
    }

    function test_evilA() public {
        encodeCall(address(evilA));
    }

    function test_evilB() public {
        encodeCall(address(evilB));
    }

    function test_evilC() public {
        encodeCall(address(evilC));
    }

    function test_evilD() public {
        encodeCall(address(evilD));
    }

    function test_evilE() public {
        encodeCall(address(evilE));
    }

    function test_evilF() public {
        encodeCall(address(evilF));
    }

    function test_evilG() public {
        encodeCall(address(evilG));
    }
}
