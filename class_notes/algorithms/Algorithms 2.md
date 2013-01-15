## Review
Here are things that we care about:
Algorithms => a (language agnostic) process to solve a problem

Algorithms get broken down into equally weighted steps
	- Arithmetic
	- Comparing
	- Setting value
	- Indexing into an array
	- Control Flow (If, else, while, flow)..

What we care about is how many of these steps it takes an algorithm to solve a problem (as a proxy for how much time it takes to run).

We care about the performance of the worst case running time.

How something scales (as a graph of the relationship of number of lines to problem size).


## A Problem
	
	If I give you an array 'arr' with 'n' elements, and you need to find, if it exists, the location of an element x.

	n = 10
	i = 0
	while (i < arr.length) {
	if(arr[i] == x)
		return i; // The while loop would stop here.
	i += 1;
	}
	// This is a linear relationship. 
	// O(n) => Linear
	// O(n*n) => quadratic
	// O(log(n)) => Logarithmic.

You can't do better than a linear search in this kind of array because you have to check every possible case.

Let's say we change the problem just a bit.

	Iif I give you a sorted array arr with n elmenets, and you need to find, if it exists, the location of an element x.

For example, when you're searching a sorted phonebook, you can:

	1.Start at the middle of the sorted array.
	2.Compare that middle value to the values you're looking for.
	3.Disregard the half of the elements that is not in the direction of what you're looking for.
	4.Repeat step 1 for the new half.


This kind of search, binary search, is called _Binary Search_. It's logarithmic, meaning that if a problem is now twice as big, it takes a fixed amount of more work.

(To get a refresher of Algorithms, check Khan Academy).
http://www.khanacademy.org/math/algebra/logarithms/v/introduction-to-logarithm-properties

Each probe reduces the problem size by a factor of two in this example,

	100 => 50 => 25 => 13 => 7 => 4 => 2 => 1;

	n = the number of probes.
	2^(n-1) => n
	

	start = 0
	num_lls = arr.length
	probe_pos = arr.length / 2
	
	while (arr[prob_pos] != x) {
		num_ells -= (prob_pos - start)
		if(arr[prob_pos] < x) {
			start = prob_pos + 1;
		} else if (num_ells == 0){
			return -1;
		}	else {
			num_lls = prob_pos - start;
		}
		prob_pos = start + (num_lls / 2);
	}

And this is binary search.




	