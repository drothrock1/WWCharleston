//
//  mapViewController.h
//  Cocktail Zen
//
//  Created by Brad on 3/16/10.
//  Copyright 2010 __Rothrock Group, LLC__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKAnnotation.h>
#import "wwAnnotation.h"
#import "wwAnnotationView.h"
#import <CoreLocation/CoreLocation.h>

@class PageOneViewController;

@interface mapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate> {

	IBOutlet MKMapView *mapView;
    CLLocationManager *locationManager;

	CLLocationCoordinate2D location;
	PageOneViewController *childController;
	BOOL mapSettingsShowing;  //NEED TO IMPLEMENT WHEN LOAD THE OTHER METHODS
	UIView *mapSettingsView; // Container for large image
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) CLLocationManager *locationManager;

- (IBAction)showLinks:(id)sender;
- (IBAction)toggleMapSettingsView;

@end
