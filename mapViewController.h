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

@class PageOneViewController;

@interface mapViewController : UIViewController <MKMapViewDelegate> {

	IBOutlet MKMapView *mapView;

	CLLocationCoordinate2D location;
	PageOneViewController *childController;
	BOOL mapSettingsShowing;  //NEED TO IMPLEMENT WHEN LOAD THE OTHER METHODS
	UIView *mapSettingsView; // Container for large image
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

- (IBAction)showLinks:(id)sender;
- (IBAction)toggleMapSettingsView;

@end
