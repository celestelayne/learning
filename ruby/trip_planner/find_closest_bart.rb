#Eddie and Hugo
require 'JSON'
require 'rest_client'
require 'pp'


#get coordinates for a given location
def request_coordinates(a_location)
    path = "https://maps.googleapis.com/maps/api/geocode/json"
    query_values = {
        address: "#{a_location}",
        sensor: 'false'
      }
    RestClient.get(path, { :params => query_values })
end

#create the place search method
def request_places(lat, lng, keyword)
    path = "https://maps.googleapis.com/maps/api/place/search/json"
    query_values = {
        key: 'AIzaSyBnvuQC1vjwu71ZrhO4qAZ2FaPHU3pPnRc',
        location: "#{lat},#{lng}",
        keyword: "#{keyword}",
        rankby: 'distance',
        sensor: 'false'
    }
    RestClient.get(path, { :params => query_values })
end

#returns bart station and address closest to provided location
def address_bart(current_location)
  requested_json = request_coordinates(current_location)
  parsed_json = JSON.parse(requested_json,  :symbolize_names => true)
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
  array_of_bart_names = answer_array_holder[0][:name].split(' ')
  bart_number = array_of_bart_names.index("BART") || 0
  
  final_answer_name = []
  i = 0
  while i < bart_number
    final_answer_name << array_of_bart_names[i]
    i += 1
  end
  
  #FINALLY!
  this_is_the_final_address = answer_array_holder[0][:vicinity]
  this_is_the_final_name = final_answer_name.join (' ')
  
  return [this_is_the_final_name, this_is_the_final_address]
end

