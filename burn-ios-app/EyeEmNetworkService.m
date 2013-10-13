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

#define kAccessTokenKey @"BURN_APP_ACCESS_TOKEN"
#define kAPIKey @"BURN_APP_KEY"

@interface EyeEmNetworkService()
@property (nonatomic, strong) AFHTTPClient *httpClient;
@end

@implementation EyeEmNetworkService

JTSYNTHESIZE_SINGLETON_FOR_CLASS(EyeEmNetworkService)

- (id)init {
    if(self = [super init]) {
        
        self.httpClient = [[AFHTTPClient alloc]initWithBaseURL:[NSURL URLWithString:kBaseURL]];
        self.accessToken = [[NSUserDefaults standardUserDefaults]objectForKey:kAccessTokenKey];
        self.apiCode = [[NSUserDefaults standardUserDefaults]objectForKey:kAPIKey];
        
        //52.500601,13.454376
        self.currentLocation = CLLocationCoordinate2DMake(52.500601, 13.454376);
    }
    return self;
}

- (BOOL)isAuthenticated {
    return self.accessToken && self.apiCode;
}

- (void)setApiCode:(NSString *)apiCode {
    _apiCode = apiCode;
    [[NSUserDefaults standardUserDefaults]setObject:_apiCode forKey:kAPIKey];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

- (void)fetchPhotosDetails:(NSArray*)photos completion:(void (^)(void))completionBlock error:(void (^)(NSString *errorMsg))errorBlock {
    
    NSMutableArray *photoIDs = [NSMutableArray array];
    for(Photo *photo in photos) {
        [photoIDs addObject:photo.photoID];
    }
    NSURLRequest *request = [self.httpClient requestWithMethod:@"GET" path:@"/api/v2/photos" parameters:@{@"access_token" : self.accessToken, @"ids" : [photoIDs componentsJoinedByString:@","]}];
    
    AFJSONRequestOperation *op = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        // TODO get details
        NSLog(0);
        NSDictionary *allPhotos = [JSON objectForKey:@"photos"];
        NSArray *items = [allPhotos objectForKey:@"items"];
        for(NSDictionary *item in items) {
            
        }
//        NSString *lat = [data objectForKey:@"latitude"];
//        NSString *lngtd = [data objectForKey:@"longitude"];
//        photo.location = CLLocationCoordinate2DMake([lat doubleValue], [lngtd doubleValue]);
        completionBlock();
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        errorBlock(nil);
    }];
    [self.httpClient enqueueHTTPRequestOperation:op];
}

//https://www.eyeem.com/api/v2/photos/18682872?access_token=f7712c1af4b921bae38093ffd1a2b6fa0cf55ccf
- (void)fetchPhotoDetails:(Photo*)photo completion:(void (^)(void))completionBlock error:(void (^)(NSString *errorMsg))errorBlock {

    NSURLRequest *request = [self.httpClient requestWithMethod:@"GET" path:[NSString stringWithFormat:@"/api/v2/photos/%@", photo.photoID] parameters:@{@"access_token" : self.accessToken}];
    AFJSONRequestOperation *op = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        // TODO get details
        NSDictionary *data = [JSON objectForKey:@"photo"];
        NSString *lat = [data objectForKey:@"latitude"];
        NSString *lngtd = [data objectForKey:@"longitude"];
        photo.location = CLLocationCoordinate2DMake([lat doubleValue], [lngtd doubleValue]);
        completionBlock();
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        errorBlock(nil);
    }];
    [self.httpClient enqueueHTTPRequestOperation:op];
}

/**
 https://www.eyeem.com/api/v2/albums?geoSearch=nearbyVenues&lat=52.4875&lng=13.3833&type=venue
https://www.eyeem.com/api/v2/albums?geoSearch=nearbyVenues&lat=52.50094140368&lng=13.452136079944&access_token=1cfbbaa6ee0a8c506f3304744e9cbe8310f96631
 **/
- (void)fetchPhotosHavingCoordinates:(CLLocationCoordinate2D)coordinates completion:(void (^)(NSArray *photos))completionBlock error:(void (^)(NSString *errorMsg))errorBlock {
    
    NSURLRequest *request = [self.httpClient requestWithMethod:@"GET" path:@"/api/v2/albums" parameters:@{@"geoSearch" : @"nearbyVenues", @"lat" : @(coordinates.latitude), @"lng" : @(coordinates.longitude), @"type" : @"venue", @"access_token" : self.accessToken}];
    
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
        [[NSUserDefaults standardUserDefaults]setObject:self.accessToken forKey:kAccessTokenKey];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
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
