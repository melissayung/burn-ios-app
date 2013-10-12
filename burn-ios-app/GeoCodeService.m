//
//  GeoCodeService.m
//  burn-ios-app
//
//  Created by Anita Santoso on 13/10/13.
//  Copyright (c) 2013 burn. All rights reserved.
//

#import "GeoCodeService.h"

@interface GeoCodeService()

@end

@implementation GeoCodeService
JTSYNTHESIZE_SINGLETON_FOR_CLASS(GeoCodeService)

- (id)init {
    if(self = [super init]) {
        
    }
    return self;
}
/**
         self.currentLocation = CLLocationCoordinate2DMake(13.452136079944, 52.50094140368);
 http://maps.googleapis.com/maps/api/geocode/json?latlng=13.452136079944,52.50094140368&sensor=false
 **/
- (void)lookUpAddressFromCoordinate:(CLLocationCoordinate2D)coordinate completion:(void (^)(NSString *location))completionBlock error:(void (^)(NSString *errorMsg))errorBlock {
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:[[CLLocation alloc]initWithLatitude:coordinate.latitude longitude:coordinate.longitude] completionHandler:

     ^(NSArray* placemarks, NSError* error){
         NSString *locDesc;
         if(placemarks.count > 0) {
             CLPlacemark *placemark = [placemarks firstObject];
             locDesc = [NSString stringWithFormat:@"%@ - %@, %@", placemark.name, placemark.subLocality, placemark.locality];
         }
         completionBlock(locDesc);
     }];
}

@end
