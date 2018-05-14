//
//  infoViewController.m
//  Cocktail Zen
//
//  Created by Brad on 6/8/10.
//  Copyright 2010 __Rothrock Group, LLC__. All rights reserved.
//

#import "infoViewController.h"
#import "DirectionsViewController.h"
#import "HelpViewController.h"
#import "AboutViewController.h"
#import "TipsViewController.h"

#define kNameLabelTag		1
#define kAddressLabelTag	2
#define kImageLabelTag		3

@implementation infoViewController

@synthesize listData;
@synthesize infoTableView;

- (void)viewDidLoad {
		[super viewDidLoad];
    
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

    
	
	//comment following out to do Default screenshot

	NSDictionary *row1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Tips & General Info", @"Name", @"941 Bourbon Street",@"Address",@"InfoInfo",@"Image", nil];
	NSDictionary *row2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Start Tour - Map View", @"Name", @"801 Chartres Street",@"Address",@"InfoMap",@"Image",  nil];	
	NSDictionary *row3 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Start Tour - List View", @"Name", @"622 Pirate's Alley",@"Address",@"InfoList",@"Image",  nil];	
	NSDictionary *row4 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Directions", @"Name", @"727 St Peter Street",@"Address",@"InfoDirections",@"Image",  nil];	
	NSDictionary *row5 = [[NSDictionary alloc] initWithObjectsAndKeys:@"Help", @"Name", @"613 Royal Street",@"Address",@"InfoAbout",@"Image",  nil];	
	NSDictionary *row6 = [[NSDictionary alloc] initWithObjectsAndKeys:@"About", @"Name", @"240 Bourbon Street",@"Address",@"InfoHours",@"Image",  nil];	
	
	NSArray *array = [[NSArray alloc] initWithObjects:row1, row2, row3, row4, row5, row6, nil];
	self.listData = array;
	
	[row1 release];
	[row2 release];
	[row3 release];
	[row4 release];
	[row5 release];
	[row6 release];
	[array release];


	/*
	infoTableView = [[ATableViewController alloc] initWithStyle:UITableViewStylePlain];
	infoTableViewController.view.backgroundColor = [UIColor clearColor];
	[window addSubview:yourTableViewController.view];
	*/
	
	
	
	/*
	self.navigationController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background2-1.png"]];
	self.tableView.backgroundColor = [UIColor clearColor];
	*/
	 
	/*
	CGRect myImageRect = CGRectMake(0.0f, 0.0f, 320.0f, 420.0f);
	UIImageView *myImage = [[UIImageView alloc] initWithFrame:myImageRect];
	[myImage setImage:[UIImage imageNamed:@"Background2-1.png"]];
	myImage.opaque = YES; // explicitly opaque for performance
	[self.view addSubview:myImage];
	[myImage release];
	*/

}

-(void)viewWillAppear:(BOOL)animated
{
	
	[self.infoTableView deselectRowAtIndexPath:self.infoTableView.indexPathForSelectedRow animated:NO];
	
	
	NSLog (@"tableview viewwillappear executed");
	[super viewWillAppear:animated];
	
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.listData = nil;
	self.infoTableView = nil;
	[super viewDidUnload];
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listData count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellTableIdentifier = @"CellTableIdentifier";
	[tableView setBounces:NO];
    [tableView setBackgroundColor:[UIColor clearColor]];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellTableIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellTableIdentifier] autorelease];
		//cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //cell.accessoryType = [UIColor redColor];  DOES NOT WORK
        
        
//************************** ADD THIS NEXT LINE TO FIX TO FIX THE BACKGROUND ON THE FIRST PAGE*******************
       /* FROM APPLE ON IOS7: Whether you use a predefined or custom cell, you can change the cell’s background using the backgroundView property or by changing the inherited backgroundColor property. In iOS 7, cells have a white background by default; in earlier versions of iOS, cells inherit the background color of the enclosing table view. If you want to change the background color of a cell, do so in the tableView:willDisplayCell:forRowAtIndexPath: method of your table view delegate.
            */
         [cell setBackgroundColor:[UIColor clearColor]];
       
        
