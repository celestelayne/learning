Wednesday 8/22

# CoreAnimation

Within UIView, there is a UIResponder that handles events.

A view is on the screen. When you click on the screen, it receives a touch-began function.

If you click outside of a view, it doesn't receive anything. A textField or shaking the phone is outside of the view. For a view to receive this action, it sets a firstResponder that takes information back and forth.

There is only one firstResponder at a time.


First responder set either by calling it. We have to call it.

UITextField has overridden firstResponder. It sets itself as the firstResponder.


### CoreGraphics
- Drawing

### QuartzCore
- Compositing
Each view has its own canvas, which is a CALayer. The CALayers are being combined from multiple layers to one image. A CALayer is its own image.

Drawing is slow. It is very general. This is done in software. 


Compositing is fast. It's done in hardware (it is being done by the GPU). 

It can rotate, scale, and change the opacity of things easily.

Quartz can only move layers.

Each UIView has an array of subviews. It will render those subviews in order.

Each CALayer can have sublayers. Each sublayer has a Z position. Things with a higher Z layer are in the back.



## Lifecycle
1. Create a UIVIew
A CALayer is generated. A canvas is allocated (as big as the frame), but no drawing is done yet.

2. View begins to come on screen.
setNeedsDisplay keeps track of whether this view has been drawn before or not.

3. Draw rect is called.
CoreGraphics draws all of the buttons. This is how everything gets drawn.

4. Start Animation

5. For the specified type, start animation





