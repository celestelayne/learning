def wrap (obj, f)
  begin
    obj.send f
  rescue Exception => e
    p "Aw snap. We got #{e.message}"
  end
end


module Foo
  def foo
    puts "heyyyy!1"
  end
end

class Bar
  include Foo
end

wrap Bar.new, :foo # => heyy!!
# wrap Bar, :foo # throws



class Baz
  extend Foo
end


# wrap Baz.new, :foo #throws
wrap Baz, :foo #=> heyy!


# include attaches module methods to class instances
# extends attaches module methods to the class itself




# To see this in the wild, check out Rails activerecord base.
# https://github.com/rails/rails/blob/master/activerecord/lib/active_record/base.rb

# class Base
#     extend ActiveModel::Naming

#     extend ActiveSupport::Benchmarkable
#     extend ActiveSupport::DescendantsTracker

#     extend ConnectionHandling
#     extend QueryCache::ClassMethods
#     extend Querying
#     extend Translation
#     extend DynamicMatchers
#     extend Explain

#     include Persistence
#     include ReadonlyAttributes
#     include ModelSchema
#     include Inheritance
#     include Scoping
#     include Sanitization
#     include AttributeAssignment
#     include ActiveModel::Conversion
#     include Integration
#     include Validations
#     include CounterCache
#     include Locking::Optimistic
#     include Locking::Pessimistic
#     include AttributeMethods
#     include Callbacks
#     include Timestamp
#     include Associations
#     include ActiveModel::SecurePassword
#     include AutosaveAssociation
#     include NestedAttributes
#     include Aggregations
#     include Transactions
#     include Reflection
#     include Serialization
#     include Store
#     include Core
#   end

#   ActiveSupport.run_load_hooks(:active_record, Base)
# end







