Fionna's AI Pets Pack v1.2


Changelog:
UPdates to ReadMe only:  link to Toybox updated, and note on AI Optimizing

2018-11-24
by Fionna#5639

This prefab shows a few fun things you can do with AI, animators, PropSpawner, etc for npcs in your worlds.  

Open the example scene in this package to see all the examples. There is a LOT of fun stuff you can do with AI to make your world NPCs interesting and reactive.

PREREQUISITES:
You will need to import Standard Assets from the Unity Store
You will need to import the VRChat SDK
Included is the necessary components from Hardlight's Toybox, but you may want to see the full package.  It is available here:
 https://www.dropbox.com/s/k0hui254bx4ozzv/VRCPrefabToyboxV2.1.unitypackage?d%3D0&sa=D&ust=1546832203029000&usg=AFQjCNHTbE_6lzcHv007nGB-YYmB0rG_3A

------------------------------
Basic AI
-------------------------------
1. To use the basic AI script, import Standard Assets and make sure you get the Cameras and Characters packages.

2. Either drag the Standard Assets "AIThirdPersonController" prefab with Ethan into the scene, or add the "AI Character Control" script to an existing object or model.  

TIP: The animator controller that is added to the same object as the AI Character Controller is purely visual! The AI Character control ONLY affects the transform of that object. (It also provides input into the example ThirdPersonAnimatorController parameters and blend tree which you can use in some cases.)  However, the script will throw a log error if it is left blank, so if you do not require any visual animations for your AI, just put an empty animator in here to keep it happy.

3. In the AI Character Control script, drag something into the Target field.  This is what the AI will try to reach.

4. Go to Window--Navigation.  This is where all the NavMesh info is kept that your AI will use to determine where it can go.  There are a lot of useful settings to tweak in here, so if you want to know more, go look at some basic Unity AI tutorials online or play around.  For most purposes you can leave the settings as is.  

5. Select all the surfaces that you want your AI to walk on or around and set them to Navigation Static in the upper corner of your Inspector window.  If the object is static but NOT walkable (like water), go to the Navigation window, Object tab, and select "Not Walkable".  It uses mesh renderers, not colliders, for nav meshes.

6. Go to the Bake tab and press Bake.  You will see the walkable surface now in light blue.

You can test non-VRC trigger AI behavior in Play mode in Unity. Make sure your AI is going where you want it to go.  You can adjust the speed and other parameters.  If you are having issues with a bumpy surface like Terrain, you can change the angles of your Nav Mesh agent.  Feel free to ping me on discord with questions, these can be finicky.

TIP: if you are using the Standard Assets example and your AI keeps hovering in a jump pose, go into the animator controller and delete the transition to 'Airborne'.

TIP: If your AI won't move at all, it may be because it can't find a path to its Target, or the Target field is empty.  Move the target somewhere the AI can reach.

NOTE: the AI script is only a way to move the transform.  It does not really require any visual thing in that game object.  So unless you want to use the animator or blend trees in the Standard Assets script, you can easily put your animated NPC as a child with its own animator controller, which I have done in some cases to make it easier to swap out models.


OPTIMIZATION: Since this prefab was made, it has come to my attention that setting the AI target to a zero position within itself is potentially laggy for many AI.  A better way to stop AI is to set the AI speed to 0.

---------------------------------------
AI Targets
---------------------------------------
With a static target, your AI reaches it and...stops.  That's no fun.  How do you keep your AI moving, or give it other places to go?

Here are some basic options.
- Animate the target 
- Make the target a child of the AI and use it like a "carrot on a stick" so that your AI randomly wanders around
- Use Animation Events to change the AI's target to different game objects.
- Make the target something that moves! Like a pickup, or the players.

-----------------------
Examples
-----------------------
Starting from simplest to most complicated:

AI_With_Seat_and_Animated_Target
---------------------------------
The turtle example is simply a basic AI with the Target that animates its path.  I've put a chair on the turtle so you can ride it. 

