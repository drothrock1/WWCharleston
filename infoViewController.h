//
//  infoViewController.h
//  Cocktail Zen
//
//  Created by Brad on 3/16/10.
//  Copyright 2010 __Rothrock Group, LLC__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class TipsViewController;


@interface infoViewController : UITableViewController {
	NSArray *listData;
	TipsViewController *childController;
	UITableView	*infoTableView;
	
}

@property (nonatomic, retain) IBOutlet UITableView *infoTableView;
@property (nonatomic, retain) NSArray *listData;

@end
