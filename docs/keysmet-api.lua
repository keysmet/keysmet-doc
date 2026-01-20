-- See https://luals.github.io/wiki/settings/
---@meta

--- Returns time since script started or last resetTime call
--- @return number milliseconds
function time()
end

--- Reset time to 0
function resetTime()
end

--- Pauses the current thread of execution
--- @param ms? integer milliseconds
function wait(ms)
end

--- Waits until the provided function returns true
--- @param func function
--- @param ... any additional arguments passed to func
function waitUntil(func, ...)
end

--- Starts a new thread executing the given function
--- @param func function
--- @return thread|false
function start(func)
end

--- Calls the function or resumes the thread after delay
--- @param ms integer milliseconds
--- @param func_or_thread function|thread
function delay(ms, func_or_thread)
end

--- Prints values to the emulator console
--- @param ... any
function print(...)
end

--- Restarts the script from the beginning
function restart()
end

--- Checks if specified keys are pressed down
--- @param ... integer key indices
--- @return integer|false first pressed key or false
function down(...)
end

--- Checks if specified keys were just pressed
--- @param ... integer key indices
--- @return integer|false first pressed key or false
function press(...)
end

--- Checks if specified keys were just released
--- @param ... integer key indices
--- @return integer|false first released key or false
function release(...)
end

--- Checks if key was held for duration
--- @param key integer
--- @param ms integer milliseconds
--- @return boolean
function hold(key, ms)
end

--- Waits for specified keys to be pressed
--- @param ... integer key indices
--- @return integer first pressed key
function waitPress(...)
end

--- Waits for specified keys to be released
--- @param ... integer key indices
--- @return integer first released key
function waitRelease(...)
end

--- Sets key color immediately
--- @param key integer
--- @param color number|string
function setColor(key, color)
end

--- Fades key to target color
--- @param key integer
--- @param color number|string
--- @param ms integer duration in milliseconds
function fadeColor(key, color, ms)
end

--- Flashes key to color and fades back
--- @param key integer
--- @param color number|string
--- @param ms integer duration in milliseconds
function flashColor(key, color, ms)
end

color = {}

--- Multiplies two colors
--- @param a number|string color
--- @param b number|string color
--- @return number
function color.mul(a, b)
end

--- Adds two colors
--- @param a number|string color
--- @param b number|string color
--- @return number
function color.add(a, b)
end

--- Mixes two colors
--- @param a number|string color
--- @param b number|string color
--- @param t number mix factor 0-1
--- @return number
function color.mix(a, b, t)
end

--- Creates RGB color
--- @param r number red 0-1
--- @param g number green 0-1
--- @param b number blue 0-1
--- @return number
function color.rgb(r, g, b)
end

--- Creates HSL color
--- @param h number hue 0-1
--- @param s number saturation 0-1
--- @param l number lightness 0-1
--- @return number
function color.hsl(h, s, l)
end

--- Returns random element from table
--- @param t table
--- @return any
function table.choice(t)
end

--- Randomizes table elements
--- @param t table
function table.shuffle(t)
end

--- Empties the table
--- @param t table
function table.clear(t)
end

--- Checks if table contains value
--- @param t table
--- @param v any
--- @return boolean
function table.contains(t, v)
end

--- Linear interpolation
--- @param a number
--- @param b number
--- @param t number interpolation factor 0-1
--- @return number
function math.lerp(a, b, t)
end

motion = {}

--- Enables/disables motion sensing
--- @param enabled boolean
function motion.enable(enabled)
end

--- Returns filtered X acceleration
--- @return number acceleration in g
function motion.accelx()
end

--- Returns filtered Y acceleration
--- @return number acceleration in g
function motion.accely()
end

--- Returns filtered Z acceleration
--- @return number acceleration in g
function motion.accelz()
end

--- Returns raw X acceleration
--- @return number acceleration in g
function motion.rawaccelx()
end

--- Returns raw Y acceleration
--- @return number acceleration in g
function motion.rawaccely()
end

--- Returns raw Z acceleration
--- @return number acceleration in g
function motion.rawaccelz()
end

--- Returns X velocity
--- @return number velocity in m/s
function motion.speedx()
end

--- Returns Y velocity
--- @return number velocity in m/s
function motion.speedy()
end

--- Returns Z velocity
--- @return number velocity in m/s
function motion.speedz()
end

--- Returns X angular velocity
--- @return number angular velocity in rad/s
function motion.spinx()
end

--- Returns Y angular velocity
--- @return number angular velocity in rad/s
function motion.spiny()
end

--- Returns Z angular velocity
--- @return number angular velocity in rad/s
function motion.spinz()
end

--- Returns pitch angle
--- @return number angle in radians
function motion.pitch()
end

--- Returns roll angle
--- @return number angle in radians
function motion.roll()
end

--- Returns tilt angle
--- @return number angle in radians
function motion.tilt()
end

synth = {}

--- Creates new synth voice
--- @param config? table Configuration parameters
--- @return integer voice ID
function synth.new(config)
end

--- Play note or sequence on voice
--- @param voice integer
--- @param note integer|string|table MIDI note number, note name, or sequence
--- @param duration? integer Duration in milliseconds
function synth.note(voice, note, duration)
end

--- Play chord or sequence on voice
--- @param voice integer
--- @param notes table Array of notes
--- @param duration? integer Duration in milliseconds
function synth.chord(voice, notes, duration)
end

--- Set tempo for synchronized playback
--- @param bpm number Beats per minute
--- @param subdivs integer Subdivisions per beat
--- @param callback? function Called on each subdivision
function synth.tempo(bpm, subdivs, callback)
end

--- Create synchronized musical sequence
--- @param voice integer
--- @param callback function Sequence callback function
function synth.sequence(voice, callback)
end

--- Event: Called every frame
--- @param dt number Time elapsed in milliseconds
function onUpdate(dt)
end

--- Event: Called when key is pressed
--- @param key integer
function onPress(key)
end

--- Event: Called when key is released
--- @param key integer
function onRelease(key)
end

--- Event: Called when key is tapped
--- @param key integer
function onTap(key)
end

--- Event: Called when menu button is pressed
function onMenuPress()
end

--- Event: Called when menu button is released
function onMenuRelease()
end

--- Event: Called when menu button is tapped
function onMenuTap()
end

--- Register event listener
--- @param listener table Table of event callbacks
function addListener(listener)
end

--- Unregister event listener
--- @param listener table Previously registered listener
function removeListener(listener)
end