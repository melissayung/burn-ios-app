//
//  GeoCodeService.h
//  burn-ios-app
//
//  Created by Anita Santoso on 13/10/13.
//  Copyright (c) 2013 burn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import "JTSingleton.h"

@interface GeoCodeService : NSObject
+ (GeoCodeService*)sharedInstance;
- (void)lookUpAddressFromCoordinate:(CLLocationCoordinate2D)coordinate completion:(void (^)(NSString *location))completionBlock error:(void (^)(NSString *errorMsg))errorBlock;
@end
