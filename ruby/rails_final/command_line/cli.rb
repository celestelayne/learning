require 'addressable/uri'
require 'json'
require 'rest_client'

BASE = "localhost:3000"

class Command_Line_Client
  def customers_all()
    path = BASE + "/customers.json"
    RestClient.get(path)
  end
  
  def customers_new(first_name=nil, last_name=nil)
    begin 
      path = BASE + "/customers.json"
      puts 
      RestClient.post(path, {customer: {first_name: first_name, last_name: last_name}})
      Puts "Great Success :)"
    rescue Exception => e
      puts "Something Went wrong while trying to call it."
    end
  end
end

c = Command_Line_Client.new

def prompt
  print "> "
end

puts "Welcome to Magic Johnson Command line client."
puts "|                                           |"
puts "|                                           |"
puts "|                                           |"
puts "|                                           |"
puts "---------------------------------------------"

puts "to get a list of all customers, say get all customers"
puts "To create a customer, type the first and last name of the new customer,"
puts "ex: bob dylan"
prompt; response = STDIN.gets.chomp()
if response.downcase == "get all customers"
  customers_all()
else
  begin
    response_name = response.split(' ')
    puts c.customers_new(response_name[0], response_name[1])
  rescue Exception => e
    puts e 
    puts "Hmm, something seems to have broken. Try again later :)"
  end
end



# This interface is very tricky. Very very tricky. This is what I was trying before.
#       method = ARGV[0] + '_' + ARGV[1]
#       begin
#         if ARGV[3]
#           # puts send(method.to_sym).call(ARGV[2].to_sym, ARGV[3].to_sym)
#           puts c.send method.to_sym, ARGV[2].to_s , ARGV[3].to_s
#         elsif ARGV[2]
#           puts send(method.to_sym).call(ARGV[2].to_sym)
#         else
#           begin
#             puts send(method.to_sym)
#           rescue
#             puts "4"
#             puts "AW snap! Error Error"
#             puts ARGV[0] + "_" + ARGV[1]
#           end    
#         end
#       rescue Exception => e
#         puts e
#         puts "Dude, you stuck something wierd in. ERror error."
#         puts method + "(#{ARGV[2]}, #{ARGV[3]})"
#       end