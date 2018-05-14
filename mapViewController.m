//
//  mapViewController.m
//  Cocktail Zen
//
//  Created by Brad on 3/16/10.
//  Copyright 2010 __Rothrock Group, LLC__. All rights reserved.
//

#import "mapViewController.h"
#import "PageOneViewController.h"
#import "PageTwoViewController.h"
#import "PageThreeViewController.h"
#import "PageFourViewController.h"
#import "PageFiveViewController.h"
#import "PageSixViewController.h"
#import "PageSevenViewController.h"
#import "PageEightViewController.h"
#import "PageNineViewController.h"
#import <CoreLocation/CoreLocation.h>


#define MAPSETTINGSSTARTHEIGHT			-50.0
#define MAPSETTINGSSHOWHEIGHT			0.0
#define MAPSETTINGSCONTAINERHEIGHT		50.0

@interface mapViewController (ViewHandlingMethods)
- (void)toggleMapSettingsView;
- (void)createSlideUpMapSettingsView;
//- (void)loadStartScreen;
@end

@implementation mapViewController

@synthesize mapView;
@synthesize locationManager;

-(void)viewWillAppear:(BOOL)animated {
	NSLog (@"mapview viewwillappear executed");
	[[self navigationController] setNavigationBarHidden:NO animated:NO];
	[super viewWillAppear:animated];
	
}


