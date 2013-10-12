//
//  ImageCell.m
//  PhotoSoundApp
//
//  Created by Anita Santoso on 9/10/13.
//  Copyright (c) 2013 as. All rights reserved.
//

#import "ImageCell.h"
#import "UIImageView+AFNetworking.h"

@implementation ImageCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setImageURL:(NSURL*)imageURL {
    [self setBackgroundColor:[UIColor grayColor]];
    [self.imageView setImageWithURL:imageURL];
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
