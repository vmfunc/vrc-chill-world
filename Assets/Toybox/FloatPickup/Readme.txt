# Floater Anchor v1

A small prefab to make rigid body objects
float in the air a small distance above
the ground.

# Layers

UserLayer22: Respawn Boundary

# Usage

1.
Your object must be assigned to the
following references:

- FloatAnchor.FollowTarget.Target
- FloatAnchor.ConfigurableJoint.Connected Body
- FloatSpring.FollowTarget.Target
- FloatSpring.ConfigurableJoint.Connected Body
- FloatAnchorLimit.FollowTarget.Target

2.
Additionally, if the physics object is a
VRC_Pickup, then the following triggers
are also necessary:

OnPickup (local)
  ActivateCustomTrigger -> Floater.OnPickup

OnDrop (local)
  ActivateCustsomTrigger -> Floater.OnDrop

3.
Finally, place a large trigger volume on
UserLayer22 at the bottom of the world
above the standard respawn boundary to
ensure the object can respawn properly.
