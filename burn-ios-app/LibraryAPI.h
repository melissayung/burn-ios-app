//
//  LibraryAPI.h
//  burn-ios-app
//
//  Created by Melissa Yung on 10/12/13.
//  Copyright (c) 2013 burn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Meal.h"

@interface LibraryAPI : NSObject

+ (LibraryAPI*)sharedInstance;
- (NSArray*)getMeals;
- (void)addMeal:(Meal*)meal atIndex:(int)index;
- (void)deleteMealAtIndex:(int)index;

@end
