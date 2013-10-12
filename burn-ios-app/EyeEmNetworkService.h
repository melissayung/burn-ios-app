//
//  EyeEmNetworkService.h
//  burn-ios-app
//
//  Created by Anita Santoso on 13/10/13.
//  Copyright (c) 2013 burn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JTSingleton.h"
#import "Photo.h"

@interface EyeEmNetworkService : NSObject

+(EyeEmNetworkService*)sharedInstance;
@property (nonatomic, strong) NSString *apiCode;
@property (nonatomic, strong) NSString *accessToken;

@property CLLocationCoordinate2D currentLocation;
- (void)fetchPhotosDetails:(NSArray*)photos completion:(void (^)(void))completionBlock error:(void (^)(NSString *errorMsg))errorBlock;
- (void)fetchPhotoDetails:(Photo*)photo completion:(void (^)(void))completionBlock error:(void (^)(NSString *errorMsg))errorBlock;
- (void)fetchPhotosHavingCoordinates:(CLLocationCoordinate2D)coordinates completion:(void (^)(NSArray *photos))completionBlock error:(void (^)(NSString *errorMsg))errorBlock;
- (void)requestAccessTokenWithCompletion:(void (^)(void))completionBlock error:(void (^)(NSString *errorMsg))errorBlock;
                                                               
- (void)authenticate;
- (BOOL)isAuthenticated;
@end
