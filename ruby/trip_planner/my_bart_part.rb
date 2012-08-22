require 'JSON'
require 'rest_client'
require 'pp'

# First, turn an address into a latitude and longitude
# This defines it

def request_coordinates(a_location)
    path = "https://maps.googleapis.com/maps/api/geocode/json"
    query_values = {
        address: "#{a_location}",
        sensor: 'false'
      }
    RestClient.get(path, { :params => query_values })
end

# This calls it on the method input current_address.
# It also parses it into JSON.
def parsed_coordinates(requested_json)
  JSON.parse(requested_json,  :symbolize_names => true)
end

#Then,create the place search method
def request_places(lat, lng, keyword)
    path = "https://maps.googleapis.com/maps/api/place/search/json"
    query_values = {
        key: 'AIzaSyBFiv8ziB9Z6_0v6e0CO7BHzzxE2hVyUj8',
        location: "#{lat},#{lng}",
        keyword: "#{keyword}",
        rankby: 'distance',
        sensor: 'false'
    }
    RestClient.get(path, { :params => query_values })
end

def address_bart(current_location)
  requested_json = request_coordinates(current_location)
  parsed_json = parsed_coordinates(requested_json)
  lat = parsed_json[:results][0][:geometry][:location][:lat]
  lng = parsed_json[:results][0][:geometry][:location][:lng]
  response = request_places(lat, lng, keyword = 'BART.gov "BART Station"')
  parsed_response = JSON.parse(response, :symbolize_names => true)
  answer_array_holder = []
  parsed_response[:results].each do |something|
    if something[:name].include?("BART") 
      answer_array_holder << something
    end
  end
  answer_array_holder[0][:name].split(' ')[0]
end

#