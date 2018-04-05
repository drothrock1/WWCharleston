//
//  wwAnnotation.m
//  Cocktail Zen
//
//  Created by Brad on 3/16/10.
//  Copyright 2010 __Rothrock Group, LLC__. All rights reserved.
//

#import "wwAnnotation.h"

@implementation wwAnnotation

@synthesize coordinate;
@synthesize mTitle;
@synthesize mSubTitle;
@synthesize annotationType;
@synthesize currentPoint;

- (NSString *)subtitle {
	return mSubTitle;
}
- (NSString *)title {
	return mTitle;
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) c {
	coordinate=c;
	NSLog(@"%f,%f",c.latitude,c.longitude);
	return self;
}
- (void)dealloc {
    [mTitle release];
	[mSubTitle release];
	[currentPoint release];
	[super dealloc];
}

@end
