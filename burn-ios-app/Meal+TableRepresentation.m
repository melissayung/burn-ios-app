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
    return @{@"titles":@[@"Food"],
             @"values":@[self.label]};
}

- (NSDictionary*)tr_drinkTableRepresentation
{
    return @{@"titles":@[@"Drink"],
             @"values":@[self.label]};
}

- (NSDictionary*)tr_dessertTableRepresentation
{
    return @{@"titles":@[@"Treat"],
             @"values":@[self.label]};
}
@end
