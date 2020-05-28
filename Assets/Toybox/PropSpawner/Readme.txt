# PropSpawner v2

A prefab for spawning a unique prop for
each player joining a VRC world.

The default behavior is to spawn a floating
crystal marker over each player's head.

# Dependencies

PlayerTracking

# Usage

1.
For the default crystal example,
[PlayerTracking.PlayerHandle] must be
assigned to [FloatCrystal.FollowTarget.Target]

2.
[SpawnedItem] must be assigned to the
VRC_SceneDescriptor DynamicPrefabs array.

3.
If you want to spawn props manually
instead of automatically, simply disable
the AutoSpawner animator in the Spawner
object. Then call SpawnOwned (local) on
the Spawner object to spawn the props.

4.
If you want to spawn props automatically
for firstime joiners, but also wish to be
able to despawn the props later without
them being automatically spawned again,
then replace the AutoSpawner animator
with the AutoSpawnerTimeout animator.

# Notes

Each DynamicPrefab must have a unique name.
If you have to rename the SpawnedItem object,
use the DebugInspector to also change the
name of the target object in the SpawnObject
trigger action inside the Spawner object.

The only way to interact with props using
external controls in the world (e.g. despawn
a prop by pressing a button) is to use
collider relays. See the Toybox sample
scene for an example of this kind of usage.

# Known Bugs

Selecting the SpawnObject action in the
SpawnerObject using the default inspector
will erase the reference to the SpawnedItem
object

VRC_Triggers placed inside spawned props
are highly error prone and often do not
work properly. While they are useable,
there are some rules that must be followed:

- Triggers may only target the current object
  that the trigger is on, or one of its parents.

- ActivateCustomTrigger may target any object,
  but only if it is local.