//
//  Meal.m
//  burn-ios-app
//
//  Created by Melissa Yung on 10/12/13.
//  Copyright (c) 2013 burn. All rights reserved.
//

#import "Meal.h"

@implementation Meal
- (id)initWithLabel:(NSString*)label imagePath:(NSString*)image highlightedImagePath:(NSString *)highlightedImage calories:(int)cals
{
    self = [super init];
    if (self)
    {
        _label = label;
        _imagePath = image;
        _highlightedImagePath = highlightedImage;
        _calories = cals;
    }
    return self;
}
@end
