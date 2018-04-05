//
//  PageSevenViewController.m
//  Cocktail Zen
//
//  Created by Brad on 6/1/10.
//  Copyright 2010 __Rothrock Group, LLC__. All rights reserved.
//

#import "PageSevenViewController.h"
#import "Constants.h"
#import "PageSixViewController.h"
#import "PageEightViewController.h"
#import "LargePhotoViewController.h"


#define TEXT_BGCOLORVAL_RED				250
#define TEXT_BGCOLORVAL_GREEN			250
#define TEXT_BGCOLORVAL_BLUE			250

#define AUDIOBUTTONSTARTHEIGHT			-50
#define	AUDIOBUTTONTOTALHEIGHT			80
#define AUDIOCONTROLSTARTHEIGHT			-50.0
#define AUDIOCONTROLSHOWHEIGHT			0.0
#define AUDIOCONTROLCONTAINERHEIGHT		50.0



@interface PageSevenViewController (ViewHandlingMethods)
- (void)prevController;
- (void)nextController;

- (void)loadAudioFile;
- (void)startPlayback;
- (void)stopAudio;

- (void)updateCurrentTime;
- (void)updateViewForPlayerState;
- (void)updateViewForPlayerInfo;

- (void)createSlideUpAudioControlView;
- (void)toggleThumbView;


@end

@implementation PageSevenViewController

//@synthesize scrollView;

@synthesize player;
@synthesize playButton;
@synthesize progressBar;
@synthesize currentTime;
@synthesize duration;

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
	NSLog (@"viewdidunload");
	[self stopAudio];
	self.player = nil;
	
	//NEW CODE
	self.playButton = nil;
	self.progressBar = nil;
	self.currentTime = nil;
	self.duration = nil;
	
//	self.scrollView = nil;
	
	[super viewDidUnload];
}


- (void)dealloc
{
	NSLog (@"dealloc");
    [player release];
//	[scrollView release];
	[super dealloc];
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
	if (!(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]))
        return nil;
    
    self.title = NSLocalizedString(@"Site 7", @"");
	
	return self;
}

- (void)viewDidLoad
{
	NSLog (@"viewdidload");
	[scrollView setScrollEnabled:YES];
	[scrollView setContentSize:CGSizeMake(320, 2690)];
	[scrollView setBackgroundColor:[UIColor colorWithRed:TEXT_BGCOLORVAL_RED/255.0 green:TEXT_BGCOLORVAL_GREEN/255.0 blue:TEXT_BGCOLORVAL_BLUE/255.0 alpha:1]];
	
	
	
	//MAKE BAR BUTTONS
	UIView* container = [[UIView alloc] initWithFrame:CGRectMake(0, 0,100, 30)];
	
	// create button, add to container
	UIButton *forwardButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 5, 20, 20)];
	[forwardButton setBackgroundImage:[UIImage imageNamed:@"volume_up.png"]forState:UIControlStateNormal];
	[forwardButton addTarget:self action:@selector(toggleAudioControls) forControlEvents:(UIControlEventTouchDown)];
	[container addSubview:forwardButton];
	[forwardButton release];
	
	// create button, add to container
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:[UIImage imageNamed:@"back12.png"],[UIImage imageNamed:@"forward12.png"],nil]];
	[segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
	segmentedControl.frame = CGRectMake(50, 3, 55, kCustomButtonHeight);
	segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
	segmentedControl.momentary = YES;
    segmentedControl.tintColor = [UIColor whiteColor];
	
	//segmentedControl.tintColor = [UIColor darkGrayColor];
	defaultTintColor = [segmentedControl.tintColor retain];	// keep track of this for later
	[container addSubview:segmentedControl];
	[segmentedControl release];
	
	// add bar button item
	UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:container];
	self.navigationItem.rightBarButtonItem = item;
	[item release];
	
	[container release];
	
	[self createSlideUpAudioControlView];
	
}

- (void)viewWillAppear:(BOOL)animated
{
	NSLog (@"viewwillappear");
	//	UISegmentedControl *segmentedControl = (UISegmentedControl *)self.navigationItem.rightBarButtonItem.customView;
	
	// Before we show this view make sure the segmentedControl matches the nav bar style
	//	if (self.navigationController.navigationBar.barStyle == UIBarStyleBlackTranslucent ||
	//		self.navigationController.navigationBar.barStyle == UIBarStyleBlackOpaque)
	//		segmentedControl.tintColor = [UIColor darkGrayColor];
	//	else
	//		segmentedControl.tintColor = defaultTintColor;
	
	[self loadAudioFile];
	
	
}

-(void)viewWillDisappear:(BOOL)animated

{
	NSLog (@"viewwilldisappear");
	NSLog(@"The value of stopAudioOverride is %@\n", (stopAudioOverride ? @"YES" : @"NO"));
	if (stopAudioOverride == NO) {
		[self stopAudio];
		player.currentTime = 0;
	}
	stopAudioOverride = NO;
	NSLog(@"The value of stopAudioOverride is %@\n", (stopAudioOverride ? @"YES" : @"NO"));
}


