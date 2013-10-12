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
                 @[[[Meal alloc] initWithLabel:@"Warm soup" imagePath:@"soup.jpg" highlightedImagePath:@"sushi.jpg" calories:140],
                   [[Meal alloc] initWithLabel:@"A pasta plate" imagePath:@"pasta.jpeg"highlightedImagePath:@"sushi.jpg" calories:500],
                   [[Meal alloc] initWithLabel:@"A ham & cheese sandwich" imagePath:@"sandwich.jpg" highlightedImagePath:@"sushi.jpg" calories:350],
                   [[Meal alloc] initWithLabel:@"A slice of pizza" imagePath:@"pizzaSlice.jpg" highlightedImagePath:@"sushi.jpg" calories:310],
                   [[Meal alloc] initWithLabel:@"Caesar salad" imagePath:@"caesarSalad.jpg" highlightedImagePath:@"sushi.jpg" calories:170],
                   [[Meal alloc] initWithLabel:@"A sushi roll" imagePath:@"sushi.jpg" highlightedImagePath:@"sushi.jpg" calories:130]]];

    
        drinks = [NSMutableArray arrayWithArray:
                 @[[[Meal alloc] initWithLabel:@"Coke Zero" imagePath:@"cokeZero.jpg" highlightedImagePath:@"sushi.jpg" calories:0],
                   [[Meal alloc] initWithLabel:@"Minute Maid apple juice" imagePath:@"minuteMaidAppleJuice.jpg"highlightedImagePath:@"sushi.jpg" calories:110],
                   [[Meal alloc] initWithLabel:@"Glaceau Vitamin water" imagePath:@"vitaminWater.jpg" highlightedImagePath:@"sushi.jpg" calories:65],
                   [[Meal alloc] initWithLabel:@"Cappuccino" imagePath:@"coffee.jpg" highlightedImagePath:@"sushi.jpg" calories:100],
                   
                   [[Meal alloc] initWithLabel:@"A glass of red wine" imagePath:@"redWine.jpg" highlightedImagePath:@"sushi.jpg" calories:150],
                   [[Meal alloc] initWithLabel:@"A pint of beer" imagePath:@"beer.jpg" highlightedImagePath:@"sushi.jpg" calories:150]]];
        
        desserts = [NSMutableArray arrayWithArray:
                  @[[[Meal alloc] initWithLabel:@"A large apple" imagePath:@"apple.jpg" highlightedImagePath:@"sushi.jpg" calories:115],
                    [[Meal alloc] initWithLabel:@"A slice of cheese" imagePath:@"cheese.jpg"highlightedImagePath:@"sushi.jpg" calories:110],
                    [[Meal alloc] initWithLabel:@"A doughnut" imagePath:@"donut.jpg" highlightedImagePath:@"sushi.jpg" calories:190],
                    [[Meal alloc] initWithLabel:@"A slice of choc cake" imagePath:@"chocolateCake.jpg" highlightedImagePath:@"sushi.jpg" calories:235],
                    [[Meal alloc] initWithLabel:@"Some yoghurt" imagePath:@"yoghurt.jpg" highlightedImagePath:@"sushi.jpg" calories:65],
                    [[Meal alloc] initWithLabel:@"Couple of ice cream scoops" imagePath:@"iceCream.jpg" highlightedImagePath:@"sushi.jpg" calories:145]]];
        
        
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