//************************** ADD LINE ABOVE TO FIX THE BACKGROUND ON THE FIRST PAGE*******************
	}
	
	
	/*
	//Black frame around the picture
	CGRect frame = CGRectMake(1, 1, 41, 41);
	UIView *imageFrame = [[UIView alloc] initWithFrame:frame];
	[imageFrame setBackgroundColor:[UIColor blackColor]];
	[imageFrame setOpaque:NO];
	[imageFrame setAlpha:0.5];
	[cell.contentView addSubview:imageFrame];
	[imageFrame release];
	
	//Container for picture
	CGRect imageLabelRect = CGRectMake(2, 2, 39, 39);
	UIImageView *imageLabel = [[UIImageView alloc] initWithFrame:imageLabelRect];
	imageLabel.contentMode = UIViewContentModeScaleAspectFit;
	imageLabel.tag = kImageLabelTag;
	[cell.contentView addSubview:imageLabel];
	[imageLabel release];
	*/
	 
	 
	 
	//Title text
	CGRect nameLabelRect = CGRectMake(10, 12, 240, 20);
	UILabel *nameLabel = [[UILabel alloc] initWithFrame:nameLabelRect];
	[nameLabel setBackgroundColor:[UIColor clearColor]];
	nameLabel.textAlignment = NSTextAlignmentLeft;
	nameLabel.tag = kNameLabelTag;
	nameLabel.font = [UIFont boldSystemFontOfSize:18];
	[cell.contentView addSubview:nameLabel];
	[nameLabel release];
	

	/*
	//Subtitle text
	CGRect addressLabelRect = CGRectMake(50, 25, 240, 16);
	UILabel *addressLabel = [[UILabel alloc] initWithFrame:addressLabelRect];
	[addressLabel setBackgroundColor:[UIColor clearColor]];
	addressLabel.textAlignment = UITextAlignmentLeft;
	addressLabel.tag = kAddressLabelTag;
	addressLabel.font = [UIFont systemFontOfSize:12];
	[cell.contentView addSubview:addressLabel];
	[addressLabel release];
	*/
	
	NSUInteger row = [indexPath row];
	NSDictionary *rowData = [self.listData objectAtIndex:row];
	
	NSString *imageName= [rowData objectForKey:@"Image"];
	UIImage *imagePath = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", imageName]];
	
	NSLog(@"This is theimage name for the photoveiw: %@", imagePath);
	
	UIImageView *imageThumb = (UIImageView *)[cell.contentView viewWithTag:kImageLabelTag];
	imageThumb.image = imagePath;
	UILabel *name = (UILabel *)[cell.contentView viewWithTag:kNameLabelTag];
	name.text = [rowData objectForKey:@"Name"];
	
	/*
	UILabel *address = (UILabel *)[cell.contentView viewWithTag:kAddressLabelTag];
	address.text = [rowData objectForKey:@"Address"];
	*/
	
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 	NSUInteger selectedSite = [indexPath row]+1;
	if (selectedSite == 1){
		NSLog(@"nrbuttonpressed if = 1 executed");
		NSString *viewControllerName = @"TipsViewController";
		childController = [[TipsViewController alloc] initWithNibName:viewControllerName bundle:nil];
		childController.hidesBottomBarWhenPushed = YES;
		[self.navigationController pushViewController:childController animated:YES];	

	}
	if (selectedSite == 2){
		self.tabBarController.selectedViewController 
		= [self.tabBarController.viewControllers objectAtIndex:1];
	}
	if (selectedSite == 3){
		NSLog(@"nrbuttonpressed if = 3 executed");
		self.tabBarController.selectedViewController 
		= [self.tabBarController.viewControllers objectAtIndex:2];
	}
	if (selectedSite == 4){
		NSLog(@"nrbuttonpressed if = 4 executed");
		NSString *viewControllerName = @"DirectionsViewController";
		childController = (TipsViewController *)[[DirectionsViewController alloc] initWithNibName:viewControllerName bundle:nil];
		childController.hidesBottomBarWhenPushed = YES;
		[self.navigationController pushViewController:childController animated:YES];	
	}
	if (selectedSite == 5){
		NSLog(@"nrbuttonpressed if = 5 executed");
		NSString *viewControllerName = @"HelpViewController";
		childController = (TipsViewController *)[[HelpViewController alloc] initWithNibName:viewControllerName bundle:nil];
		childController.hidesBottomBarWhenPushed = YES;
		[self.navigationController pushViewController:childController animated:YES];	
	}
	if (selectedSite == 6){
		NSLog(@"nrbuttonpressed if = 6 executed");
		NSString *viewControllerName = @"AboutViewController";
		childController = (TipsViewController *)[[AboutViewController alloc] initWithNibName:viewControllerName bundle:nil];
		childController.hidesBottomBarWhenPushed = YES;
		[self.navigationController pushViewController:childController animated:YES];	
	}
	
}


-(void)viewWillDisppear:(BOOL)animated
{
	NSLog (@"viewwilldisappear executed");
	[super viewWillDisappear:animated];
}


- (void)dealloc {
	NSLog (@"infoview dealloc");
    [listData release];
	[infoTableView release];
	[super dealloc];
}


@end

