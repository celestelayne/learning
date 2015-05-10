if true
  puts 'this is a type check'
else
  puts 'we should instead send messages to objects'
end

# Monkey patches singletons of true and false
# Adds smalltalk-like message-sending syntax
class TrueClass
  def if_true
    yield
    self
  end

  def if_false
    self
  end
end

# Opposite implementation + same message sig (both take a block) as true
class FalseClass
  def if_true
    self
  end

  def if_false
    yield
    self
  end
end

# With the monkey patchk, we can write
(1 == 1).if_true { puts "1 == 1 is true" }
did_do_something = true
did_do_something.if_true { puts "woot woot" }
did_do_something.if_false { puts "oh noes!!" }


# To solve our problem of truthy and falsy, let's promote the truthy behavior to object
class Object
  def if_true
    yield
    self
  end

  def if_false
    self
  end
end

# And promote the falsy behavior to nilclass
class NilClass
  def if_true
    self
  end

  def if_false
    yield
    self
  end
end

# Now, we don't need a true, we can use any truthy
"anything".if_true { puts "anything works" }
nil.if_false { puts "nil is false" }
false.if_false { puts "false is false" }

(2 == 2)
  .if_true { puts "true" }
  .if_false { puts "false" }
