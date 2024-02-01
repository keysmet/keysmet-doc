
# API

Note: Type annotations are provided here for reference but cannot be used in a script.

## General

```lua
-- Get absolute time in milliseconds since script started
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
-- If any of the given keys are currently pressed down, return the first one. Otherwise return false
down(key: integer, ...)

-- If any of the given keys were just pressed down, return the first one. Otherwise return false
press(key: integer)

-- If any of the given keys were just released, return the first one. Otherwise return false
release(key: integer)

-- Return true if `key` was held down for at least `ms` milliseconds
hold(key: integer, ms: integer)

-- Wait until any of the keys passed as arguments are pressed. Return which was pressed first.
waitPress(key: integer, ...)

-- Wait until any of the keys passed as arguments are released. Return which was releasedfirst.
waitRelease(key: integer, ...)

-- Set key color
setColor(key: integer, color: integer)

-- Fade key from its current color for `ms` milliseconds
fadeColor(key: integer, color: integer, ms: integer)

-- Flash key for `ms` milliseconds and progressively revert to previous state
flashColor(key: integer, color: integer, ms: integer)

```

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
## Lua standard api

* [table api](https://www.lua.org/manual/5.4/manual.html#6.6)
* [math api](https://www.lua.org/manual/5.4/manual.html#6.7)

On top of this the following extensions to the standard API are provied:
```lua
-- Randomize elements in the table (uses math.random)
table.shuffle(table : table)

-- Empty the the table, equivalent of table = {} without allocations
table.clear(table : table)
```
