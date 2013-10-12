//
//  EyeEmNetworkService.m
//  burn-ios-app
//
//  Created by Anita Santoso on 13/10/13.
//  Copyright (c) 2013 burn. All rights reserved.
//

#import "EyeEmNetworkService.h"
#import "AFNetworking.h"

#define kBaseURL @"https://www.eyeem.com"
#define kClientID @"Sb2PFEeTnV2sb6vtAzoubLXqEz0imxuo"
#define kClientSecret @"6UYKGWJCJSqcQ2TVkbh5dcM4FJj3xY1R"

@interface EyeEmNetworkService()
@property (nonatomic, strong) AFHTTPClient *httpClient;
@end

@implementation EyeEmNetworkService

JTSYNTHESIZE_SINGLETON_FOR_CLASS(EyeEmNetworkService)

- (id)init {
    if(self = [super init]) {
        self.httpClient = [[AFHTTPClient alloc]initWithBaseURL:[NSURL URLWithString:kBaseURL]];
    }
    return self;
}

/**
 https://www.eyeem.com/api/v2/albums?geoSearch=nearbyVenues&lat=52.4875&lng=13.3833&type=venue
https://www.eyeem.com/api/v2/albums?geoSearch=nearbyVenues&lat=52.50094140368&lng=13.452136079944&access_token=1cfbbaa6ee0a8c506f3304744e9cbe8310f96631
 **/
- (void)fetchPhotosHavingCoordinates:(CLLocationCoordinate2D)coordinates completion:(void (^)(NSArray *photos))completionBlock error:(void (^)(NSString *errorMsg))errorBlock {
    
    NSURLRequest *request = [self.httpClient requestWithMethod:@"GET" path:@"/api/v2/albums" parameters:@{@"geoSearch" : @"nearbyVenues", @"lat" : @(52.50094140368), @"lng" : @(13.452136079944), @"type" : @"venue", @"access_token" : self.accessToken}];
    
    AFJSONRequestOperation *op = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        NSDictionary *albums = [JSON objectForKey:@"albums"];
        NSArray *items = [albums objectForKey:@"items"];
        
        NSMutableArray *photoObjects = [NSMutableArray array];
        for(NSDictionary *item in items) {
            
            NSString *venueName = [item objectForKey:@"name"];
            NSDictionary *photos = [item objectForKey:@"photos"];
            NSArray *photoItems = [photos objectForKey:@"items"];
            
            for(NSDictionary *photoItem in photoItems) {
                NSString *photoURL = [photoItem objectForKey:@"photoUrl"];
                NSString *thumbnailURL = [photoItem objectForKey:@"thumbUrl"];
                NSString *photoID = [photoItem objectForKey:@"id"];
                
                // create internal object
                Photo *photo = [[Photo alloc]initWithDictionary:@{@"photo_id" : photoID, @"photo_url" : photoURL, @"thumbnail_url" : thumbnailURL}];
                [photoObjects addObject:photo];
            }
        }
        completionBlock(photoObjects);
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(0);
    }];
    [self.httpClient enqueueHTTPRequestOperation:op];
}

/**
 curl -X POST "http://www.eyeem.com/api/v2/oauth/token?grant_type=authorization_code&client_id=Chi6ae5sLes9beCinae5sohM&client_secret=IeBai4eeloRoiw3e&redirect_uri=http://example.com/callback&code=Yeenie1H"
 **/
- (void)requestAccessTokenWithCompletion:(void (^)(void))completionBlock error:(void (^)(NSString *errorMsg))errorBlock {
    NSURLRequest *request = [self.httpClient requestWithMethod:@"POST" path:@"/api/v2/oauth/token" parameters:@{@"grant_type" : @"authorization_code", @"client_id" : kClientID, @"client_secret" : kClientSecret, @"code" : self.apiCode, @"redirect_uri" : @"burnapp://eyeem_auth"}];
                                                                                                         
    AFJSONRequestOperation *op = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        // TODO keep track of expiry?
        self.accessToken = [JSON objectForKey:@"access_token"];
        completionBlock();
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        errorBlock(nil);
    }];
    [self.httpClient enqueueHTTPRequestOperation:op];
}

- (void)authenticate {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.eyeem.com/oauth/authorize?response_type=code&client_id=%@&redirect_uri=burnapp://eyeem_auth", kClientID]]];
}

@end
