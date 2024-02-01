# Keysmet Programming Guide

Join the [Discord server](https://discord.gg/FB8kF5ye)

## API

- [api.md](./api.md)

## Examples

- [Basic examples](https://keysmet.io/user/keysmet)

## Lua

- [Lua cheatsheet](https://devhints.io/lua)
- [Lua 5.4 Reference Manual](https://www.lua.org/manual/5.4/)

## Tips / Common mistakes

### Functions should be placed before infinite loop

If you are defining an infinite while loop, put it at the very end of the script to make sure all functions are defined before it is called 

```lua
while true do
    -- code
    wait(10)
end

-- This function will never be called because the main script never reaches this point
function onPress(k)
end
```