- (void)viewDidLoad {
	[super viewDidLoad];
	
    
   /* self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor : [UIColor whiteColor]};
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
*/
    NSArray *ver = [[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."];
    if ([[ver objectAtIndex:0] intValue] >= 7) {
        self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
        self.navigationController.navigationBar.translucent = NO;
        self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
        self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    }
    
    //********************INSERT FONT COMMAND HERE?????*********************************
    //***** I DELETED THE LINE BELOW, AS IT WAS CONFLICTING. OK???? FIXED BACK BUTTON COLOR TO WHITE **************
    
    //self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    
    else {
        self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    }

    {
        // Create the location manager
        
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [self.locationManager requestWhenInUseAuthorization];
        }
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = 10; //meters
        
        
        [self.locationManager startUpdatingLocation];
        
    }
    
    
	[mapView setZoomEnabled:YES];
	[mapView setScrollEnabled:YES];

	MKCoordinateRegion region;
	
	region.center.latitude = 32.7782;
	region.center.longitude = -79.9305;
	region.span.longitudeDelta = 0.011;
	region.span.latitudeDelta = 0.011;
	[mapView setRegion:region animated:YES];
	[mapView setDelegate:self];
	
	mapView.showsUserLocation=TRUE;
	mapView.mapType=MKMapTypeStandard;
			
	CLLocationCoordinate2D c;
	
	//LOAD THE SITE LOCATIONS
	//SITE 1
	NSString *latitude =  @"32.778474";
	NSString *longitude = @"-79.928685";
	c.latitude = [latitude doubleValue];
	c.longitude = [longitude doubleValue];
	wwAnnotation *annotation = [[wwAnnotation alloc] initWithCoordinate:c];
	annotation.currentPoint = [NSNumber numberWithInt:1];
	annotation.mTitle=@"1. Philadelphia Alley";
	annotation.mSubTitle=@"Philadelphia Alley";
	annotation.annotationType = wwPin1;
	[mapView addAnnotation:annotation];
	[annotation release];
	
	//SITE 2
	latitude =  @"32.779222";
	longitude = @"-79.929419";
	c.latitude = [latitude doubleValue];
	c.longitude = [longitude doubleValue];
	annotation = [[wwAnnotation alloc] initWithCoordinate:c];
	annotation.currentPoint = [NSNumber numberWithInt:2];
	annotation.mTitle=@"2. St. Philip’s Church";
	annotation.mSubTitle=@"142 Church Street";
	annotation.annotationType = wwPin2;
	[mapView addAnnotation:annotation];
	[annotation release];
	
	//SITE 3
	latitude =  @"32.778631";
	longitude = @"-79.929506";
	c.latitude = [latitude doubleValue];
	c.longitude = [longitude doubleValue];
	annotation = [[wwAnnotation alloc] initWithCoordinate:c];
	annotation.currentPoint = [NSNumber numberWithInt:3];
	annotation.mTitle=@"3. Pirates Courtyard";
	annotation.mSubTitle=@"141 Church Street";
	annotation.annotationType = wwPin3;
	[mapView addAnnotation:annotation];
	[annotation release];
	
	//SITE 4
	latitude =  @"32.778138";
	longitude = @"-79.929441";
	c.latitude = [latitude doubleValue];
	c.longitude = [longitude doubleValue];
	annotation = [[wwAnnotation alloc] initWithCoordinate:c];
	annotation.currentPoint = [NSNumber numberWithInt:4];
	annotation.mTitle=@"4. Dock Street Theatre";
	annotation.mSubTitle=@"135 Church Street";
	annotation.annotationType = wwPin4;
	[mapView addAnnotation:annotation];
	[annotation release];
	
	//SITE 5
	latitude =  @"32.777899";
	longitude = @"-79.931368";
	c.latitude = [latitude doubleValue];
	c.longitude = [longitude doubleValue];
	annotation = [[wwAnnotation alloc] initWithCoordinate:c];
	annotation.currentPoint = [NSNumber numberWithInt:5];
	annotation.mTitle=@"5. Mills House Hotel";
	annotation.mSubTitle=@"115 Meeting Street";
	annotation.annotationType = wwPin5;
	[mapView addAnnotation:annotation];
	[annotation release];
	
	//SITE 6
	latitude =  @"32.778077";
	longitude = @"-79.931770";
	c.latitude = [latitude doubleValue];
	c.longitude = [longitude doubleValue];
	annotation = [[wwAnnotation alloc] initWithCoordinate:c];
	annotation.currentPoint = [NSNumber numberWithInt:6];
	annotation.mTitle=@"6. Poogan’s Porch";
	annotation.mSubTitle=@"72 Queen Street";
	annotation.annotationType = wwPin6;
	[mapView addAnnotation:annotation];
	[annotation release];
	
	//SITE 7
	latitude =  @"32.778479";
	longitude = @"-79.934519";
	c.latitude = [latitude doubleValue];
	c.longitude = [longitude doubleValue];
	annotation = [[wwAnnotation alloc] initWithCoordinate:c];
	annotation.currentPoint = [NSNumber numberWithInt:7];
	annotation.mTitle=@"7. The Unitarian Church";
	annotation.mSubTitle=@"8 Archdale Street";
	annotation.annotationType = wwPin7;
	[mapView addAnnotation:annotation];
	[annotation release];
	
	//SITE 8
	latitude =  @"32.776818";
	longitude = @"-79.926997";
	c.latitude = [latitude doubleValue];
	c.longitude = [longitude doubleValue];
	annotation = [[wwAnnotation alloc] initWithCoordinate:c];
	annotation.currentPoint = [NSNumber numberWithInt:8];
	annotation.mTitle=@"8. Old Exchange Building";
	annotation.mSubTitle=@"122 East Bay Street";
	annotation.annotationType = wwPin8;
	[mapView addAnnotation:annotation];
	[annotation release];
	
    //SITE 9
	latitude =  @"32.77770";
	longitude = @"-79.92850";
	c.latitude = [latitude doubleValue];
	c.longitude = [longitude doubleValue];
	annotation = [[wwAnnotation alloc] initWithCoordinate:c];
	annotation.currentPoint = [NSNumber numberWithInt:9];
	annotation.mTitle=@"9.  Old Slave Mart";
	annotation.mSubTitle=@"6 Chalmers Street";
	annotation.annotationType = wwPin9;
	[mapView addAnnotation:annotation];
	[annotation release];
    
	/*
	//SITE 9
	latitude =  @"24.559639";
	longitude = @"-81.807268";
	c.latitude = [latitude doubleValue];
	c.longitude = [longitude doubleValue];
	annotation = [[wwAnnotation alloc] initWithCoordinate:c];
	annotation.currentPoint = [NSNumber numberWithInt:9];
	annotation.mTitle=@"9. some scary place";
	annotation.mSubTitle=@"who knows what street";
	annotation.annotationType = wwPin9;
	[mapView addAnnotation:annotation];
	[annotation release];
	//[mapView release];
*/
	[self createSlideUpMapSettingsView];

/*
	[self loadStartScreen];
*/
}

// Delegate method from the CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    // If it's a relatively recent event, turn off updates to save power.
    CLLocation* location = [locations lastObject];
    NSDate* eventDate = location.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    if (fabs(howRecent) < 15.0) {
        // If the event is recent, do something with it.
        NSLog(@"latitude %+.6f, longitude %+.6f\n",
              location.coordinate.latitude,
              location.coordinate.longitude);
    }
}
- (MKAnnotationView *) mapView:(MKMapView *)theMapView viewForAnnotation:(id <MKAnnotation>) annotation {
	int postag = 0;
	wwAnnotationView *annotationView = nil;
	wwAnnotation* myAnnotation = (wwAnnotation *)annotation;
	if (annotation == mapView.userLocation) return nil;
	else if(myAnnotation.annotationType == wwPin1)
		
	{
		NSString* identifier = @"Pin1";
		wwAnnotationView *newAnnotationView = (wwAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
		if(nil == newAnnotationView)
		{
			newAnnotationView = [[[wwAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
		}
		annotationView = newAnnotationView;
	}
	else if(myAnnotation.annotationType == wwPin2)
	{
		NSString* identifier = @"Pin2";
		wwAnnotationView *newAnnotationView = (wwAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
		if(nil == newAnnotationView)
		{
			newAnnotationView = [[[wwAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
		}
		annotationView = newAnnotationView;
	}
	else if(myAnnotation.annotationType == wwPin3)
	{
		NSString* identifier = @"Pin3";
		wwAnnotationView *newAnnotationView = (wwAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
		if(nil == newAnnotationView)
		{
			newAnnotationView = [[[wwAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
		}
		annotationView = newAnnotationView;
	}
	else if(myAnnotation.annotationType == wwPin4)
	{
		NSString* identifier = @"Pin4";
		wwAnnotationView *newAnnotationView = (wwAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
		if(nil == newAnnotationView)
		{
			newAnnotationView = [[[wwAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
		}
		annotationView = newAnnotationView;
	}
	else if(myAnnotation.annotationType == wwPin5)
	{
		NSString* identifier = @"Pin5";
		wwAnnotationView *newAnnotationView = (wwAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
		if(nil == newAnnotationView)
		{
			newAnnotationView = [[[wwAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
		}
		annotationView = newAnnotationView;
	}
	else if(myAnnotation.annotationType == wwPin6)
	{
		NSString* identifier = @"Pin6";
		wwAnnotationView *newAnnotationView = (wwAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
		if(nil == newAnnotationView)
		{
			newAnnotationView = [[[wwAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
		}
		annotationView = newAnnotationView;
	}
	else if(myAnnotation.annotationType == wwPin7)
	{
		NSString* identifier = @"Pin7";
		wwAnnotationView *newAnnotationView = (wwAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
		if(nil == newAnnotationView)
		{
			newAnnotationView = [[[wwAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
		}
		annotationView = newAnnotationView;
	}
	else if(myAnnotation.annotationType == wwPin8)
	{
		NSString* identifier = @"Pin8";
		wwAnnotationView *newAnnotationView = (wwAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
		if(nil == newAnnotationView)
		{
			newAnnotationView = [[[wwAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
		}
		annotationView = newAnnotationView;
	}
	

	else if(myAnnotation.annotationType == wwPin9)
	{
		NSString* identifier = @"Pin9";
		wwAnnotationView *newAnnotationView = (wwAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
		if(nil == newAnnotationView)
		{
			newAnnotationView = [[[wwAnnotationView alloc] initWithAnnotation:myAnnotation reuseIdentifier:identifier] autorelease];
		}
		annotationView = newAnnotationView;
	}

	NSLog(@"postag value in mkannotation method: %i",postag);
	//	MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"currentloc"];
	//	annView.pinColor = MKPinAnnotationColorGreen;
	UIButton *myDetailButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	
	//TO SET A CUSTOM BUTTON CHANGE ABOVE TO UIButtonTypeCustom and include the below code, change imageNamed to the file needed
	//myDetailButton.frame = CGRectMake(0, 0, 23, 23);
	//myDetailButton.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
	//myDetailButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
	// Set the image for the button
	//[myDetailButton setImage:[UIImage imageNamed:@"button_right.png"] forState:UIControlStateNormal];
	[myDetailButton addTarget:self action:@selector(showLinks:) forControlEvents:UIControlEventTouchUpInside];
		
	if ([[annotation title] isEqualToString:@"Current Location"]) {
		postag = 99999;
	} else {
		postag = [myAnnotation.currentPoint intValue];
	} 
	
	
	myDetailButton.tag  = postag;
	NSLog(@"myDetailButton.tag value in mkannotation method: %li",(long)myDetailButton.tag);
	
	// Set the button as the callout view
	annotationView.rightCalloutAccessoryView = myDetailButton;
	
	//annotationView.animatesDrop=TRUE;
	annotationView.canShowCallout = YES;
	annotationView.calloutOffset = CGPointMake(-7,5);
	return annotationView;
}


- (IBAction)showLinks:(id)sender {
	NSInteger nrbuttonPressed = ((UIButton *)sender).tag;
    NSLog(@"nrbuttonpressed value: %li",(long)nrbuttonPressed);
	if (nrbuttonPressed < 99999) {
		
		if (nrbuttonPressed == 1){
			NSLog(@"nrbuttonpressed if = 1 executed");
			NSString *viewControllerName = @"PageOneViewController";
			childController = [[PageOneViewController alloc] initWithNibName:viewControllerName bundle:nil];
		}
		if (nrbuttonPressed == 2){
			NSLog(@"nrbuttonpressed if = 2 executed");
			NSString *viewControllerName = @"PageTwoViewController";
			childController = (PageOneViewController *)[[PageTwoViewController alloc] initWithNibName:viewControllerName bundle:nil];
		}
		if (nrbuttonPressed == 3){
			NSLog(@"nrbuttonpressed if = 3 executed");
			NSString *viewControllerName = @"PageThreeViewController";
			childController = (PageOneViewController *)[[PageThreeViewController alloc] initWithNibName:viewControllerName bundle:nil];
		}
		if (nrbuttonPressed == 4){
			NSLog(@"nrbuttonpressed if = 4 executed");
			NSString *viewControllerName = @"PageFourViewController";
			childController = (PageOneViewController *)[[PageFourViewController alloc] initWithNibName:viewControllerName bundle:nil];
		}
		if (nrbuttonPressed == 5){
			NSLog(@"nrbuttonpressed if = 1 executed");
			NSString *viewControllerName = @"PageFiveViewController";
			childController = (PageOneViewController *)[[PageFiveViewController alloc] initWithNibName:viewControllerName bundle:nil];
		}
		if (nrbuttonPressed == 6){
			NSLog(@"nrbuttonpressed if = 6 executed");
			NSString *viewControllerName = @"PageSixViewController";
			childController = (PageOneViewController *)[[PageSixViewController alloc] initWithNibName:viewControllerName bundle:nil];
		}
		if (nrbuttonPressed == 7){
			NSLog(@"nrbuttonpressed if = 7 executed");
			NSString *viewControllerName = @"PageSevenViewController";
			childController = (PageOneViewController *)[[PageSevenViewController alloc] initWithNibName:viewControllerName bundle:nil];
		}
		if (nrbuttonPressed == 8){
			NSLog(@"nrbuttonpressed if = 8 executed");
			NSString *viewControllerName = @"PageEightViewController";
			childController = (PageOneViewController *)[[PageEightViewController alloc] initWithNibName:viewControllerName bundle:nil];
		}
		
    
		if (nrbuttonPressed == 9){
			NSLog(@"nrbuttonpressed if = 9 executed");
			NSString *viewControllerName = @"PageNineViewController";
			childController = (PageOneViewController *)[[PageNineViewController alloc] initWithNibName:viewControllerName bundle:nil];
		}
    
		childController.hidesBottomBarWhenPushed = YES;
		//childController.backButtonName = @"Map";
		[self.navigationController pushViewController:childController animated:YES];	
		
		//Deselect the selected annotation when the disclosure button is selected
		wwAnnotation * annotation;
		for (annotation in mapView.selectedAnnotations) {
			[mapView deselectAnnotation:annotation animated:NO];
		}
		
		[annotation release];
	}
}



-(IBAction)mapType:(UISegmentedControl *)segmentPick {
	switch (segmentPick.selectedSegmentIndex) {
		case 0:
			mapView.mapType = MKMapTypeStandard; //plain mapview
			break;
		case 1:
			mapView.mapType = MKMapTypeSatellite; //satellite
			break;
		default:
			break;
	}
}


- (void)createSlideUpMapSettingsView {
	CGRect bounds = [[self view] bounds];
	CGRect frame = CGRectMake(CGRectGetMinX(bounds), -MAPSETTINGSCONTAINERHEIGHT, bounds.size.width, MAPSETTINGSCONTAINERHEIGHT);
	mapSettingsView = [[UIView alloc] initWithFrame:frame];
	[mapSettingsView setBackgroundColor:[UIColor blackColor]];
	[mapSettingsView setOpaque:NO];
	[mapSettingsView setAlpha:0.75];
	UISegmentedControl *locationControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"GPS On",@"GPS Off",nil]];
	locationControl.frame = CGRectMake(25, 7, 120, 30);
	[locationControl addTarget:self action:@selector(toggleUserLocation:) forControlEvents:UIControlEventValueChanged];
	//locationControl.segmentedControlStyle = UISegmentedControlStyleBar;
	locationControl.momentary = NO;
	//locationControl.tintColor = [UIColor blackColor];
	[mapSettingsView addSubview:locationControl];
	[locationControl release];
	
	UISegmentedControl *mapTypeControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Map",@"Satellite",nil]];
	mapTypeControl.frame = CGRectMake(175, 7, 120, 30);
	[mapTypeControl addTarget:self action:@selector(mapType:) forControlEvents:UIControlEventValueChanged];
	//mapTypeControl.segmentedControlStyle = UISegmentedControlStyleBar;
	mapTypeControl.momentary = NO;
	[mapSettingsView addSubview:mapTypeControl];
	[mapTypeControl release];
	
	[[self view] addSubview:mapSettingsView];
	[mapSettingsView release];
}


- (IBAction)toggleMapSettingsView {
	 
    CGRect frame = [mapSettingsView frame];
	NSLog(@"The value of mapsettingsshowing - toggle1 is %@\n", (mapSettingsShowing ? @"YES" : @"NO"));	
	
    if (mapSettingsShowing) 
	{
		frame.origin.y = -MAPSETTINGSCONTAINERHEIGHT;
	} 
	else {
		frame.origin.y = MAPSETTINGSSHOWHEIGHT;
	}
    
	[UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.30];
    [mapSettingsView setFrame:frame];
    [UIView commitAnimations];
	NSLog(@"The value of mapSettingsShowing - toggle2 is %@\n", (mapSettingsShowing ? @"YES" : @"NO"));	
    mapSettingsShowing = !mapSettingsShowing;
	NSLog(@"The value of mapSettingsShowing - toggle3 is %@\n", (mapSettingsShowing ? @"YES" : @"NO"));	
}

/*
- (void)loadStartScreen {
	introView *childController2 = [[introView alloc] init];
	childController2.hidesBottomBarWhenPushed = YES;
	[self.navigationController pushViewController:childController2 animated:NO];
	[childController2 release];
}
*/
-(IBAction)toggleUserLocation:(UISegmentedControl *)segmentPick    {
    NSLog (@"mapview toggleuserlocation executed");
    switch (segmentPick.selectedSegmentIndex)
    {
        case 0:
            mapView.showsUserLocation = TRUE; //plain mapview
            UIAlertView *alertON = [[UIAlertView alloc] initWithTitle:@"Your Location" message:@"GPS location is turned ON"delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alertON show];
            [alertON release];
            break;
        case 1:
            
            mapView.showsUserLocation = FALSE; //satellite
            UIAlertView *alertOFF = [[UIAlertView alloc] initWithTitle:@"Your Location" message:@"GPS location is turned OFF" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alertOFF show];
            [alertOFF release];
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
	NSLog (@"mapviewcontroller didreceive memory warning");
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
NSLog (@"mapviewcontroller viewdidunload");

	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
//	[showDetailView release];
//	[startScreenButton release];
	NSLog (@"mapview dealloc");
	[mapView release];
    [super dealloc];
}

@end
