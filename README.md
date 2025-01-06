# Keysmet Programming Guide

Join the [Discord server](https://discord.gg/kYZQket7BS) for community support and sharing.

## Hardware Features

Keysmet includes:
- 10 programmable keys with RGB LEDs
- Built-in accelerometer for motion detection
- Audio synthesis capabilities
- Bluetooth connectivity
- USB interface

See the respective API documentation for detailed information on using these features.

## Getting Started

1. Go to [keysmet.io](https://keysmet.io/script)
2. Use the script editor on the right to write your code
3. Test your creation in the emulator on the left
4. Connect your device via Bluetooth or USB for live coding

## Documentation

- [API Reference](./api.md) - General API documentation
- [Motion API](./motion.md) - Motion and accelerometer features
- [Synth API](./synth.md) - Audio synthesis and music creation


## Lua
Keysmet uses Lua 5.4 as programming language. Check the documentation for a more detailed overview. Only a few specific aspects of Lua are covered here.

- [Lua tips](./lua-tips.md)
- [Lua cheatsheet](https://devhints.io/lua)
- [Lua 5.4 Reference Manual](https://www.lua.org/manual/5.4/)

### Variables

Variables are global by default unless declared with `local`:

```lua
a = 1  -- global variable
if condition then
    b = 1  -- also global
    local c = 1  -- local to this block
end
-- a and b are defined, c is undefined
```

### Tables

- Table indices start at 1 (not 0)
- Use the `#` operator to get table length
- Tables can function as both arrays and dictionaries

```lua
local t = { 1, 2, 3 }
print(t[1])  -- prints 1
print(t[#t]) -- prints 3
```

There are two major ways to iterate over elements in a table:
```lua
local t = { 1, 2, 3 }

-- Using #
for i=1, #t do
    print(i, t[i])
end

-- Using ipairs
for i, v in ipairs(t) do
    print(i, v)
end
```

### Control Structures

Code blocks are closed with `end`, not braces or indentation:

```lua
if condition then
    -- Conditional code
end

while true do
    -- Infinite loop
end

for i=1, 10 do
    -- Counts from 1 to 10 (inclusive)
end

do 
    -- Code block for local scope
    local x = 1
end
```

## Script structure

A script is run only once after it is loaded. Functions are defined in the order in which they appear in the script.
To create animations, two methods are available, using `onUpdate` or a combination of `while` + `wait`.

### Best Practices

1. Always use `wait()` in infinite loops to prevent blocking
2. Place function definitions before any infinite loops
3. Use local variables when possible to avoid naming conflicts
4. Break complex scripts into smaller functions


### Main loop with `onUpdate`

This is the standard way to create animations in most programming environments and game engines.

The `onUpdate` function, if defined, is called every frame automatically, indefinitely:

```lua
function onUpdate(dt)
    -- Called every frame with delta time in milliseconds
end
```

⚠️ Note that because this function is an **event** (as indicated by its name starting with *`on`*) blocking functions cannot be used inside it, or inside any functions called from it. 

The limitation of this approach is that, if your script has several states, you have to manually keep track of which state you’re in:

```lua
function onUpdate()
    if state == INTRO then
        updateIntro()
    else
        updateGame()
    end
end
```

### Infinite loops

Another approach is to split your program in separate chunks of blocking loops:

```lua
-- Intro sequence
while not press() do
    -- Run intro animation
    wait()
end

-- Main game loop
while true do
    -- Game logic
    wait()
end
```

Here the `wait()` is necessary to prevent getting stuck in a blocking infinite loop. This is true for loops started at the top level, or in threads using `start`. 

Calling `wait()` without an argument is equivalent to `wait(0)`, which means, *wait for one frame*. 

It is possible to exit infinite loops using `break`:

```lua
while true do
    if press(1) then
        break
    end
    wait()
end
```

⚠️ Note that functions placed after infinite loops are never defined, and cannot be called:

```lua
while true do
    -- code
    wait(10)
end

-- This function will never be called because the main script never reaches this point
function onPress(k)
end
```


### Threading

Though blocking functions cannot be used in events, it's possible to start new threads that can use blocking functions. This is particularly useful for:

1. Running multiple animations in parallel
2. Starting sequences in response to events
3. Managing multiple independent game mechanics

Threads are created using the `start()` function and run until their function returns:

```lua
function onPress(key)
    -- This won't work:
    -- wait(1000)  -- Error: cannot use wait in events!
    
    -- But this works:
    start(function()
        wait(1000)
        setColor(key, 0xff0000)
    end)
end
```

Multiple threads can run simultaneously:

```lua
-- Blink key 1 every second
start(function()
    while true do
        setColor(1, 0xff0000)
        wait(1000)
        setColor(1, 0)
        wait(1000)
    end
end)

-- Blink key 2 every 500ms
start(function()
    while true do
        setColor(2, 0x00ff00)
        wait(500)
        setColor(2, 0)
        wait(500)
    end
end)
```

Threads stop when their function returns:

```lua
start(function()
    setColor(1, 0xff0000)
    wait(1000)
    setColor(1, 0)
    -- Thread stops here
end)

-- This thread stops immediately because there's no wait()
start(function()
    setColor(2, 0xff0000)
end)
```
