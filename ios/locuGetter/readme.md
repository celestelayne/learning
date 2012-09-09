# Spec
Use Locu. Find local awesome food.
	http://dev.locu.com/documentation/
	

Add upvote / downvote functionality on food items in places. Be able to sort food by popularity. 
	- Integrate with factual for products (http://developer.factual.com/display/docs/Crosswalk+for+Products)


Push notifications of cool stuff near you.

class User

	@friends

end

class Food
	has_many :venues	

	@points
end

class Venue

end

Once locu finds a good venue, use 

# tab bar items
1. Map view of places (search functionality)
	TableVC that can modally present itself as a mapview.
	Click on a place, presents a modal table view of stuff. You can interact with it there. 
	Takes you to a things navigation controller (other tab?)
		1. Make a new item (take a picture) / grab it from the locu menu and add rating functionality. 
		2. As things  are rated, add the info to parse as objects reffering to Locus stuff (don't restore it).
	Tap. Find the places information.

2. Random Awesome tab. Shows random / deal of the day type foods. (Based on what you've rated / liked)?

4. Settings (cog), logout, update infomration, etc.
	. Favorites View. Tell it what you like. It gives you a list of closest, highest rated things within your category. 

Table view vs. map view. 


# OR
1. You can rate food from venues.

Search Type: 
	- Breakfast if time is 3am - 9am
	- Lunch if time is 9am - 4pm
	- Dinner if time is 4pm - 3am

Take pictures of food to rate them.

2. You can find random awesome food. 
	- Set preferences. 



class FoodItem < PFObject
	belongs_to :venue
	
end


# OR

FOOD DISCOVERY!!!