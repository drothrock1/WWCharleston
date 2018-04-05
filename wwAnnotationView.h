//
//  wwAnnotationView.h
//  Cocktail Zen
//
//  Created by Brad on 3/16/10.
//  Copyright 2010 __Rothrock Group, LLC__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

#import "wwAnnotation.h"

@interface wwAnnotationView : MKAnnotationView {
	UIImageView *imageView;
}

@property (nonatomic, retain) UIImageView *imageView;

@end
