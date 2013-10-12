//
//  Photo.m
//  burn-ios-app
//
//  Created by Anita Santoso on 13/10/13.
//  Copyright (c) 2013 burn. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (id)initWithDictionary:(NSDictionary*)dict {
    if(self = [super init]) {
        self.photoURL = [dict objectForKey:@"photo_url"];
        self.thumbnailURL = [dict objectForKey:@"thumbnail_url"];
        self.photoID = [dict objectForKey:@"photo_id"];
        
        // TODO grab lat long
    }
    return self;
}

@end
