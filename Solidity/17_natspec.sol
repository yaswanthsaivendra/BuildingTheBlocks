//natspec
//natspec is a specification for writing documentation to functions in solidity.

pragma solidity >=0.5.0 <0.6.0;

/// @title A contract for basic math operations
/// @author H4XF13LD MORRIS 💯💯😎💯💯
/// @notice For now, this contract just adds a multiply function
contract Math {
  /// @notice Multiplies 2 numbers together
  /// @param x the first uint.
  /// @param y the second uint.
  /// @return z the product of (x * y)
  /// @dev This function does not currently check for overflows
  function multiply(uint x, uint y) public pure returns (uint z) {
    // This is just a normal comment, and won't get picked up by natspec
    z = x * y;
  }
}


// @title, @author @param, @return are self explanatory.
// @notice  - for users,    @devs   - for developers.