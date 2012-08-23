Wednesdday 8/22/12

## Trees
- search time
	- height of tree
	- log(# of items)
- insertion time
	- log(# of items)

BST(Binary Search Trees)

# Hash Set
## Sales Pitch:
- search time:
	- O(1), constant. As you add more items to the hash map, it's the same amount of time to find things.
- Insertion Time
	- O(1), constant.

Comparing them:
1. Arrays: fast indexing
2. Linkedlist: fast queue/dequeue
3. BST: compromise for insertion and lookup.
BSTs have a very regimented way of adding things into lists. 
4. Hash Set: better than BST.

A hash set starts out as blank memory.

Hash Function- a function that, given an item, generates a "random" id for it.
It's reliable, not truly random. 

Birthday Paradox: eventually, two hashes will end up with the same id.


1. Hash the new object
2. Then hash % store size.
3. store the ID 

We can't add or delete items and keep it compact. Hashes has a fixed amount of memory.

If nothing is in a particular position, it starts off as nil. 

To look up in a hash:
1. Hash a value. 
2. Do one lookup in a piece of memory.

If there is a collision. Every position hash a pointer to a list. One way to check for collisions (there are many) is to check in said list if the string exists in it. If it doesn't, add it to that list.

Each piece of memory is called a bucket.

Search time increases a lot with collisions increasing the size of each array. We want to eventually increase the size allocated to the array so that we hit more empty arrays.

The load = (Number of items)/ store size.

The chance that we'll hit full buckets.

We want to keep the load low.


Resizing is difficult. (oo).
You have to handle every single element in the memory thingy to resize. Resizes are bad. I don't want them to happen. So don't grow little by little, but double.
- RESize - O(h)

*If you keep the load fixed, the average number of people in an office stays fixed.*

Look on wikipedia for the math. Check out birthday paradox.

The resize time is proportional to the number of items. The probability of resizing is inversly proportional to the resize time. So the average work that you have to do per item is constant.

Hash Set: (good for throughput)
1. Most of the time takes a constant amount of time to look up
2. Most of the time we have fast insertion
3. Very rarely, insertion is slow because of resize.
Usually faster, sometimes a lot slower.

Tree Set:(good for latency)
1. Insertion and lookup are slower, but always proportional to (log(n)) the height of the tree.
Slower on average, but not always.

This is a tradeoff of throughpu vs latency.

Latency- how fast something happens.
Throughput- How many items you can do per minute. Efficiency.

Sets in general are good at:
1. Eliminating duplications
2. Fash inclusion lookup
2. No worse or better at iteration.











