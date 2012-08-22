#Eddie and Hugo \ App Academy \ OG
# This is where all of the requires n stuff go.
require 'addressable/uri'
require 'json'
require 'rest-client'
require 'crack'
require './barthelp.rb'
require './find_closest_bart.rb'

# Code that gets direction strings
def prompt
  print '> '
end

#prompt user for start and finish locations
def get_dir()
    # Get's the ending string
    puts "Welcome to the wonderful world direction-getter!!"
    puts "Where would you like to go today?"
    prompt()
    end_place = STDIN.gets.chomp()
    
    # Gets the starting string
    puts "Sounds Legit."
    puts "Where are you starting off?"
    prompt()
    start_place = STDIN.gets.chomp()
    
    puts "That's a sweet starting place!"
    puts "Now we're going to send you to get the mode"
    
    [start_place, end_place]
end

#get mode of transportation
def get_mode()
    # This gets the mode of transportation
    puts "Cool-ness"
    puts "Now, what mode of transportation would you like to take?"
    puts "You can say anything, as long as it includes one of the three following options: "
    puts "1. Driving"
    puts "2. Public Transportation"
    puts "3. Walking"
    prompt()
    input_mode = STDIN.gets.chomp()
    
    # This translate input_mode to something that GoogleMaps can recognize
    output_mode = ""
    if input_mode.downcase.include?("driv") or input_mode.include?("1")
        output_mode = "driving"
    elsif input_mode.downcase.include?("public") or (input_mode.downcase.include?("trans") or input_mode.include?("2"))
        output_mode = "transit"
    elsif input_mode.downcase.include?("walk") or input_mode.include?("3")
        output_mode = "walking"
    else
        puts "The direction-getter-a-tron didn't understand which mode you set!"
        puts "Let's try this one again.."
        get_mode()
    end
    output_mode
end

#This method gets the driving or walking time, distance, directions, and cost between any two points
def get_p2p_directions(starting_point, ending_point, mode, sensor = false)
    path = "http://maps.googleapis.com/maps/api/directions/json"
    query_values = {
      origin: "#{starting_point}",
      destination: "#{ending_point}",
      mode: "#{mode}",
      sensor: "#{sensor}"
  }
  
  directions = RestClient.get(path, { :params => query_values })
  dir = JSON.parse(directions, :symbolize_names => true)
  
  time_sec = dir[:routes][0][:legs][0][:duration][:value]
  hours = time_sec/3600
  minutes = (time_sec%3600)/60
  seconds = (time_sec%3600)%60
  time = {hours: hours.to_i, minutes: minutes.to_i, seconds: seconds.to_i}
  
  distance = dir[:routes][0][:legs][0][:distance][:text]
  
  directions = dir[:routes][0][:legs][0][:steps]
  steps = directions.collect {|step| step[:html_instructions].gsub(/<[^\w]?[\w]+\s*>/,"").gsub(/<[\s\S]*>/," ")}
  cost = time_sec/3600.0 * 10
  [time, distance, steps, cost]
end

#This method gets the time, distance, steps, cost for any mode between 2 points
def get_directions(starting_point, ending_point, mode, sensor = false)
    if mode != 'transit'
        get_p2p_directions(starting_point, ending_point, mode, sensor)
    else
        s_station, s_addr = address_bart(starting_point)
        e_station, e_addr = address_bart(ending_point)
        #get directions from starting point to closest bart
        a_time, a_distance, a_steps, a_cost = get_p2p_directions(starting_point, s_addr, 'walking', false)
        #get directions from ending bart to ending point
        b_time, b_distance, b_steps, b_cost = get_p2p_directions(e_addr, ending_point, 'walking', false)
        brt_time, brt_dist, brt_steps = get_p2p_directions(s_addr, e_addr, 'driving', false)
        #get bart start time and end time with the BART API
        dtime = Time.now + a_time[:hours]*3600 + a_time[:minutes]*60 + a_time[:seconds]
        dhour = dtime.hour%12
        dmin = dtime.min
        dampm = ((dtime.hour/2)/12) ? 'PM' : 'AM'
        puts "Leave now to arrive at bart by #{dhour}:#{format('%.2d',dmin)} #{dampm}"
        bart_depart_time, bart_duration, bart_cost = BartHelper.find_bart_train("#{dhour}:#{dmin} #{dampm}", s_station, e_station)
        #combine time, distance, steps
        hours = a_time[:hours] + b_time[:hours] + bart_duration[:hours]
        minutes = a_time[:minutes] + b_time[:minutes] + bart_duration[:minutes]
        seconds = a_time[:seconds] + b_time[:seconds] + bart_duration[:seconds]
        minutes += seconds/60
        seconds = seconds%60
        time = {hours: hours.to_i, minutes: minutes.to_i, seconds: seconds.to_i}
        cost = a_cost + b_cost + bart_cost
        
        distance = a_distance.split()[0].to_f + b_distance.split()[0].to_f + brt_dist.split()[0].to_f
        steps = []
        steps << a_steps
        steps << "Take bart at #{bart_depart_time} from #{s_station} to #{e_station}"
        steps << b_steps
        [time, distance, steps, cost]
        
    end
end

#start
start_place, end_place = get_dir()
mode = get_mode()
time, distance, steps, cost = get_directions(start_place, end_place, mode, false)

puts "distance: #{distance}"
puts "time: #{time[:hours]>0? time[:hours].to_i.to_s + ' hours, ' : ''}#{time[:minutes]} minutes, #{time[:seconds]} seconds"
puts "Total cost: $#{format('%.2f',cost)}"
puts "Directions:\n#{steps.join("\n")}"









# Todo
# New Mode: Bibycling 
# Add a sort thing by length 


#start()
