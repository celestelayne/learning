## Review of Last Time

One of the best ways to search through a sorted array is binary search.

From now on, all logs used here have a base 2.

# Data Structures

They're kinda like classes for algorithms.

- array [1, 2, 3, 4, 5, 6, 7, 8, 9]
	- index(ruby), objectAtIndex, 
- *A Linked List*!!

## Linked List
It has the data that lives inside, and a links between elements of a chain.

for example,

	[1, 2, 3]

One connects to two connects to three connects to nil.

(A doubly linked list goes in both directions, and would have nil at both ends).

	@interface Link
		@property int value;
		@property Link* next; // This is legit.

This is much slower to index. Because you have to check first to last.

Characteristics:

To index to a linked list: The relationship is O(n), it's linear.

It's very easy to delete elements from n, the head: O(1), it's constant.

It's also easy to splice elements in. Imagine that, instead of pointing 1 to 2, you point 1 to 1.5 to 2. That's efficient.

To remove 2 from [1, 2, 3], set,

	head.next = head.next.next

So that 1 points to 3 instead of two. Now if 1 points to three, two has no strong pointers to it.

By the way, head is just the first element of the linked list. 

When normally working with arrays, and you delete something froma  tape in memory, you have to move back all numbers in the array.

In an Array (vector),
	- index O(1), constant
	- delete O(n), linear


Linked list is the simplest data structure.


### Challenge!!
Implement linked list. 
Have a delete method, a index method, and insert method, and a reverse method.

## (Binary)Tree

A tree with at most 2 children. The child to the left is higher, and the child to the right is lower.

Here's how it would look in code:

	@interface BinaryTreeNode
		@property id value;
		@property BinaryTreeNode leftChild;
		@property BinaryTreeNode rightChild;

And we would have to have some ability to compare objects.

	self.leftChild.users < self.values < self.rightChild.value

The common use case is to have things that are easy to compare (all numbers or all letters).

Leaves are called the ends of binary trees (which have no children).

Searching through a tree is a lot like binary search. It's also recursive because whenever it gets to a new level, it repeats the function until the target is found or a leaf is reached.

The height of the tree is the longest path of the tree.

	-search: O(heightOfTree) // O(n)

If the tree is balanced, the height of the tree is equal to log(n)

A tree is balanced when every node but the leaf nodes have two elements.

So one with three levels will have,

	2^0 + 2^1 + 2^2 = 2^3 - 1

As the tree gets deeper, there are twice as many nodes being added as the level before.

So

	- height n == 2^n - 1

n nodes => log(n) height


To insert x into a tree,

	- if x < current_node
		go left
	- else go right
	- if current node is null 
		insert here.

So,
instertions: O(log(itemsInTree)),
It's proportional to the height of a balanced tree.


Some trees are **not well balanced**

Some trees are self balancing. They see when they are unbalanced and course-correct.


### Challenge
Implement a binary search. 

Array.
- index: O(1)
- deletion: O(n)
- insertion: O(n)

Linked List.
- index: O(n)
- deletion: O(1)
- insertion: O(1)

Binary Search Tree.
- index: O(log n)
- deletion: O(log n) 
- insertion: O(log n)


A binary search tree is one way to implement a sorted set.

A sorted set is like a protocol.

	@protocol SortedSet
		-(void)addElement:(id)el;
		-(BOOL)containsElement:(id)el;
	@end

A sorted set beats the pants out of some random array when doing lookups.

## Map

A binary search tree, where everything is sorted by keys and values. The key could be numbers, or anything that can be sorted.

look up: Tree Set vs Tree Map. 

Here's what a binary search tree looks like implemented:

	@interface BinaryTreeNode
		@property (strong) id value;
		@property (strong) BinaryTreeNode* leftChild; (Base class is leaves)
		@property (strong) BinaryTreeNode* rightChild;
	@end




Double-y linked list have an idea of a front and back. Add a guy to the back of the line as a new thing. Remove a guy from the front of the line as he gets served.
Queues are the one place where we use linked lists a lot.



		




