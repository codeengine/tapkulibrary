//
//  MapViewController.m
//  Created by Devin Ross on 7/11/09.
//
/*
 
 tapku.com || http://github.com/tapku/tapkulibrary/tree/master
 
 Permission is hereby granted, free of charge, to any person
 obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without
 restriction, including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following
 conditions:
 
 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import "MapViewController.h"


@implementation MapViewController


- (void)viewDidLoad {
    [super viewDidLoad];
	mapView = [[TKMapView alloc] initWithFrame:self.view.bounds];
	mapView.delegate = self;
	[self.view addSubview:mapView];
	
	button = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
	
	
	button = [[UIBarButtonItem alloc] initWithTitle:@"Add Pin" style:UIBarButtonItemStylePlain target:self action:@selector(addPinMode:)];
	self.navigationItem.rightBarButtonItem = button;
	
	
	

}


- (void) addPinMode:(id)sender{
	
	if(mapView.pinMode){
		button.style = UIBarButtonItemStylePlain;
		mapView.mapView.mapType = MKMapTypeStandard;
	}
		
	else{
		mapView.mapView.mapType = MKMapTypeHybrid;
		button.style = UIBarButtonItemStyleDone;
	}
		
	[mapView setPinMode:!mapView.pinMode];
}


- (void) didPlacePinAtCoordinate:(CLLocationCoordinate2D)location{
	TKPlace *place = [[TKPlace alloc] init];
	place.title = [NSString stringWithFormat:@"%f,%f",location.latitude,location.longitude];
	NSLog(@"(%f,%f)",location.latitude,location.longitude);
	place.coordinate = location;
	[mapView.mapView addAnnotation:place];
	[place release];
}



- (void)dealloc {
	[button release];
	[mapView release];
    [super dealloc];
}


@end
