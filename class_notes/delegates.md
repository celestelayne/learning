# Delegates

We have two steps,

The view controller,
The view.

We're talking about how the two work together.

	View controller wants to be able to call methods on the view (through properties).

	The view is going to want help from the view controller by calling delegate methods.


In our view controller .m file,

	// These are privately declared, so other controllers cant' access it.
	@interface ViewController () <MKMapViewDelegate>
	@property (weak) MKMapView mapView;
	@end
	
	@implementation ViewController ()
	@synthesize mapView;

	// If I want to center a map view (for example)
	// when a map comes up, it centers once automatically,
	-(void)viewDidLoad 
	{
	[self.yelpMapView setCenterCoordinate:CLLocationCoordinateMake(0,0) animated:YES;
	
	// More view logic here, it should go in my view controller.
	
	// When mapView sends information back, where do we store it?
	self.yelpMapView.delegate = self;
	// The MKMapViewDelegate Protocol has all of the possible methods and properties a delegate can have.
	}

	// Let's say we want to lock a user to one spot on the map.
	-(void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated 
	{
		[self.yelpMapView setCenterCoordinate:CLLocationCoordinateMake(0,0) animated:NO];
	}
	
	}

	@end

When you're setting structs like CLLocationCoordinate2D, we use a big, long C style function. It talks directly to the mapiew class.


