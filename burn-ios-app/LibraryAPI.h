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
- (NSArray*)getMains;
- (void)addMain:(Meal*)main atIndex:(int)index;
- (void)deleteMainAtIndex:(int)index;


- (NSArray*)getDrinks;
- (void)addDrink:(Meal*)drink atIndex:(int)index;
- (void)deleteDrinkAtIndex:(int)index;


- (NSArray*)getDesserts;
- (void)addDessert:(Meal*)dessert atIndex:(int)index;
- (void)deleteDessertAtIndex:(int)index;

@end
