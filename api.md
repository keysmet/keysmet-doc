
# API

Note: Type annotations are provided here but cannot be used in a script.

## Events

This functions are called automatically if they are defined.

```lua
-- Called when a key is pressed down
onPress(key : integer)

-- Called when a key is released
onRelease(key : integer)

-- Called when a key is pressed and released shortly after
onTap(key : integer)

-- Called when menu button is pressed down
onMenuPress(key : integer)

-- Called when menu button is released
onMenuRelease(key : integer)

-- Called when menu button is pressed and released shortly after
onMenuTap(key : integer)

-- Called every frame, passing the elapsed time as argument
onUpdate(ms : number)

-- Register a table which keys are function callbacks
addListener(listener: table)

-- Unregister listener previously registered with `addListener`
removeListener(listener: table)
```

## General

```lua
-- Get absolute time in seconds since script started
time()

-- Reset script absolute time to 0
resetTime()

-- Pause current thread for `ms` milliseconds
wait(ms: integer)

-- Start a new thread executing the given function `func`
start(func: function)

-- Call a function after `ms` milliseconds
delay(ms: integer, func: function)

-- Print one or several values to the console
print(...)

```

## Keys

```lua
-- Return true if `key` is currently pressed down
keyDown(key: integer)

-- Return true if `key` was just pressed down
keyPressed(key: integer)

-- Return true if `key` was just released
keyReleased(key: integer)

-- Set key color
setColor(key: integer, color: integer)

-- Fade key from its current color for `ms` milliseconds
fadeColor(key: integer, color: integer, ms: integer)

-- Flash key for `ms` milliseconds and progressively revert to previous state
flashColor(key: integer, color: integer, ms: integer)
```

## Color

```lua
-- Multiply two colors
color.mult(a: integer, b: integer)

-- Add two colors
color.add(a: integer, b: integer)

-- Mixes (blend) between two colors.
color.mix(a: integer, b: integer, k: number)

-- Construct a new color from 3 components
color.rgb(r: number, g: number, b: number)

-- Construct a new color from 3 HSL components
color.hsl(h: number, s: number, l: number)
```

## Lua math

```lua
-- Compute the absolute value of a number.
math.abs(x: number)

-- Compute the arc cosine of a number.
math.acos(x: number)

-- Compute the arc sine of a number.
math.asin(x: number)

-- Compute the arc tangent of a number.
math.atan(x: number)

-- Compute the arc tangent of the quotient of two numbers.
math.atan2(y: number, x: number)

-- Round a number to the nearest integer.
math.ceil(x: number)

-- Compute the cosine of a number.
math.cos(x: number)

-- Compute the hyperbolic cosine of a number.
math.cosh(x: number)

-- Compute the exponential of a number.
math.exp(x: number)

-- Round a number down to the nearest integer.
math.floor(x: number)

-- Compute the remainder of the division of two numbers.
math.fmod(x: number, y: number)

-- Compute the square root of a number.
math.sqrt(x: number)

-- Compute the base-10 logarithm of a number.
math.log10(x: number)

-- Compute the natural logarithm of a number.
math.log(x: number)

-- Return the maximum value from a list of numbers.
math.max()

-- Return the minimum value from a list of numbers.
math.min()

-- Raises a number to a power.
math.pow(x: number, y: number)

-- Round a number to the nearest integer, using "round half away from zero" rounding.
math.round(x: number)

-- Generate a pseudo-random number between 0 and 1.
math.random()

-- Generate a pseudo-random integer between two specified numbers.
math.random(m: integer, n: integer)

-- Set the seed for the random number generator.
math.randomseed(seed: integer)
```