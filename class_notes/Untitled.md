(August 21, 2012)
# How to Draw Nibs

The nib (native interface builder) is the compiled version of the xib (xml interface builder).

The xib is compiled to the nib, and it constructs objects at that time as objects waiting to be called.

1. Have a view controller and a .xib
2. Within the init method
	self.view = [[myView alloc] init];


*Nibloading*
1. Create the view controller
2. (Fast Time) view controller comes on screen
3. Load the nib 
	- Each view in the nib is pulled out of the filesystem
	- Init with frame is not called, awakeFromNib is called.

4. Then, viewDidLoad is called. This is where we create new views because 

With the init method

	self.view = [[myView alloc] init];

We can also call it with a initWithFrame method.

	self.view = [[myView alloc] initWithFrame:someFrameAlreadySet];

initWithFrame can't be used with 






