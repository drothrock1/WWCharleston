//
//  tableViewController.h
//  Cocktail Zen
//
//  Created by Brad on 3/16/10.
//  Copyright 2010 __Rothrock Group, LLC__. All rights reserved.
//

#import <UIKit/UIKit.h>


@class PageOneViewController;


@interface tableViewController : UITableViewController {
	NSArray *listData;
	PageOneViewController *childController;
	UITableView	*myTableView;

}

@property (nonatomic, retain) IBOutlet UITableView *myTableView;
@property (nonatomic, retain) NSArray *listData;

@end
