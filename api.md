# API

Type annotations (`:integer` etc) are provided here for reference but cannot be used in a script.

### Conventions

- All function names in `camelCase` are also available in `lowercase`
- All times are expressed in **milliseconds**
- All blocking functions start with `wait`

## General

### `time()`

Return time in milliseconds since script started, or last time `resetTime` was called. 

```lua
if time() > 20 * 1000 then
    -- It has already been 20 seconds!
end
```

### `resetTime()`

Alias: `resettime`

Reset time to 0. 

### `wait(ms: integer)`

Pause current thread of execution for `ms` milliseconds. Argument can be omitted to wait for a single frame. 

```lua
dostuff()
wait(1000)  -- wait for 1 second
dostuff()
```

### `start(func: function)`

Start a new thread executing the given function `func`. Thread starts immediately. Return the new thread (`coroutine`).

```lua
-- Start a thread that calls dostuff 10 times and stops
start(function()
    for i=1, 10 do
        dostuff()
            wait(1000)
    end
end)

-- Script continues to run in parallel
```

### `delay(ms: integer, func: function)`

Call the function `func` after `ms` milliseconds. Unlike `wait`, execution of the current thread is not blocked.

```lua
-- Delay inline function
delay(1000, function()
    -- This is called 1 second later
end)

-- Delay a named function
delay(1000, restart)
```

### `print(...)`

Print one or several values to the emulator console. Has no effect on device. 

```lua
print("string")
print(1)
print(myvar, myvar2)
```

## Keys

Keys are identified by numbers between 1 and 10. Calling any key-related function with indices outside the [1-10] range has no effect. 

### **`down(key: integer, ...)`**

If any of the given keys are currently pressed down, return the first one. Otherwise return false.

```lua
if down() then
    -- Any key is currently pressed down
end

if down(1) then
    -- Key 1 is currently pressed down
end

local key = down(1, 6)
if key then
    -- key is whichever key is currently pressed down. 
    -- If both are pressed down, only the lower index one is returned (1)
end
```

### **`press(key: integer)`**

If any of the given keys were just pressed down, return the first one. Otherwise return false.

Works the same way as `down` with the difference that it returns a value only during the frame were the key was **pressed**, not after.

### **`release(key: integer)`**

If any of the given keys were just released, return the first one. Otherwise return false.

Works the same way as `down` with the difference that it returns a value only during the frame were the key was **released**, not after.

### **`hold(key: integer, ms: integer): boolean`**

Return true if `key` was held down for at least `ms` milliseconds

```lua
if hold(1, 1000) then
    -- Key was pressed down for at leaast 1 second
end
```

### **`waitPress([key: integer, ...)`**

Alias: `waitpress`

Wait until any of the keys passed as arguments are pressed. Return which was pressed first.

```lua
k = waitPress()
k = waitPress(1)
k = waitPress(1, 6)
```

### **`waitRelease(key: integer, ...)`**

Alias: `waitrelease`

Wait until any of the keys passed as arguments are released. Return which was released first.

```lua
k = waitRelease()
k = waitRelease()
k = waitRelease(1, 6)
```

### **`setColor(key: integer, color: color)`**

Alias: `setcolor`

Set key color immediately.

```lua
setColor(1, 0xff0000)
setColor(2, color.rgb(0,1,0))
```

### **`fadeColor(key: integer, color: color, ms: integer)`**

Alias: `fadecolor`

Fade key from its current color for `ms` milliseconds. Note that this is not a blocking function. 

```lua
fadeColor(1, 0xff0000, 500)
fadeColor(2, color.rgb(0,1,0), 500)
```

### **`flashColor(key: integer, color: color, ms: integer)`**

Alias: `flashcolor`

Flash key for `ms` milliseconds and progressively revert to original color.

```lua
setColor(1, 0xff0000)  -- Key is set to red
flashColor(1, 0xffffff, 500)  -- Key flashes instantly to white
wait(500)  -- Flash animation makes it to back to red
```

## Events

Events are special functions that are called automatically if they are defined. 

⚠️ Blocking functions (`wait`, …) cannot be used inside an event. 

### **`onUpdate(ms: number)`**

Called every frame, passing the elapsed frame time as argument.

```lua
function onUpdate(ms)
    -- Loop here
end
```

### **`onPress(key: integer)`**

Called when a key is pressed down.

```lua
function onPress(key)
    -- A key was pressed
end
```

### **`onRelease(key: integer)`**

Called when a key is released.

```lua
function onRelease(key)
    -- A key was released
end

```

### **`onTap(key: integer)`**

Called when a key is pressed and released shortly after.

```lua
function onTap(key)
    -- A key was tapped
end
```

### **`onMenuPress()`**

Called when menu button is pressed down.

```lua
function onMenuPress()
    -- Menu button pressed
end
```

### **`onMenuRelease()`**

Called when menu button is released.

```lua
function onMenuRelease()
    -- Menu button released
end
```

### **`onMenuTap()`**

Called when menu button is pressed and released shortly after.

```lua
function onMenuTap()
    -- Menu button tapped
end
```

### **`addListener(listener: table)`**

Register a table which keys are function callbacks. This is useful to listen to key events or receive updates temporarily. 

```lua
addListener({
    onMenuTap = function()
    end
})
```

### **`removeListener(listener: table)`**

Unregister listener previously registered with `addListener`

```lua
local l = addListener({
    ...
})
removeListener(l)
```

## Color

### `color.mul(a: color, b: color)`

Multiply two colors.

### `color.add(a: color, b: color)`

Add two colors.

### `color.mix(a: color, b: color, k: number)`

Mixes (blend) between two colors.

### `color.rgb(r: number, g: number, b: number)`

Construct a new color from 3 components between 0 and 1.

### `color.hsl(h: number, s: number, l: number)`

Construct a new color from hue, saturation and lightness values between 0 and 1.

## Table

All standard Lua `table.*` functions are supported, see https://www.lua.org/manual/5.4/manual.html#6.6. 

In addition, the following extensions are provided :

### `table.shuffle(t: table)`

Randomize elements in the table (uses math.random)

### `table.clear(t: table)`

Empty the the table, equivalent of table = {} without allocations

### `table.contains(t: table, v) : boolean`

Return true if the table contains the given value.

## Math

All standard Lua `math.*` functions are supported, see https://www.lua.org/manual/5.4/manual.html#6.7.
