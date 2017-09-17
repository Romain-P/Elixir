# There are also boolean operators: `or`, `and` and `not`.
# These operators expect a boolean as their first argument.
true and true #=> true
true and 1 #=> 1 and is also true
true and :hello #=> :hello and is also true
false or true #=> true

# 1 and true
#=> ** (BadBooleanError) expected a boolean on left-side of "and", got: 1

# Elixir also provides `||`, `&&` and `!` which accept arguments of any type.
# All values except `false` and `nil` will evaluate to true.
1 || true  #=> 1
false && 1 #=> false
nil && 20  #=> nil
!true #=> false

# For comparisons we have: `==`, `!=`, `===`, `!==`, `<=`, `>=`, `<` and `>`
1 == 1 #=> true
1 != 1 #=> false
1 < 2  #=> true

1 == 1.0  #=> true
1 === 1.0 #=> false

# We can also compare two different data types:
1 < :hello #=> true

# number < atom < reference < functions < port < pid < tuple < list < bit string