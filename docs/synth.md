# Synth

The synth module provides a simple yet powerful musical synthesizer using triangle waveforms.

## Voice Creation

### `synth.new([config: table]): integer`

Creates a new synth voice and returns its ID. Config parameters:
- `attack`: Attack time in ms (default: 1)
- `decay`: Decay time in ms (default: 1)  
- `sustain`: Sustain level 0-1 (default: 1)
- `release`: Release time in ms (default: 20)
- `bendfrom`: Starting pitch bend in semitones (default: 0)
- `bendto`: Target pitch bend in semitones (default: 0)
- `bendin`: Bend in time in ms (default: attack)
- `bendout`: Bend out time in ms (default: release)

```lua
-- Simple voice
voice = synth.new()

-- Voice with envelope
voice = synth.new({
    attack = 100,
    decay = 200,
    sustain = 0.5,
    release = 300
})

-- Voice with pitch bend
voice = synth.new({
    bendfrom = -12,  -- Start one octave down
    bendin = 500     -- Glide up over 500ms
})
```

## Note Playback

Notes can be specified as MIDI numbers (0-127) or note names ("C4", "F#3", etc).

### `synth.note(voice: integer, note: integer|string|table [, duration: integer])`

Play a note or sequence of notes on the given voice.

Without duration: note is held until released or changed
```lua
synth.note(voice, 60)        -- Hold middle C (MIDI)
synth.note(voice, "C4")      -- Same using note name
synth.note(voice, 0)         -- Release note
```

With duration: note plays for specified duration in ms
```lua
synth.note(voice, 60, 300)   -- Play for 300ms
```

Note sequences: play multiple notes in sequence
```lua
-- Equal durations
synth.note(voice, {60, 64, 67}, 300)  -- 3 notes, 300ms each

-- Variable durations (relative to base duration)
synth.note(voice, {
    {60, 2},  -- 600ms (2x base)
    {64, 1},  -- 300ms (1x base)
    {67, 0.5} -- 150ms (0.5x base)
}, 300)
```

## Chord Playback

### `synth.chord(voice: integer, notes: table [, duration: integer])`

Play multiple notes simultaneously as a chord.

Without duration: chord is held until released
```lua
synth.chord(voice, {60, 64, 67})         -- C major
synth.chord(voice, {"C4", "E4", "G4"})   -- Same using names
```

With duration: chord plays for specified time
```lua
synth.chord(voice, {60, 64, 67}, 300)    -- Play for 300ms
```

Chord sequences: play multiple chords in sequence
```lua
-- Equal durations
synth.chord(voice, {
    {60, 64, 67},  -- C major
    {62, 65, 69}   -- D minor
}, 300)

-- Variable durations
synth.chord(voice, {
    {{60, 64, 67}, 2},  -- C major for 600ms
    {{62, 65, 69}, 1}   -- D minor for 300ms
}, 300)
```

## Timing and Synchronization

### `synth.tempo(bpm: number, subdivs: integer [, callback: function])`

Set tempo for synchronized playback. BPM sets the base tempo, subdivs defines how many ticks per beat.

```lua
-- 120 BPM with 4 ticks per beat (16th notes)
synth.tempo(120, 4, function()
    -- Called every 16th note
end)
```

### `synth.sequence(voice: integer, callback: function)`

Create synchronized musical sequence using callback function.

```lua
synth.tempo(120, 4)

synth.sequence(voice, function(note)
    while true do
        note("C4", 1)    -- quarter note C
        note("E4", 0.5)  -- eighth note E
        note("G4", 0.5)  -- eighth note G
    end
end)
```