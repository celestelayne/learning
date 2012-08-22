Wednesday 8/22

# CoreAnimation

Within UIView, there is a UIResponder that handles events.

A view is on the screen. When you click on the screen, it receives a touch-began function.

If you click outside of a view, it doesn't receive anything. A textField or shaking the phone is outside of the view. For a view to receive this action, it sets a firstResponder that takes information back and forth.

There is only one firstResponder at a time.


First responder set either by calling it. We have to call it.

UITextField has overridden firstResponder. It sets itself as the firstResponder.

### QuartzCore
- Compositing
Each view has its own canvas, which is a CALayer. The CALayers are being combined from multiple layers to one image. A CALayer is its own image.

Drawing is slow. It is very general. This is done in software. 


Compositing is fast. It's done in hardware (it is being done by the GPU). 

It can rotate, scale, and change the opacity of things easily.



### CoreGraphics
- Drawing