Wandering_AI_with_Attention
------------------------------
The cat example uses a Target that has its own "carrot on a stick" type animation.  AI will stand still when the Target is centered on the AI object.  It will move forward if the Target is in front, and turn if the Target is to the side.  So the wandering target just has a looping clip where the target is forward, then a bit off to the right or left.  You can make your own "wandering" clips to suit your needs.

The cat then has a collider around it that detects players.  If a player gets close to the cat, it switches to an animation where the target is centered on the cat so that the AI is still.  

NOTE: This example uses a separated animator controller for the cat and the AI objects.  You use triggers to detect when the cat should stop its running animation and switch to an idle, etc.  The important thing to remember here is to set the Culling Mode of the Animator to Always Animate.  Otherwise if someone isn't looking at the cat, it will not change animation and may be stuck in idle mode when the AI is moving, for example.

Wandering_AI_with_BlendTree
----------------------------
This AI is just the Standard Assets example, but the "Ethan" character has been replaced with the Sardine.  The controller has been modified to take away the crouch and Airborne transitions.  If you have a model with imported animations for various movement, you can drag these right into the blend tree!  The script will automatically set which animation is used based on whether the AI is turning, moving fast, slow, or still.  In this example I've replaced all the animations with the left, right, and forward swim animations that came with the free Sardine asset.  You can download animations from Mixamo for your custom humanoid characters, for example. 

AI_Pickup
----------------------------
This example is very similar to the cats in "Bathhouse Utopia - The Tranquil Sanctuary".  This one gets rather complicated.  If you want to be able to move an AI object through other means than the AI script, you have to take care.  If you somehow get an object with active AI Character Control off a navmesh, the script will start throwing constant errors and will lag players very badly.  You need to put certain safeguards in place to make sure that doesn't happen.

These safeguards are:
- Only enable NavMesh Agent and AI Character Control when the object is on a navmesh.
- Put in triggers to disable these components if you are moving them through physics or pickups
- Put colliders around the navmesh to prevent accidental drops or pushes

In this example, I use Custom Triggers and Animation Events to handle some behaviors.  If you want to learn about these kinds of methods, I suggest watching the tutorials from CyanLaser who covers these aspects for VRChat. https://www.youtube.com/channel/UCbYvGm2fLq180dVjclfJW4Q

For example, OnPickup, the rabbit has to do the following things:
- disable the NavMesh Agent (otherwise the rabbit will be "stuck" to the floor)
- disable the AI Character Controller (otherwise it will throw TONS of errors once the object is off the navmesh)
- Enable Kinematic (otherwise the object will be stuck in the vertical orientation)
- Set the correct visual animation
- Set the AI Target to itself so that it's not trying to get anywhere

Then reverse these once the navmesh is detected.

To make sure the AI components are ONLY turned on when the gameobject is on a navmesh, I've used a collider that detects the floor layer.  In this example I've used "Water", but usually I would use a custom layer.  Note that you can put the rabbit on its head and it won't detect the floor.  You have to play around a bit with collider positions to make sure the object is pickupable and still has all the detector colliders it needs.

Spawned AI
-----------------------
1. The doge example from my world "Bless the Rains" is included in this prefab.  It uses HardLight's Toybox v2.0.  Look in that package for the instructions on how to set up PlayerTracking and PropSpawner.

2. In this case, there is a special setup to keep the spawned dog from being too jittery with VRC_Object_Sync.  The events in the PropSpawner->SpawnedItem->Events->OwnerEvents->Setup turns on the FollowTarget on the DogeTarget for just the local player. See the example in the scene. 

3. If you want to have the spawned pet have changing animations, also add that object with the triggers to the enable in Setup so that it is local, and broadcast the animator triggers. 

NOTE: You can also have non-spawned AI use the Player Handle as a target.  You will have to work out whether the effect is purely local (commonly used for dungeon enemies), or if you want to sync the NPCs so that they only follow one player at a time.  You can look in Hardlight's Toybox for more complicated examples of this, or ping me on discord for help.  



-----------
This tutorial contains a number of assets available for free on the Unity Asset store, included in the Animals folder.


