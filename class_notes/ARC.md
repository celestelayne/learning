# ARC (Automatic Reference Counting)

It used to be really hard, and now it's just

	(strong, weak)

It's solving the problem of memory management. Memory is limited, and we only use what we need.

	[[ShaggyDog alloc] init]

We use alloc to hold a place in memory. 
ARC just knows when we stop using it.

Let's say we have two classes, Course and Person classes.

For Course,

	@property(strong) Person* instructor;


each pointer of a person points to a place in memory. 

The idea is do not remove something from memory until nobody points to it anymore.

	// _Person_
	@property (strong) Dog* dog;

	//_Dog_
	@property (strong) Person* owner;

Objects of these classes still have pointers to each other. These are called circular references. They won't  be deleted by arc. This is a bad thing. 

To avoid circular references, judiciously use weak.

	// _Person_
	@property (strong) Dog* dog;

	//_Dog_
	@property (weak) Person* owner;

The idea is that if we hold onto this Dog, we lose the person. The strong pointer keeps things alive if they're used. 

So if the Person is destroyed, nobody is referencing the Person, so that object is destroyed from memory. Now nobody is pointing strong at the Dog object, so now it's destroyed.

A ViewController owns a view (with a strong relationship).
A view owns all of its subviews (eg mapkit).
A mapkit has a delegate to a ViewController that's typically a weak pointer.

When an object is destroyed, ARC sets all of the pointers to it to nil. To avoid a danging pointer (where there's a pointer that doesn't exist anymore), it goes back to nil.

Outlets are held as weak.

When iOS is running out of memory (memory pressure), it flushes unshown views (views that currently aren't being used).

	ViewDidUnload //Destorys an unused view
	
	ViewDidLoad  // Reload a view to use it.

## Tips:
Let XCode keep picking weak for outlets.

Parent-child relationships and owner->dog relationships are the most common occurences of circular references















