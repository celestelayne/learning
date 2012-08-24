# Asteroids!

Thursday (8/23/12)

We're making asteroids now.


1. Make an asteroids class. It's not an UIView, but an NSObject
	- Position
	- Direction (for animation)
	- It should have its own CALayer where it can be drawn.

2. Add asteroids to a GameView. (The main view).
	- Add an init to create asteroids and add them to the layer.
	- To start, don't even animate them. Just have them staticly show up.

3. It should handle touch events. 
	- It should go asteroid by asteroid. See if the touch is in the layer's frame. If so, erase the asteroid.

### Steps
1. Draw nonmoving asteroids.
2. Touch to destroy asteroids.
3. Start moving the asteroids.
There's a difference between the presentation layer and the model layer. An ateroid, as it's moving, has two parts. The model layer is updated immediately when it animates. The presentation layer.
- Use a timer. 
4. Add a ship layer. If a ship is hit by the asteroid, destroy the ship.
5. Moving ship?







