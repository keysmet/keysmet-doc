# API

Type annotations (`:integer` etc) are provided here for reference but cannot be used in a script.

### Conventions

- All function names in `camelCase` are also available in `lowercase`
- All times are expressed in **milliseconds**
- All blocking functions start with `wait`

## General

### `time()`

Returns time since script started (in milliseconds), or last time `resetTime` was called.

```lua
if time() > 20 * 1000 then
    -- It has been 20 seconds!
end
```

### `resetTime()`

Alias: `resettime`

Reset time to 0.

### `wait(ms: integer)`

Pauses the current thread of execution for `ms` milliseconds. Argument can be omitted to wait for a single frame.

```lua
dostuff()
wait(1000)  -- wait for 1 second
dostuff()
```

### `start(func: function): thread|false`

Starts a new thread executing the given function `func`. Thread starts immediately. Returns the new thread (`coroutine`) if successful, or false if the thread fails to start.

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

### `delay(ms: integer, func_or_thread: function|thread)`

Calls the function or resumes the thread after `ms` milliseconds. Unlike `wait`, execution of the current thread is not blocked.

```lua
-- Delay inline function
delay(1000, function()
    -- This is called 1 second later
end)

-- Delay a named function
delay(1000, restart)
```

### `print(...)`

Prints one or several values to the emulator console. Has no effect on device.

```lua
print("string")
print(1)
print(myvar, myvar2)
```

### `restart()`

Restarts the script from the beginning.

## Keys

Keys are identified by numbers between 1 and 10. Calling any key-related function with indices outside the [1-10] range has no effect.

