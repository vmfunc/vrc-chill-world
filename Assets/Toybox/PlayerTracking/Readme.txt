# Player Tracking v4

A system for allowing world objects and props
to track player view position in VRChat.

# Changes

v4:

- Switched to UICanvas tracking

v3:

- Fixed bug where PlayerHandle would
  remain attached to the camera after
  leaving a world instance.

v2:

- Fixed bug in PropSpawner where players
  would spawn without props

# Known Bugs

For VR players, tracking will switch to
the player's handheld camera if it is
active.