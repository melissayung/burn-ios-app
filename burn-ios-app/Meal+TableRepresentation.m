//
//  Meal+TableRepresentation.m
//  burn-ios-app
//
//  Created by Melissa Yung on 10/12/13.
//  Copyright (c) 2013 burn. All rights reserved.
//

#import "Meal+TableRepresentation.h"

@implementation Meal (TableRepresentation)
- (NSDictionary*)tr_mainTableRepresentation
{
    NSString *display = [NSString stringWithFormat:@"%@%@%i%@", self.label, @" (", self.calories, @" cals)"];
    
    return @{@"titles":@[@"Food"],
             @"values":@[display]};
}

- (NSDictionary*)tr_drinkTableRepresentation
{
    NSString *display = [NSString stringWithFormat:@"%@%@%i%@", self.label, @" (", self.calories, @" cals)"];
    return @{@"titles":@[@"Drink"],
             @"values":@[display]};
}

- (NSDictionary*)tr_dessertTableRepresentation
{
    NSString *display = [NSString stringWithFormat:@"%@%@%i%@", self.label, @" (", self.calories, @" cals)"];
    return @{@"titles":@[@"Treat"],
             @"values":@[display]};
}
@end
