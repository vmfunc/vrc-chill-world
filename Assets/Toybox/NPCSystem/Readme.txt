# NPC Behaviors

Simple NPC-like behaviors allowing objects
in a VRC world to react to the player's
presence

# Dependencies

PlayerTracking

# Prefabs: NPCSimple

An NPC that remains stationary. If a player
draws near, their head will turn towards
them. If multiple players draw near, they
will look at the last person to arrive.

Additional events may be triggered when a
player approaches using the OnAttentionOn
and OnAttentionOff VRC_Trigger objects

# Prefabs: NPCPathFollow

An NPC that follows a circular path. If a
player draws near, they will stop and look
at them following the same rules as the
NPCSimple prefab.

The path may be set by adjusting the nodes
inside the NavSystem->NavPath object.
