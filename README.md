# Keysmet Programming Guide
Join the [Discord server](https://discord.gg/kYZQket7BS)

## API

See detailed [API page](./api.md)

## Examples

[Official examples](https://keysmet.io/user/keysmet)

## Lua

- [Lua cheatsheet](https://devhints.io/lua)
- [Lua 5.4 Reference Manual](https://www.lua.org/manual/5.4/)

## Program flow

A script is run only once after it is loaded. Functions are defined in the order in which they appear in the script.
To create animations, two methods are available, using `onUpdate` or a combination of `while` + `wait`.

### Main loop with `onUpdate`

This is the standard way to create animations in most programming environments and game engines.

The `onUpdate` function, if defined, is called every frame automatically, indefinitely:

```lua
function onUpdate()
	-- Code here executes every frame
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

To better control the program flow it is often useful to create an infinite loop, such as:

```lua
-- Intro
while not press() do
	-- Do something until any key is pressed...
	wait()
end

-- Game
while true do
	-- Do something indefinitely
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
