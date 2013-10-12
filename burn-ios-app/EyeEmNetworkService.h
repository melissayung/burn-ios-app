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

- (void)fetchPhotosHavingCoordinates:(CLLocationCoordinate2D)coordinates completion:(void (^)(NSArray *photos))completionBlock error:(void (^)(NSString *errorMsg))errorBlock;

- (void)requestAccessTokenWithCompletion:(void (^)(void))completionBlock error:(void (^)(NSString *errorMsg))errorBlock;
- (void)authenticate;
@end
