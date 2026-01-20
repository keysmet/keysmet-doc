
# Motion

Functions to access device motion and orientation data.

### `motion.enable(enabled: boolean)`

Enables or disables motion sensing.

```lua
motion.enable(true)  -- Start motion sensing
```

### `motion.accelx(), motion.accely(), motion.accelz()`

Returns filtered acceleration in g (9.81 m/s²) for each axis.

```lua
local x = motion.accelx()  -- Get filtered X acceleration
```

### `motion.rawaccelx(), motion.rawaccely(), motion.rawaccelz()`

Returns raw (unfiltered) acceleration in g for each axis.

```lua
local raw_x = motion.rawaccelx()  -- Get raw X acceleration
```

### `motion.speedx(), motion.speedy(), motion.speedz()`

Returns integrated velocity in m/s for each axis.

```lua
local speed = motion.speedx()  -- Get X velocity
```

### `motion.spinx(), motion.spiny(), motion.spinz()`

Returns angular velocity in rad/s around each axis.

```lua
local spin = motion.spinx()  -- Get rotation rate around X axis
```

### `motion.pitch(), motion.roll(), motion.tilt()`

Returns device orientation in radians.
- pitch: forward/backward tilt
- roll: left/right tilt  
- tilt: absolute tilt angle

```lua
local angle = motion.pitch()  -- Get forward/backward tilt
```