#pragma mark 
#pragma mark - Page Control Methods 


- (IBAction)segmentAction:(id)sender
{
	// The segmented control was clicked, handle it here 
	
	UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;
	switch (segmentedControl.selectedSegmentIndex) {
		case 0: // Up clicked
			[self prevController];
			break;
			
		case 1: // Down clicked
			[self nextController];
			break;
			
		default:
			break;
	}
	//[self redrawButtonState];
}

// Create and push the other view controller.

- (void) prevController {
	
	PageSixViewController *pagesixVC = [[PageSixViewController alloc] initWithNibName: @"PageSixViewController" bundle:nil];
	// Copy the view controllers stack from the navigation controller
	NSMutableArray *navigationStack = [[NSMutableArray alloc] initWithArray:self.navigationController.viewControllers];
	
	// Remove the current view controller
	[navigationStack removeLastObject];
	
	// Add the next view controller
	pagesixVC.hidesBottomBarWhenPushed = YES;
	[navigationStack addObject:pagesixVC];
	
	[pagesixVC release];
	
	// Replace the old stack with the modified copy
	[self.navigationController setViewControllers:navigationStack animated:NO];
	[navigationStack release];
	//[self stopAudio];
	
}

- (void) nextController {
	
	PageEightViewController *pageeightVC = [[PageEightViewController alloc] initWithNibName: @"PageEightViewController" bundle:nil];
	// Copy the view controllers stack from the navigation controller
	NSMutableArray *navigationStack = [[NSMutableArray alloc] initWithArray:self.navigationController.viewControllers];
	
	// Remove the current view controller
	[navigationStack removeLastObject];
	
	// Add the next view controller
	pageeightVC.hidesBottomBarWhenPushed = YES;
	[navigationStack addObject:pageeightVC];
	
	[pageeightVC release];
	
	// Replace the old stack with the modified copy
	[self.navigationController setViewControllers:navigationStack animated:NO];
	[navigationStack release];
	//[self stopAudio];
}



#pragma mark 
#pragma mark - Audio Methods

-(void)loadAudioFile {
	//audio loads
	//[self stopAudio];
	//[_player release];
	
	// Load the audio file
	if(player == nil){	
		NSString *audioFile = [NSString stringWithFormat:@"nolac7"];
		NSString *pathForAudio = [[NSBundle mainBundle] pathForResource:audioFile ofType:@"mp3"];
		player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:pathForAudio] error:nil];
		[player setDelegate:self];
		
		
		NSError *setCategoryError = nil;
		[[AVAudioSession sharedInstance]
		 setCategory: AVAudioSessionCategoryPlayback
		 error: &setCategoryError];
		
		if (setCategoryError) { /* handle the error condition */ }	
	}
	
	if (player)
	{
		[self updateViewForPlayerInfo];
		[self updateViewForPlayerState];
	}
	
}

- (void)startPlayback {
	if ([player play])
	{
		[self updateViewForPlayerState];
		player.delegate = self;
	}
	else
		NSLog(@"Could not play %@\n", player.url);
}

- (void)pausePlayback {
	[player pause];
	[self updateViewForPlayerState];
}

- (void)stopAudio {
	[player pause];
	[self updateViewForPlayerState];
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
	NSLog(@"Playback finished");
	if (flag == NO)
		NSLog(@"Playback finished unsuccessfully");
	[self updateCurrentTime];
	[self updateViewForPlayerState];
}


#pragma mark 
#pragma mark - Audio Control Methods

