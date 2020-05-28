# Animator Health Pool v2

A configurable health pool backed by an animator.
Allows health to be displayed on an animated health bar and events to be triggered at arbitrary health intervals

# Changes

v2:

- Health bar will now be healed when using
  a negative damage scale.

# Animator Paramters

- Damage
  Activate to inflict damage

- DamageScale:
  The amount of damage to inflict

- Sync
  Activate to manually set health - used for synchronization

- SyncPercent
  Percent of health to sync to - ranging from 0 to 1

- Health
  Unused. For visualization purposes only

* The remaining parameters are used internally

# Animations

- HealthBarFill
Used to animate the health bar and trigger events. The start of the animation represents full health. The halfway point of the animation represents 0 health. The remaining half goes unused, but must be there for technical reasons. For best results, set all the animation curves in this animation to linear.

- HealthBarFillRed
Used to animate the red portion of the health bar that lingers after taking damage. Should be setup similar to the HealthBarFill animation.

- HealthBarInvulnerableTimer
Specifies the amount of time the health pool is invulnerable after taking damage. Drag the last keyframe to set the total duration. If no invulnerability is desired, simply replace this animation with an empty one.

- HealthBarRedTimer
Specifies the amount of time the red portion of the health bar lingers. Drag the last keyframe to set the total duration.

- HealthBarTimeCurve
Specifies how much health is contained in the health pool. Drag the last keyframe to set the maximum health value.

* The remaining animations are used internally

# Notes

Do not place a VRC_ObjectSync on the health pool. It will likely have undefined behavior.

Precision errors can potentially cause health triggers to not trigger until 1 hit later than expected (e.g. there is 0.0001 health remaining, but the trigger occurs at exactly 0). If you would like to avoid this, set your health trigger to activate at a slightly higher health value.

Avoid the use of MasterBufferOne sync events unless you expect people to join the room mid fight. Always opt for MasterUnbuffered when possible.

Avoid syncing to the exact health value that triggered the sync event. This could potentially cause a sync loop making it impossible to damage the health pool further. Instead, sync to a slightly lower health value or set your sync trigger at a slightly higher value.

Sync events will force all clients to sync to the health value specified. Any surplus damage applied when the event was triggered will be discarded. In general, sync events for small health pools should be limited only to when the health pool reaches 0.

If 2 damage events are triggered on the same health pool on exactly the same frame, it is likely 1 will be dropped. In this event, there is no guarantee that the health pool will remain synchronized across clients.

# Bugs

Applying damage to a health pool with the DamageScale modifier greater or equal to the pool's maximum health can potentially cause the health pool to wrap around back to full.