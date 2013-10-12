//
//  Meal.m
//  burn-ios-app
//
//  Created by Melissa Yung on 10/12/13.
//  Copyright (c) 2013 burn. All rights reserved.
//

#import "Meal.h"

@implementation Meal
- (id)initWithLabel:(NSString*)label imagePath:(NSString*)image
{
    self = [super init];
    if (self)
    {
        _label = label;
        _imagePath = image;
    }
    return self;
}
@end
