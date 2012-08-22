#To Run,

ruby directions.rb



##What does this little app do?
Fire it up on the command line, and it gives you directions, either by walking, driving, or taking the BART. We made this project to practice using the Google Maps api and the BART api.


(Notes of how me and my pair thought it through).
Asks for start and end directions as strings from the command line
	We can do this either by STDIN.gets.chomp() or ARGV[0], ARGV[1]

Then asks whether they want to walk, drive, or take public transport
	make a prompt ==> ' > '
	call the prompt, and set a variable to STDIN.gets.chomp()
	Then have the rest of the program respond to whatever it does. (Send the info to Gmaps?)
	
	
Then we access Google Maps (JSON, open-uri)
	Gets possible directions either walking, driving, or taking public transportaiton
	Gives me back the time for each (fastest route)
	Distance Traveled
	Gives me back the cost for each (to find the cheapest route)
		Driving => miles driven by $0.20/mile, $10/hour
		Tranport => Fare + $10/hour
		Walking => $10/hour
	Make it so that if the user doesn't specify an option, it just returns the cheapest option