# ObjectPool

A prefab for easily creating pools of
objects that can be reused.

# Usage

1.
Locally activating the 'Spawn' trigger
inside the  Spawner object's animator will
spawn the first PooledObject in the
Instances object for all clients.

2.
PooledObjects can be duplicated as many
times as desired to specify the max number
of instances in the pool.

3.
Please see the Toybox sample scene for
complex usages of this prefab.

# Notes

VRC_ObjectSync objects that start disabled
will fail to synchronize across clients.
As a result, pooled objects that start in
the pool disabled must be disabled by
having all their individual meshes and
colliders disabled instead.

# Known Bugs

If multiple clients attempt to draw from
the pool at the same time, it is possible
that only a single object will be spawned.