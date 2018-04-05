
//
//  LargePhotoViewController.m
//  Cocktail Zen
//
//  Created by Brad on 6/1/10.
//  Copyright 2010 __Rothrock Group, LLC__. All rights reserved.
//

#import "LargePhotoViewController.h"

@implementation LargePhotoViewController

@synthesize photoName;
@synthesize imageView;

//************* TO MAKE BACK BUTTON WHITE TEXT, ADD IMAGEVIEW.TINTCOLOR = WHITE LINE BELOW. NO! NOT NEEDED**********
- (void)loadView {
	
	self.title = photoName;
    imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.backgroundColor = [UIColor blackColor];
   // imageView.tintColor = [UIColor whiteColor];
    self.view = imageView;
}

- (void)viewWillAppear:(BOOL)animated {
	UIImage *photo = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", photoName]];
	imageView.image = photo;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)viewDidUnload {
	NSLog (@"viewdidunload");
	self.photoName = nil;
	self.imageView = nil;
	[super viewDidUnload];
}

- (void)dealloc {
    [imageView release];
    [photoName release];
    [super dealloc];
}


@end
