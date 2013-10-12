//
//  LoadingView.m
//  PhotoSoundApp
//
//  Created by Anita Santoso on 9/10/13.
//  Copyright (c) 2013 as. All rights reserved.
//

#import "LoadingView.h"

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

+ (void)show {
    LoadingView *loadingView = [[[NSBundle mainBundle]loadNibNamed:@"LoadingView" owner:nil options:nil]firstObject];
    [[[UIApplication sharedApplication]keyWindow] addSubview:loadingView];
}

+ (void)hide {
    [[[[[UIApplication sharedApplication]keyWindow]subviews]lastObject]removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