![keymap](https://github.com/keysmet/keysmet-doc/assets/1499344/d23ac875-1895-46fa-bff9-083ef430fabf)

### `down([key: integer, ...])`

If any of the given keys are currently pressed down, returns the first one. Otherwise returns false.

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

### `press([key: integer, ...])`

If any of the given keys were just pressed down, returns the first one. Otherwise returns false.

Works the same way as `down` with the difference that it returns a value only during the single frame where the key was **pressed**.

### `release([key: integer, ...])`

If any of the given keys were just released, returns the first one. Otherwise returns false.

Just like `press`, it returns a value only during the single frame where the key was **released**.

### `hold(key: integer, ms: integer): boolean`

Returns true if `key` was held down for at least `ms` milliseconds. The default hold threshold is set to 500ms.

```lua
if hold(1, 1000) then
    -- Key was pressed down for at least 1 second
end
```

### `waitPress([key: integer, ...])`

Alias: `waitpress`

Waits until any of the keys passed as arguments are pressed. Returns which was pressed first.

```lua
k = waitPress()  -- Waits until any key is pressed
k = waitPress(1)  -- Waits until key 1 is pressed
k = waitPress(1, 6)  -- Waits until key 1 or 6 is pressed
```

### `waitRelease([key: integer, ...])`

Alias: `waitrelease`

Wait until any of the keys passed as arguments are released. Returns which was released first.

```lua
k = waitRelease() -- Waits until any key is released  
k = waitRelease(1) -- Waits until key 1 is released
k = waitRelease(1, 6) -- Waits until key 1 or 6 is released
```

### `setColor(key: integer, color: color)`

Alias: `setcolor`

Sets key color immediately. Color can be specified in multiple formats:
- Hexadecimal integer: `0xRRGGBB`
- Hexadecimal string: `"#ff00ff"` or `"ff00ff"`
- RGB function: `color.rgb(r, g, b)` with values 0-1
- HSL function: `color.hsl(h, s, l)` with values 0-1

```lua
setColor(1, 0xff0000)  -- Red using hex integer
setColor(2, "#00ff00") -- Green using hex string
setColor(3, color.rgb(0, 0, 1))  -- Blue using RGB
setColor(4, color.hsl(0.5, 1, 0.5))  -- Cyan using HSL
```

### `fadeColor(key: integer, color: color, ms: integer)`

Alias: `fadecolor`

Fades key from its current color to target color over `ms` milliseconds. Note that this is not a blocking function.

```lua
fadeColor(1, 0xff0000, 500)  -- Fade to red over half a second
fadeColor(2, color.rgb(0,1,0), 500)  -- Fade to green
```

### `flashColor(key: integer, color: color, ms: integer)`

Alias: `flashcolor`

Flashes key to target color and fades back to original color over `ms` milliseconds.

```lua
setColor(1, 0xff0000)  -- Key is set to red
flashColor(1, 0xffffff, 500)  -- Key flashes to white
-- After 500ms, key returns to red
```

## Color
Colors can be constructed in various ways:
```lua
-- Hexadecimal integer notation: 0xRRGGBB
setColor(1, 0xff00ff)

-- Hexadecimal string notation, common on the web
-- See for example https://www.w3schools.com/colors/colors_picker.asp
setColor(2, "#ff00FF")

-- The leading # is optional
setColor(3, "ff00FF")

-- Using color.rgb
setColor(4, color.rgb(1, 0, 1))

-- in HSL mode
setColor(4, color.hsl(5/6, 1, .5))
```

### `color.mul(a: color, b: color) : color`

Constructs a new color by multiplying `a` and `b`.

### `color.add(a: color, b: color) : color`

Constructs a new color by adding `a` and `b`.

### `color.mix(a: color, b: color, t: number) : color`

Constructs a new color by mixing `a` and `b` according to `t`.
- If `t` is `0`, returns `a`
- If `t` is `1`, returns `b`
- If `t` is `0.5`, returns a 50% mix between `a` and `b`

### `color.rgb(r: number, g: number, b: number)`

Constructs a new color from 3 components between `0` and `1`.

### `color.hsl(h: number, s: number, l: number)`

Constructs a new color from hue, saturation and lightness values between `0` and `1`.

## Events

Events are special functions that are called automatically if they are defined.

⚠️ Blocking functions (`wait`, etc.) cannot be used inside events.

### `onUpdate(dt: number)`

Called every frame with elapsed time `dt` in milliseconds.

```lua
function onUpdate(dt)
    -- Called every frame
end
```

### `onPress(key: integer)`

Called when a key is pressed down.

```lua
function onPress(key)
    -- A key was pressed
end
```

### `onRelease(key: integer)`

Called when a key is released.

```lua
function onRelease(key)
    -- A key was released
end
```

### `onTap(key: integer)`

Called when a key is pressed and released within 200ms.

```lua
function onTap(key)
    -- A key was tapped
end
```

### `onMenuPress()`

Called when menu button is pressed.

### `onMenuRelease()`

Called when menu button is released.

### `onMenuTap()`

Called when menu button is tapped (pressed and released within 200ms).

### `addListener(listener: table)`

Registers a table which keys are function callbacks. This is useful to listen to key events or receive updates temporarily. All top-level events are supported as keys of the listener table. 

```lua
addListener({
    onUpdate = function(dt) end,
    onPress = function(key) end
})
```

### `removeListener(listener: table)`

Unregisters a previously added listener.

```lua
local l = addListener({
    ...
})
removeListener(l)
```

## Table

All standard Lua `table.*` functions are supported, see https://www.lua.org/manual/5.4/manual.html#6.6. 

In addition, the following extensions are provided.

### `table.choice(t: table): any`

Returns a random element from the table.

### `table.shuffle(t: table)`

Randomizes table elements using math.random.

### `table.clear(t: table)`

Empties the table without creating a new table.

### `table.contains(t: table, v): boolean`

Returns true if table contains value v.

## Math

All standard Lua `math.*` functions are supported, see https://www.lua.org/manual/5.4/manual.html#6.7.

### `math.lerp(a: number, b: number, t: number): number`

Linearly interpolates between `a` and `b` using `t` (0-1).

```lua
local half = math.lerp(0, 100, 0.5)  -- returns 50
```
