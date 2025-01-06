
# Lua Tips 


### 1-Based Indexes (arrays start from 1, not 0)
```lua
local arr = { "apple", "banana", "cherry" }
print(arr[1])  -- "apple" (not arr[0] like in C#/JS)
```

---

### No `++` or `--` (must use explicit addition or subtraction)
```lua
local x = 5
x = x + 1  -- Increment (no x++)
```

---

### String Concatenation with `..` instead of `+`
```lua
local name = "Lua"
print("Hello, " .. name)  -- "Hello, Lua"
```

---

### `"elseif"` instead of `"else if"`
```lua
local y = 10
if y == 5 then
    print("y is 5")
elseif y == 10 then  -- one word: "elseif"
    print("y is 10")
else
    print("y is something else")
end
```

---

### Functions are First-Class Values
```lua
local function sayHello()
    print("Hello!")
end
local greet = sayHello  -- Function assigned to variable
greet()  -- "Hello!"
```

---

### Variables are Global by Default Unless Declared `local`
```lua
x = 10  -- Global variable
local z = 20  -- Local variable
```

---

### Tables are Used for Arrays, Dictionaries, and Objects
```lua
local arr_table = { "one", "two", "three" }  -- Array-like table
local dict_table = { name = "Lua", version = 5.4 }  -- Key-value pairs
print(dict_table["name"])  -- "Lua"
```

---

### No `null`—Use `nil`
```lua
local a = nil  -- Represents no value (similar to null)
print(a)  -- "nil"
```

---

### No `for each` or `for in`—Use `pairs`/`ipairs`
```lua
local t = { "apple", "banana", "cherry" }
for index, value in ipairs(t) do
    print(index, value)  -- Iterates through array elements
end
```

---

### `~=` for "not equal" Instead of `!=`
```lua
if y ~= 5 then
    print("y is not equal to 5")
end
```

---

### `"do"` and `"end"` Instead of Braces for Blocks
```lua
do
    print("Inside the block")
end
```

---

### `"and"` and `"or"` Instead of `&&` and `||`
```lua
if y > 0 and x < 20 then
    print("Both conditions met")
end
```

---

### No `switch` Statement—Use `if/elseif/else`
```lua
local value = 3
if value == 1 then
    print("One")
elseif value == 2 then
    print("Two")
else
    print("Something else")
end
```

---

### `#` for Length of Tables (Arrays)
```lua
local arr_len = { "a", "b", "c" }
print(#arr_len)  -- 3
```

---

### Assigning `nil` to a Key Removes it from a Table
```lua
local fruits = { apple = "red", banana = "yellow" }
fruits.apple = nil  -- Removes "apple" key
print(fruits.apple)  -- "nil"
```

---

### No Ternary Operator (Use `and/or` Trick)
```lua
local max_val = (x > y) and x or y  -- Picks the larger of x or y
print(max_val)
```

---
