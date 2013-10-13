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
    NSMutableArray *mains;
    
    NSMutableArray *drinks;
    
    NSMutableArray *desserts;
}
@end

@implementation PersistencyManager
- (id)init
{
    self = [super init];
    if (self) {
    	// a dummy list of meals
        mains = [NSMutableArray arrayWithArray:
                 @[[[Meal alloc] initWithLabel:@"Sushi Roll" imagePath:@"sushi.jpg" highlightedImagePath:@"sushi.jpg" calories:130],
                   [[Meal alloc] initWithLabel:@"Sandwich" imagePath:@"sandwich.jpg" highlightedImagePath:@"sushi.jpg" calories:280],
                   [[Meal alloc] initWithLabel:@"Pizza Slice" imagePath:@"pizzaSlice.jpg" highlightedImagePath:@"sushi.jpg" calories:310],
                   [[Meal alloc] initWithLabel:@"Caesar Salad" imagePath:@"caesarSalad.jpg" highlightedImagePath:@"sushi.jpg" calories:170],
                   [[Meal alloc] initWithLabel:@"Pasta" imagePath:@"pasta.jpg" highlightedImagePath:@"sushi.jpg" calories:400],
                   [[Meal alloc] initWithLabel:@"Warm Soup" imagePath:@"soup.jpg" highlightedImagePath:@"sushi.jpg" calories:140]]
                   ];

    
        drinks = [NSMutableArray arrayWithArray:
                 @[[[Meal alloc] initWithLabel:@"Can of Coca Cola" imagePath:@"coke2.jpg" highlightedImagePath:@"sushi.jpg" calories:135],
                   [[Meal alloc] initWithLabel:@"Cappuccino" imagePath:@"coffee.jpg" highlightedImagePath:@"sushi.jpg" calories:100],
                   [[Meal alloc] initWithLabel:@"Ice tea" imagePath:@"icetea.jpg" highlightedImagePath:@"sushi.jpg" calories:110],
                   [[Meal alloc] initWithLabel:@"Red Wine" imagePath:@"wine.jpg" highlightedImagePath:@"sushi.jpg" calories:150],
                   [[Meal alloc] initWithLabel:@"Apple Juice" imagePath:@"juice.jpg"highlightedImagePath:@"sushi.jpg" calories:110],
                   [[Meal alloc] initWithLabel:@"Beer" imagePath:@"pintOfBeer.jpg" highlightedImagePath:@"sushi.jpg" calories:150]]
                   ];
        //
        
        desserts = [NSMutableArray arrayWithArray:
                 @[[[Meal alloc] initWithLabel:@"An eclair" imagePath:@"littleBite.jpg" highlightedImagePath:@"bite.jpg" calories:140],
                   [[Meal alloc] initWithLabel:@"Frozen Yoghurt" imagePath:@"yog.jpg" highlightedImagePath:@"sushi.jpg" calories:65],
                   [[Meal alloc] initWithLabel:@"Gingerbread" imagePath:@"gingerbread2.jpg" highlightedImagePath:@"sushi.jpg" calories:95],
                   [[Meal alloc] initWithLabel:@"Chocolcate Cake" imagePath:@"chocCake.jpg" highlightedImagePath:@"sushi.jpg" calories:235],
                   [[Meal alloc] initWithLabel:@"A macaron" imagePath:@"macarons.jpg" highlightedImagePath:@"sushi.jpg" calories:90],
                   [[Meal alloc] initWithLabel:@"A doughnut" imagePath:@"dnut.jpg" highlightedImagePath:@"sushi.jpg" calories:110]]
                   ];
        
    }
    return self;
}

- (NSArray*)getMains
{
    return mains;
}

- (void)addMeal:(Meal*)meal atIndex:(int)index
{
    if (mains.count >= index)
    	[mains insertObject:meal atIndex:index];
    else
    	[mains addObject:meal];
}

- (void)deleteMealAtIndex:(int)index
{
    [mains removeObjectAtIndex:index];
}

- (NSArray*)getDrinks
{
    return drinks;
}

- (void)addDrink:(Meal*)drink atIndex:(int)index
{
    if (drinks.count >= index)
    	[drinks insertObject:drink atIndex:index];
    else
    	[drinks addObject:drink];
}

- (void)deleteDrinkAtIndex:(int)index
{
    [drinks removeObjectAtIndex:index];
}


- (NSArray*)getDesserts
{
    return desserts;
}

- (void)addDessert:(Meal*)dessert atIndex:(int)index
{
    if (desserts.count >= index)
    	[desserts insertObject:dessert atIndex:index];
    else
    	[desserts addObject:dessert];
}

- (void)deleteDessertAtIndex:(int)index
{
    [desserts removeObjectAtIndex:index];
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
