# Guide de programmation Keysmet

Rejoignez le [serveur Discord](https://discord.gg/kYZQket7BS) pour le support de la communauté et le partage.

## Caractéristiques matérielles

Keysmet comprend :
- 10 touches programmables avec LED RGB
- Accéléromètre intégré pour la détection de mouvement
- Capacités de synthèse audio
- Connectivité Bluetooth
- Interface USB

Consultez la documentation API respective pour des informations détaillées sur l'utilisation de ces fonctionnalités.

## Premiers pas

1. Allez sur [Keysmet script editor](https://keysmet-script.web.app/script)
2. Utilisez l'éditeur de script à droite pour écrire votre code
3. Testez votre création dans l'émulateur à gauche
4. Connectez votre appareil via Bluetooth ou USB pour le codage en direct

## Documentation

- [Référence API](./api.md) - Documentation API générale
- [API Mouvement](./motion.md) - Fonctionnalités de mouvement et d'accéléromètre
- [API Synth](./synth.md) - Synthèse audio et création musicale

## Lua

Keysmet utilise Lua 5.4 comme langage de programmation. Consultez la documentation pour un aperçu plus détaillé. Seuls quelques aspects spécifiques de Lua sont couverts ici.

- [Astuces Lua](./lua-tips.md)
- [Aide-mémoire Lua](https://devhints.io/lua)
- [Manuel de référence Lua 5.4](https://www.lua.org/manual/5.4/)

### Variables

Les variables sont globales par défaut sauf si elles sont déclarées avec `local` :

```lua
a = 1  -- variable globale
if condition then
    b = 1  -- également globale
    local c = 1  -- locale à ce bloc
end
-- a et b sont définies, c est indéfinie
```

### Tables

- Les indices de table commencent à 1 (pas 0)
- Utilisez l'opérateur `#` pour obtenir la longueur de la table
- Les tables peuvent fonctionner comme des tableaux et des dictionnaires

```lua
local t = { 1, 2, 3 }
print(t[1])  -- affiche 1
print(t[#t]) -- affiche 3
```

Il existe deux principales façons d'itérer sur les éléments d'une table :
```lua
local t = { 1, 2, 3 }

-- Utilisation de #
for i=1, #t do
    print(i, t[i])
end

-- Utilisation de ipairs
for i, v in ipairs(t) do
    print(i, v)
end
```

### Structures de contrôle

Les blocs de code sont fermés avec `end`, pas avec des accolades ou l'indentation :

```lua
if condition then
    -- Code conditionnel
end

while true do
    -- Boucle infinie
end

for i=1, 10 do
    -- Compte de 1 à 10 (inclus)
end

do
    -- Bloc de code pour la portée locale
    local x = 1
end
```

## Structure du script

Un script n'est exécuté qu'une seule fois après son chargement. Les fonctions sont définies dans l'ordre dans lequel elles apparaissent dans le script.
Pour créer des animations, deux méthodes sont disponibles, en utilisant `onUpdate` ou une combinaison de `while` + `wait`.

### Bonnes pratiques

1. Utilisez toujours `wait()` dans les boucles infinies pour éviter le blocage
2. Placez les définitions de fonctions avant toute boucle infinie
3. Utilisez des variables locales lorsque c'est possible pour éviter les conflits de noms
4. Divisez les scripts complexes en fonctions plus petites

### Boucle principale avec `onUpdate`

C'est la façon standard de créer des animations dans la plupart des environnements de programmation et moteurs de jeu.

La fonction `onUpdate`, si elle est définie, est appelée automatiquement à chaque image, indéfiniment :

```lua
function onUpdate(dt)
    -- Appelée à chaque image avec le temps delta en millisecondes
end
```

⚠️ Notez que parce que cette fonction est un **événement** (comme indiqué par son nom commençant par *`on`*), les fonctions bloquantes ne peuvent pas être utilisées à l'intérieur, ou à l'intérieur de toutes les fonctions appelées depuis celle-ci.

La limitation de cette approche est que, si votre script a plusieurs états, vous devez suivre manuellement l'état dans lequel vous vous trouvez :

```lua
function onUpdate()
    if state == INTRO then
        updateIntro()
    else
        updateGame()
    end
end
```

### Boucles infinies

Une autre approche consiste à diviser votre programme en morceaux séparés de boucles bloquantes :

```lua
-- Séquence d'introduction
while not press() do
    -- Exécuter l'animation d'introduction
    wait()
end

-- Boucle de jeu principale
while true do
    -- Logique du jeu
    wait()
end
```

Ici, le `wait()` est nécessaire pour éviter de rester bloqué dans une boucle infinie bloquante. C'est vrai pour les boucles démarrées au niveau supérieur, ou dans les threads utilisant `start`.

Appeler `wait()` sans argument équivaut à `wait(0)`, ce qui signifie *attendre une image*.

Il est possible de sortir des boucles infinies en utilisant `break` :

```lua
while true do
    if press(1) then
        break
    end
    wait()
end
```

⚠️ Notez que les fonctions placées après les boucles infinies ne sont jamais définies et ne peuvent pas être appelées :

```lua
while true do
    -- code
    wait(10)
end

-- Cette fonction ne sera jamais appelée car le script principal n'atteint jamais ce point
function onPress(k)
end
```

### Threading

Bien que les fonctions bloquantes ne puissent pas être utilisées dans les événements, il est possible de démarrer de nouveaux threads qui peuvent utiliser des fonctions bloquantes. Ceci est particulièrement utile pour :

1. Exécuter plusieurs animations en parallèle
2. Démarrer des séquences en réponse à des événements
3. Gérer plusieurs mécaniques de jeu indépendantes

Les threads sont créés à l'aide de la fonction `start()` et s'exécutent jusqu'à ce que leur fonction retourne :

```lua
function onPress(key)
    -- Ceci ne fonctionnera pas :
    -- wait(1000)  -- Erreur : impossible d'utiliser wait dans les événements !

    -- Mais ceci fonctionne :
    start(function()
        wait(1000)
        setColor(key, 0xff0000)
    end)
end
```

Plusieurs threads peuvent s'exécuter simultanément :

```lua
-- Faire clignoter la touche 1 toutes les secondes
start(function()
    while true do
        setColor(1, 0xff0000)
        wait(1000)
        setColor(1, 0)
        wait(1000)
    end
end)

-- Faire clignoter la touche 2 toutes les 500ms
start(function()
    while true do
        setColor(2, 0x00ff00)
        wait(500)
        setColor(2, 0)
        wait(500)
    end
end)
```

Les threads s'arrêtent lorsque leur fonction retourne :

```lua
start(function()
    setColor(1, 0xff0000)
    wait(1000)
    setColor(1, 0)
    -- Le thread s'arrête ici
end)

-- Ce thread s'arrête immédiatement car il n'y a pas de wait()
start(function()
    setColor(2, 0xff0000)
end)
```
