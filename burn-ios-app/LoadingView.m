//
//  LoadingView.m
//  PhotoSoundApp
//
//  Created by Anita Santoso on 9/10/13.
//  Copyright (c) 2013 as. All rights reserved.
//

#import "LoadingView.h"
#import <QuartzCore/QuartzCore.h>

@interface LoadingView()
@property (strong, nonatomic) IBOutlet UILabel *textLabel;
@property (strong, nonatomic) IBOutlet UIView *bgView;

@end

@implementation LoadingView
JTSYNTHESIZE_SINGLETON_FOR_CLASS(LoadingView)

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib {
    self.bgView.layer.cornerRadius = 10;
    self.bgView.layer.masksToBounds = YES;
}

+ (void)showWithText:(NSString*)text {
    LoadingView *loadingView = [[[NSBundle mainBundle]loadNibNamed:@"LoadingView" owner:nil options:nil]firstObject];
    ((UILabel*)[loadingView viewWithTag:99]).text = text;
    loadingView.alpha = 0.0;
    [[[UIApplication sharedApplication]keyWindow] addSubview:loadingView];
    [UIView animateWithDuration:0.3 animations:^{
        loadingView.alpha = 1.0;
    }];
}

+ (void)show {
    [LoadingView showWithText:@"Loading..."];
}

+ (void)hide {
    UIView *loadingView = [[[[UIApplication sharedApplication]keyWindow]subviews]lastObject];
    [UIView animateWithDuration:0.3 animations:^{
        loadingView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [loadingView removeFromSuperview];
    }];
}

@end
