//
//  Meal.h
//  burn-ios-app
//
//  Created by Melissa Yung on 10/12/13.
//  Copyright (c) 2013 burn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Meal : NSObject

@property (nonatomic, copy, readonly) NSString *label, *imagePath;

- (id)initWithLabel:(NSString*)label imagePath:(NSString*)image;

@end
