# Double Disc System

Equips a pair of battle discs on each player
who enters the VRC World.

# Dependencies

PlayerTracking

# Usage

1.
[PlayerTracking.PlayerHandle] must be
assigned to:

PlayerAnchor.FollowTarget.Target
PlayerAnchor.ConfigurableJoint.ConnectedBody
ButtonAnchor.FollowTarget.Target

2.
[PlayerTracking.PlayerHandle.Forward] must
be assigned to:

PlayerAnchor.LookatTarget.Target
ButtonAnchor.LookatTarget.Target

3.
[DoubleDiscSystem.SpawnedItem4] must be
assigned to:

VRC_SceneDescriptor.DynamicPrefabs

# Known Bugs

If the player rapidly moves their view
when entering the world, the discs may
end up misaligned on their character.

Discs may occasionally vanish and never
return after being thrown.