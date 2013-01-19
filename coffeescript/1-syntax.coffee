#
# Here's how you compare variables. You can do this in coffeescript:
#

a = 1
b = 2
c = 3

console.log a < b < c # => true


# In javascript, c would've been compared to b first.
# That would return true. Then true would be compared to the integer a.
# That'd break things




#
# Here's how you replicate the functionality of a single thing in coffeescript
# both on the client and the server side.
#

# private functions
add = (x, y) -> x + y
subtract = (x, y) -> x - y
square = (x) -> x * x

# Create the namespace
SimpleMath = exports? and exports or @SimpleMath = {}

# the ? is the existential operator (if exports exists)
# @ == this

# make items attached to our namespace publicly available.
class SimpleMath.Calculator
  add: add
  subtract: subtract
  square: square

# SimpleMath can the be required from a node server,
# or included in a script tag for the client



#
# Here's How You embed vanilla javascript inside coffeescript
#

# In JS
`function greet(name) {
  return "Hello" + name;
}`

# In Coffeescript, I can call the JS-defined function
greet "hugo"



#
# Here's how you iterate over an array of items
#

for x in [1..10] 
  console.log x
for x in [1..10] by 2 # => [1, 3, 5, 7, 9]
  console.log x
x * x for x in [1..10] # => [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]






