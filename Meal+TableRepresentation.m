//
//  Meal+TableRepresentation.m
//  burn-ios-app
//
//  Created by Melissa Yung on 10/12/13.
//  Copyright (c) 2013 burn. All rights reserved.
//

#import "Meal+TableRepresentation.h"

@implementation Meal (TableRepresentation)
- (NSDictionary*)tr_tableRepresentation
{
    return @{@"titles":@[@"Meal"],
             @"values":@[self.label]};
}
@end
