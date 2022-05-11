// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

import '@openzeppelin/contracts/utils/math/SafeMath.sol';
import '@openzeppelin/contracts/utils/math/SignedSafeMath.sol';

contract Caller {
    using SafeMath for uint256;
    using SignedSafeMath for int256;
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function getCaller() public view returns (address) {
        return (msg.sender);
    }

    function callWithNoReturn() public view {
        // do nothing
    }

    function callReturnUint() public pure returns (uint256, uint256[] memory) {
        uint256[] memory _uint = new uint256[](2);
        _uint[0] = 0;
        _uint[1] = 1000000000000000000;

        return (123, _uint);
    }

    function callReturnBool() public pure returns (bool, bool, bool[] memory, bool[2][3] memory) {
        bool[] memory _bool = new bool[](3);
        _bool[0] = true;
        _bool[1] = true;
        _bool[2] = false;

        return (true, false, _bool, [[true, true], [true, false], [false, false]]);
    }

    function callNegateBoolArray(bool[] memory value) public pure returns (bool[] memory) {
        for (uint i = 0; i < value.length; i++) {
            value[i] = !value[i];
        }
        return value;
    }

    function callSumUintArray(uint256[] memory value) public pure returns (uint256, uint256[] memory) {
        uint256 sum = 0;
        for (uint256 i = 0; i < value.length; i++) {
            sum = sum + value[i];
        }
        return (sum, value);
    }

    function callDecreaseInt(int256[] memory value) public pure returns (int256[] memory) {
        for (uint256 i = 0; i < value.length; i++) {
            value[i] = value[i] - 1;
        }
        return value;
    }

    function callFlattenAddressArray(address[][2] memory value) public pure returns (address[] memory) {
        address[] memory _address = new address[](value[0].length + value[1].length);
        uint256 idx0 = 0;

        for (idx0; idx0 < value[0].length; idx0++) {
            _address[idx0] = value[0][idx0];
        }
        for (uint256 idx1 = 0; idx1 < value[1].length; idx1++) {
            _address[idx0 + idx1] = value[1][idx1];
        }

        return _address;
    }

    function callReturnMixed() public view returns (int256, uint256, bool, string memory, address, address payable) {
        return (- 1, 0, false, "false", address(this), owner);
    }

    function callReturnMixed(int256 _int, uint256 _uint, bool _bool, string calldata _string, address _address) public pure returns (int256, uint256, bool, string calldata, address) {
        return (_int, _uint, _bool, _string, _address);
    }

    struct TestStruct {
        address payable _address;
        bool _bool;
    }

    function callReturnStruct(uint256 _uint, TestStruct calldata _struct) public pure returns (uint256, address payable, bool) {
        return (_uint, _struct._address, _struct._bool);
    }

    struct TestStructBytes {
        address payable _address;
        bytes[] _bytesArray;
        bytes2 _bytes2;
        bytes _bytes;
    }

    function callReturnStruct(uint256 _uint, TestStructBytes calldata _struct) public pure returns (uint256, address payable, bytes[] calldata, bytes2, bytes calldata) {
        return (_uint, _struct._address, _struct._bytesArray, _struct._bytes2, _struct._bytes);
    }

    function callReturnStructArray(TestStructBytes[] calldata _struct, uint256 _uint) public pure returns (address payable, address payable, uint256) {
        return (_struct[0]._address, _struct[1]._address, _uint);
    }

    struct StructWithNestedStruct {
        TestStruct _a;
        bool _b;
        TestStructBytes _c;
    }

    function callReturnNestedStruct(StructWithNestedStruct calldata _struct) public pure returns (bool, bool, bytes calldata) {
        return (_struct._a._bool, _struct._b, _struct._c._bytes);
    }
}
