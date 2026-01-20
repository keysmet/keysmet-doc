
# Astuces Lua


### Indices commençant à 1 (les tableaux commencent à 1, pas 0)
```lua
local arr = { "apple", "banana", "cherry" }
print(arr[1])  -- "apple" (pas arr[0] comme en C#/JS)
```

---

### Pas de `++` ou `--` (il faut utiliser l'addition ou la soustraction explicite)
```lua
local x = 5
x = x + 1  -- Incrémenter (pas de x++)
```

---

### Concaténation de chaînes avec `..` au lieu de `+`
```lua
local name = "Lua"
print("Bonjour, " .. name)  -- "Bonjour, Lua"
```

---

### `"elseif"` au lieu de `"else if"`
```lua
local y = 10
if y == 5 then
    print("y vaut 5")
elseif y == 10 then  -- un seul mot : "elseif"
    print("y vaut 10")
else
    print("y vaut autre chose")
end
```

---

### Les fonctions sont des valeurs de première classe
```lua
local function sayHello()
    print("Bonjour !")
end
local greet = sayHello  -- Fonction assignée à une variable
greet()  -- "Bonjour !"
```

---

### Les variables sont globales par défaut sauf si déclarées `local`
```lua
x = 10  -- Variable globale
local z = 20  -- Variable locale
```

---

### Les tables sont utilisées pour les tableaux, dictionnaires et objets
```lua
local arr_table = { "un", "deux", "trois" }  -- Table de type tableau
local dict_table = { name = "Lua", version = 5.4 }  -- Paires clé-valeur
print(dict_table["name"])  -- "Lua"
```

---

### Pas de `null`—Utilisez `nil`
```lua
local a = nil  -- Représente l'absence de valeur (similaire à null)
print(a)  -- "nil"
```

---

### Pas de `for each` ou `for in`—Utilisez `pairs`/`ipairs`
```lua
local t = { "apple", "banana", "cherry" }
for index, value in ipairs(t) do
    print(index, value)  -- Itère sur les éléments du tableau
end
```

---

### `~=` pour "différent de" au lieu de `!=`
```lua
if y ~= 5 then
    print("y n'est pas égal à 5")
end
```

---

### `"do"` et `"end"` au lieu d'accolades pour les blocs
```lua
do
    print("À l'intérieur du bloc")
end
```

---

### `"and"` et `"or"` au lieu de `&&` et `||`
```lua
if y > 0 and x < 20 then
    print("Les deux conditions sont remplies")
end
```

---

### Pas d'instruction `switch`—Utilisez `if/elseif/else`
```lua
local value = 3
if value == 1 then
    print("Un")
elseif value == 2 then
    print("Deux")
else
    print("Autre chose")
end
```

---

### `#` pour la longueur des tables (tableaux)
```lua
local arr_len = { "a", "b", "c" }
print(#arr_len)  -- 3
```

---

### Assigner `nil` à une clé la supprime de la table
```lua
local fruits = { apple = "rouge", banana = "jaune" }
fruits.apple = nil  -- Supprime la clé "apple"
print(fruits.apple)  -- "nil"
```

---

### Pas d'opérateur ternaire (utilisez l'astuce `and/or`)
```lua
local max_val = (x > y) and x or y  -- Choisit le plus grand entre x et y
print(max_val)
```

---