- (void)createSlideUpAudioControlView {
	
	
	NSLog (@"createSlideUpAudioControlView executed");
	
	CGRect bounds = [[self view] bounds];
	CGRect frame = CGRectMake(CGRectGetMinX(bounds), -AUDIOCONTROLCONTAINERHEIGHT, bounds.size.width, AUDIOCONTROLCONTAINERHEIGHT);
	slideUpView = [[UIView alloc] initWithFrame:frame];
	[slideUpView setBackgroundColor:[UIColor blackColor]];
	[slideUpView setOpaque:NO];
	[slideUpView setAlpha:0.7];
	
	[playButton setBackgroundImage:[UIImage imageNamed:@"Playbutton.png"]forState:UIControlStateNormal];
	
	updateTimer = nil;
	self.duration.adjustsFontSizeToFitWidth = YES;
	self.currentTime.adjustsFontSizeToFitWidth = YES;
	
	playButton = [[UIButton alloc] initWithFrame:CGRectMake(16, 7, 30, 30)];
	[playButton addTarget:self action:@selector(playButtonPressed:) forControlEvents:(UIControlEventTouchUpInside)];
	[slideUpView addSubview:playButton];
	[playButton release];
	
	progressBar = [[UISlider alloc] initWithFrame:CGRectMake(95, 5, 180, 33)];
	[progressBar addTarget:self action:@selector(progressSliderMoved:) forControlEvents:(UIControlEventValueChanged)];
	[slideUpView addSubview:progressBar];
	[progressBar release];
	
	currentTime = [[UILabel alloc] initWithFrame:CGRectMake(60, 5, 33 , 33)];
	[currentTime setTextColor:[UIColor whiteColor]];
	[currentTime setBackgroundColor:[UIColor clearColor]];
	[currentTime setAdjustsFontSizeToFitWidth:YES];
	[slideUpView addSubview:currentTime];
	[currentTime release];
	
	duration = [[UILabel alloc] initWithFrame:CGRectMake(277, 5, 33 , 33)];
	[duration setTextColor:[UIColor whiteColor]];
	[duration setBackgroundColor:[UIColor clearColor]];
	[duration setAdjustsFontSizeToFitWidth:YES];
	[slideUpView addSubview:duration];
	[duration release];
	
	[[self view] addSubview:slideUpView];
	[slideUpView release];
	
	[self updateCurrentTime];
	[self updateViewForPlayerInfo];
	[self updateViewForPlayerState];
	
	extern BOOL thumbViewShowing;
	if (thumbViewShowing == YES){
		frame.origin.y = AUDIOCONTROLSHOWHEIGHT;
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.30];
		[slideUpView setFrame:frame];
		[UIView commitAnimations];
	}
	
}



-(IBAction)toggleAudioControls {
	[self toggleThumbView];
}

- (void)toggleThumbView {
	
	extern BOOL thumbViewShowing;
    CGRect frame = [slideUpView frame];
	
	NSLog(@"The value of thumbviewshowing - toggle1 is %@\n", (thumbViewShowing ? @"YES" : @"NO"));	
    
	if (thumbViewShowing) 
	{
		frame.origin.y = -AUDIOCONTROLCONTAINERHEIGHT;
	} 
	else {
		frame.origin.y = AUDIOCONTROLSHOWHEIGHT;
	}
	[UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.30];
    [slideUpView setFrame:frame];
    [UIView commitAnimations];
    thumbViewShowing = !thumbViewShowing;
	
	NSLog(@"The value of thumbviewshowing - toggle3 is %@\n", (thumbViewShowing ? @"YES" : @"NO"));	
}

-(void)updateCurrentTime {
	self.currentTime.text = [NSString stringWithFormat:@"%d:%02d", (int)player.currentTime / 60, (int)player.currentTime % 60, nil];
	self.progressBar.value = player.currentTime;
}

- (void)updateViewForPlayerState {
	NSLog(@"updateviewforplayerstate");
	[self updateCurrentTime];
	
	if (updateTimer) 
		[updateTimer invalidate];
	
	if (player.playing)
	{
		[playButton setBackgroundImage:[UIImage imageNamed:@"pausebutton.png"]forState:UIControlStateNormal];
		updateTimer = [NSTimer scheduledTimerWithTimeInterval:.01 target:self selector:@selector(updateCurrentTime) userInfo:player repeats:YES];
	}
	else
	{
		[playButton setBackgroundImage:[UIImage imageNamed:@"Playbutton.png"]forState:UIControlStateNormal];
		updateTimer = nil;
	}
}

-(void)updateViewForPlayerInfo {
	NSLog(@"updatedviewforplayerinfo");
	self.progressBar.minimumValue = 0.0;	
	self.duration.text = [NSString stringWithFormat:@"%d:%02d", (int)player.duration / 60, (int)player.duration % 60, nil];
	NSLog(@"duration text in updateviewforplayerinfo method: %@",self.duration.text);
	self.progressBar.maximumValue = player.duration;
	NSLog(@"duration progressbar maximumvalue updateviewforplayerinfo method: %f",self.progressBar.maximumValue);
}


- (IBAction)playButtonPressed:(UIButton *)sender {
	if (player.playing == YES)
		[self pausePlayback];
	else
		[self startPlayback];
}
- (IBAction)progressSliderMoved:(UISlider *)sender {
	player.currentTime = sender.value;
	[self updateCurrentTime];
}



#pragma mark 
#pragma mark - Large Photo Control Methods

- (IBAction)photoTapped:(id)sender {
	
	NSLog(@"phototapped");
	stopAudioOverride = YES;
	NSLog(@"The value of stopAudioOverride is %@\n", (stopAudioOverride ? @"YES" : @"NO"));
	NSString *title = [sender titleForState:UIControlStateNormal];
	NSLog(@"This is theimage name for title: %@", title);
	
    LargePhotoViewController *largePhotoViewController = [[LargePhotoViewController alloc] init];
	largePhotoViewController.photoName = title;
	[self.navigationController pushViewController:largePhotoViewController animated:YES];
	[largePhotoViewController release];
	
}



@end
