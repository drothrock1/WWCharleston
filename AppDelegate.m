//
//  Cocktail Zen
//
//  Created by Brad on 6/1/10.
//  Copyright 2010 __Rothrock Group, LLC__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

//@synthesize navigationController;
@synthesize window;
@synthesize rootTabBarController;

- (void)dealloc
{
//	[navigationController release];
	[rootTabBarController release];
	[window release];
	
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
	// add the navigation controller's view to the window
//	[window addSubview:navigationController.view];
	[window addSubview:[rootTabBarController view]];

	CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    if (screenBounds.size.height == 568) {
        
        
        
        UIImage *myImage = [UIImage imageNamed:@"InfoScreenC-568h.png"];
        UIImageView *myImageView = [[UIImageView alloc] initWithImage:myImage];
        
        
        [myImageView setFrame:CGRectMake(0, 0, 320, 528)];
        
        [window addSubview:myImageView];
        [window sendSubviewToBack:myImageView];
        [myImageView release];
        
    } else
        
    {
        UIImage *myImage = [UIImage imageNamed:@"InfoScreenC.png"];
        UIImageView *myImageView = [[UIImageView alloc] initWithImage:myImage];
        
        
        [myImageView setFrame:CGRectMake(0, 0, 320, 480)];
        
        [window addSubview:myImageView];
        [window sendSubviewToBack:myImageView];
        [myImageView release];
        
    }

		
	//[[UIApplication sharedApplication] setStatusBarHidden:YES animated:NO];
		
	[window makeKeyAndVisible];
}
@end

// TO SET THE BACKGROUND IMAGE OF THE NAVIGATION BAR
/*@implementation UINavigationBar (CustomImage)
- (void)drawRect:(CGRect)rect
{
	UIImage *image = [UIImage imageNamed: @"Bar Uncommon header-1.png"];
	[image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}

@end
*/