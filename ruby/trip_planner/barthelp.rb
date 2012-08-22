#Eddie and Hugo
require 'crack'
require 'rest-client'

class BartHelper
    #get list of bart stations
    def BartHelper.get_bart_stations
        path = "http://api.bart.gov/api/stn.aspx"
        query_values = {
            cmd: 'stns',
            key: 'REH4-I8UA-U77Q-4WQI'
        }
        stations = Crack::XML.parse(RestClient.get(path, { :params => query_values }))
    end
    
    #get bart abbreviation based on part of bart startion name
    def BartHelper.get_bart_abbr(stn)
        stations = get_bart_stations
        ret = ''
        stations['root']['stations']['station'].each do |station|
            if station['name'].downcase.include?(stn.downcase)
                ret = station['abbr']
            end
        end
        ret
    end
    
    #takes in bart abbreviated stations and returns routes available
    def BartHelper.get_bart_routes(start_station, end_station, timed)
        path = "http://api.bart.gov/api/sched.aspx"
        query_values = {
            cmd: 'depart',
            orig: "#{start_station}",
            dest: "#{end_station}",
            key: 'REH4-I8UA-U77Q-4WQI',
            time: "#{timed}"
        }
        routes = Crack::XML.parse(RestClient.get(path, { :params => query_values }))
    end
    
    # Find bart train to take and time it leaves
    # get time leave, duration, cost, 
    def BartHelper.find_bart_train(timed, begin_station, end_station)
       bstation = get_bart_abbr(begin_station)
       estation = get_bart_abbr(end_station)
       routes = get_bart_routes(bstation, estation, timed)
       
       options = routes['root']['schedule']['request']['trip']
       route = {}
       options.each do |rte|
         if Time.parse(rte['origTimeMin']) > Time.parse(timed)
           route = rte
         end
       end
       
       time_depart = route['origTimeMin']
       time_arrive = route['destTimeMin']
       day_depart = route['origTimeDate']
       fare = route['fare']
       time_sec = Time.parse(time_arrive) - Time.parse(time_depart)
       hours = time_sec/3600
       minutes = (time_sec%3600)/60
       seconds = (time_sec%3600)%60
       time = {hours: hours.to_i, minutes: minutes.to_i, seconds: seconds.to_i}
       cost = fare.to_f + ((time_sec/3600.0)*10)
       puts "Your train will leave at #{time_depart} on #{day_depart} costing a total of $#{fare}"
       puts "You will be on bart for #{hours>0? hours.to_i.to_s + ' hours' : ''} + #{minutes.to_i.to_s} minutes and #{seconds.to_i.to_s} seconds"
       [time_depart, time, cost]
    end
end