//
//  LocationManager.h
//  IICaptain
//
//  Created by Anita Santoso on 24/01/13.
//  Copyright (c) 2013 SEW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JTSingleton.h"
#import <CoreMotion/CMMotionManager.h>
#import <CoreLocation/CoreLocation.h>

@protocol LocationUpdateDelegate
- (void)locationMovedTo:(CLLocation*)location;
@end

@interface LocationManager : NSObject<CLLocationManagerDelegate>

+ (LocationManager*)sharedInstance;
@property (nonatomic, strong) CLLocation *currentLocation;
@property id<LocationUpdateDelegate> delegate;
- (void)startUpdatingLocation;

@property CLAuthorizationStatus authorisationStatus;
@end
