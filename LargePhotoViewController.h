
//
//  LargePhotoViewController.h
//  Cocktail Zen
//
//  Created by Brad on 6/1/10.
//  Copyright 2010 __Rothrock Group, LLC__. All rights reserved.
//



@interface LargePhotoViewController : UIViewController {
    @private
        NSString *photoName;
        UIImageView *imageView;
}

@property(nonatomic, retain) NSString *photoName;
@property(nonatomic, retain) UIImageView *imageView;

@end
