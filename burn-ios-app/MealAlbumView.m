//
//  MealAlbumView.m
//  burn-ios-app
//
//  Created by Melissa Yung on 10/12/13.
//  Copyright (c) 2013 burn. All rights reserved.
//

#import "MealAlbumView.h"

@implementation MealAlbumView
{
    UIImageView *coverImage;
    UIActivityIndicatorView *indicator;
}

- (id)initWithFrame:(CGRect)frame mealImage:(NSString*)mealImage highlightedMealImage:(NSString*)highlightedMealImage
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        self.backgroundColor = [UIColor blackColor];
        self.mealImage = mealImage;
        // the coverImage has a 5 pixels margin from its frame
        coverImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, frame.size.width-10, frame.size.height-10)];
        [self addSubview:coverImage];
        
        self.overlay = [[UIView alloc]initWithFrame:CGRectMake(0, 0, coverImage.frame.size.width, coverImage.frame.size.height)];
        self.overlay.backgroundColor = [UIColor blackColor];
        self.overlay.alpha = 0.5;
        
//        indicator = [[UIActivityIndicatorView alloc] init];
//        indicator.center = self.center;
//        indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
//        [indicator startAnimating];
//        [self addSubview:indicator];
        
//        coverImage.backgroundColor = [UIColor yellowColor];
        [coverImage setImage:[UIImage imageNamed:mealImage]];
        
        //        [coverImage addObserver:self forKeyPath:@"image" options:0 context:nil];
        //        [[NSNotificationCenter defaultCenter] postNotificationName:@"BLDownloadImageNotification"
        //                                                            object:self
        //                                                          userInfo:@{@"imageView":coverImage, @"imagePath":mealImage, @"highlightedImagePath":highlightedMealImage}];
    }
    return self;
}

- (void)setSelected:(BOOL)selected {
    _selected = selected;
    if(_selected) {
        [coverImage addSubview:self.overlay];
    } else {
        [self.overlay removeFromSuperview];
    }
}

- (void)dealloc
{
//    [coverImage removeObserver:self forKeyPath:@"image"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"image"])
    {
        [indicator stopAnimating];
    }
}

@end