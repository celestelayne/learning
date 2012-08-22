Tables are what your list of songs are on the music thing. That's a plain table

A group table is like the settings part of the iphone.

Tables are the way to show a variable amount of information (possibly many things).

UITableView
	Two properties
		- Data source (the data source is the model behind the table).
			The protocol for this is <UITableVewDataSource>. Usually the table view moderates the data source. The table view goes to the view controller, looking for the data source, and the controller will pass it on to the model.
			Operates a lot like a delegate.
		-  A Delegate. The delegate is also usually the view controller. 
			It's the <UITableViewDelegate>. It has information like what do you do when someone selects a row? That's not about the data necessarily as about an action. 

Here's what a viewDidLoad function would look like:

	viewDidLoad {
		self.tableView.dataSource = self;
		self.tableView.delegate = self;
	}

(Going forward, we'll start using empty project templates to generate our own viewControllers).

Check Ned's Github from here to see the example of this.

Group tables have sections. We don't drag them over through the .xib, we program them in. Sections start at 0. 

Each individual 'song' or piece of information is a table view cell.

The program pulls up the rows as they are needed. They aren't all loaded at the same time. So when we call the (required) function:

	-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath {
	// This keeps it in the order that some NSArray was set in.
	NSString* unpresident = [self.favoriteUnpresidentsArray objectAtIndex: indexPath.row];
	
	UITableViewCell* cell = [[UITAbleViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:nil];

	cell.textLavel.text = unpresident;
	
	return cell;
	}

Add this into our AppDelegate.m file in our application function.

	// window is the actual stcreen of the application.
	self.window.rootViewController = [UnpresidentViewcontroller new];


delegate actions are about reactions to what the user does (for example, a click).





