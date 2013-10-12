//
//  PersistencyManager.m
//  burn-ios-app
//
//  Created by Melissa Yung on 10/12/13.
//  Copyright (c) 2013 burn. All rights reserved.
//

#import "PersistencyManager.h"

@interface PersistencyManager () {
    // an array of all meals
    NSMutableArray *meals;
}
@end

@implementation PersistencyManager
- (id)init
{
    self = [super init];
    if (self) {
    	// a dummy list of meals
        meals = [NSMutableArray arrayWithArray:
                 @[[[Meal alloc] initWithLabel:@"Soup" imagePath:@"soup.jpg"],
                   [[Meal alloc] initWithLabel:@"Pasta" imagePath:@"pasta.jpeg"],
                   [[Meal alloc] initWithLabel:@"Ham and Cheese Sandwich" imagePath:@"sandwich.jpg"],
                   [[Meal alloc] initWithLabel:@"Pizza Slice" imagePath:@"pizzaSlice.jpg"],
                   [[Meal alloc] initWithLabel:@"Caesar Salad" imagePath:@"caesarSalad.jpg"]]];
    }
    return self;
}

- (NSArray*)getMeals
{
    return meals;
}

- (void)addMeal:(Meal*)meal atIndex:(int)index
{
    if (meals.count >= index)
    	[meals insertObject:meal atIndex:index];
    else
    	[meals addObject:meal];
}

- (void)deleteMealAtIndex:(int)index
{
    [meals removeObjectAtIndex:index];
}

- (void)saveImage:(UIImage*)image filename:(NSString*)filename
{
    filename = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@", filename];
    NSData *data = UIImagePNGRepresentation(image);
    [data writeToFile:filename atomically:YES];
}

- (UIImage*)getImage:(NSString*)filename
{
    filename = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@", filename];
    NSData *data = [NSData dataWithContentsOfFile:filename];
    return [UIImage imageWithData:data];
}

@end
