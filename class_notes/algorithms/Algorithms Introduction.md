# Algorithms
Algorithm = a process. a recipe. a series of steps (instructions), to solve a problem.

How many primitive steps does it take to solve a problem? How many times do I look at an element? The goal of these algorithms is to break down a problem into small, essentially equal steps.

Wikipedia will also be very useful here.

Sometimes, the problems are stated abstractly. 

Example:

	//sort this array
	[5, 7, 8, 3, 4, 3, 1]
	=> Sort in ascending order.

Algorithms:
1. should solve the problem.
2. should be fast.
3. should not use too much memory. 
	
About half of companies sift through applicants with algorithms (to see what you learned in a CS course). 
It's more important to build software that works. We're going to learn algorithms that help us build useful software (avoiding theoretical ones).

Here are some day to day stuff that I should learn about:

1. Binary search. If you have a sorted array,

	[1, 2, 3, 5, 7, 8, 20, 22]// Where's 7?
	//Eg, how do you look for names in a phone book? Same thing here.

2. Methods for sorting. (These three are enough).
	- Bubble sort
	- Merge sort
	- Quick sort


2.5 Binary trees. Another representation of a sorted structure, where each node has two children, and the left child is always smaller than the right child. Then it narrows searches by subtrees.
We have to set this relationship up.
Exercise: Try writing a tree class. 	

Problem: given an array, find the position of item 50 in the array. If 50 is not in the array, tell me.

3. Set
	- Tree set
	- NSSet (Expecially the differences in efficiencies when solving problems).

4. Hash Maps

5. Big-Oh (the way we talk about how fast these algorithms are).

6. Tree Searches (Tree traversals)
	- Depth and breadth first searches.

And some extras:
- heaps
- dynamic programming
- probability
- combinatorics 


### Simple Steps with Arrays

	//Pseudo code
	nums = [3, 5, 74, 21, 36, 12, 78]

	//Simpler problem: find smallest element in array.
	//
	smallestSoFar = nums[0]
	findSmallest:
		pos = 0
		while (pos < nums.length)
			if (nums[pos] < smallestSoFar)
				smallestSoFar = nums[pos]
			end	
			pos += 1
		end
	// How long does this process take as a function of how long the array is?
	// Problem size here is how long the array is, or the number of items you give someone.
	
These are some _simple steps_:
- do arithmetic
- assign to a var
- compare numbers
- control 
	- while
	- if/else/break
- look up in an array.	
algorithms don't deal with objects so often as collections of primitives
Breaking down big problems into little bits of work, then counting up how much work that is.
*(Until ned says otherwise), Algorithms about efficiency in the worst case.*

	1 	              smallestsofar = nums[0]
										while
	nums.length -1			compared smallestsofar to current pos
	nums.length -1				assignment to smallestsofar
										end
	1									return smallestsofar

number of steps = 2 * nums.length
10 => 20

100 => 200

1000 => 2000
It gets _proportionatly_ slower with problem size. *Linear Complexity* This is pretty good.

Linear is proportional.
Sublinear is better than

It's about proportionately how many steps there are.





