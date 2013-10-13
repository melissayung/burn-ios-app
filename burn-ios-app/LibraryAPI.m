//
//  LibraryAPI.m
//  burn-ios-app
//
//  Created by Melissa Yung on 10/12/13.
//  Copyright (c) 2013 burn. All rights reserved.
//

#import "LibraryAPI.h"
#import "PersistencyManager.h"
//#import "HTTPClient.h"

@interface LibraryAPI () {
    PersistencyManager *persistencyManager;
    //HTTPClient *httpClient;
    BOOL isOnline;
}
@end

@implementation LibraryAPI
+ (LibraryAPI*)sharedInstance
{
    // 1
    static LibraryAPI *_sharedInstance = nil;
    
    // 2
    static dispatch_once_t oncePredicate;
    
    // 3
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[LibraryAPI alloc] init];
    });
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        persistencyManager = [[PersistencyManager alloc] init];
        //httpClient = [[HTTPClient alloc] init];
        isOnline = NO;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(downloadImage:) name:@"BLDownloadImageNotification" object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)downloadImage:(NSNotification*)notification
{
    // 1
    UIImageView *imageView = notification.userInfo[@"imageView"];
    NSString *imagePath = notification.userInfo[@"imagePath"];
//    
//    UIImageView *highlightedImageView = notification.userInfo[@"highlightedImageView"];
//    NSString *highlightedImagePath = notification.userInfo[@"highlightedImagePath"];
//    
    // 2
    imageView.image = [UIImage imageNamed:imagePath];
//    highlightedImageView.image = [persistencyManager getImage:[highlightedImagePath lastPathComponent]];
    
//    if (imageView.image == nil)
//    {
//    	// 3
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            
//            UIImage *image = [UIImage imageNamed:imagePath];
//            //[httpClient downloadImage:coverUrl];
//            
//            // 4
//            dispatch_sync(dispatch_get_main_queue(), ^{
//                imageView.image = image;
//                [persistencyManager saveImage:image filename:[imagePath lastPathComponent]];
//            });
//        });
//    }
   
//    if (highlightedImageView.image == nil)
//    {
//    	// 3
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            
//            UIImage *highligtedImage = [UIImage imageNamed:highlightedImagePath];
//            //[httpClient downloadImage:coverUrl];
//            
//            // 4
//            dispatch_sync(dispatch_get_main_queue(), ^{
//                highlightedImageView.image = highligtedImage;
//                [persistencyManager saveImage:highligtedImage filename:[highlightedImagePath lastPathComponent]];
//            });
//        });
//    }

}

- (NSArray*)getMains
{
    return [persistencyManager getMains];
}

- (void)addMain:(Meal*)main atIndex:(int)index
{
    [persistencyManager addMeal:main atIndex:index];
    if (isOnline)
    {
        //[httpClient postRequest:@"/api/addAlbum" body:[album description]];
    }
}

- (void)deleteMainAtIndex:(int)index
{
    [persistencyManager deleteMealAtIndex:index];
    if (isOnline)
    {
        //[httpClient postRequest:@"/api/deleteAlbum" body:[@(index) description]];
    }
}

- (NSArray*)getDrinks
{
    return [persistencyManager getDrinks];
}

- (void)addDrink:(Meal*)drink atIndex:(int)index
{
    [persistencyManager addDrink:drink atIndex:index];
    if (isOnline)
    {
        //[httpClient postRequest:@"/api/addAlbum" body:[album description]];
    }
}

- (void)deleteDrinkAtIndex:(int)index
{
    [persistencyManager deleteDrinkAtIndex:index];
    if (isOnline)
    {
        //[httpClient postRequest:@"/api/deleteAlbum" body:[@(index) description]];
    }
}


- (NSArray*)getDesserts
{
    return [persistencyManager getDesserts];
}

- (void)addDessert:(Meal*)dessert atIndex:(int)index
{
    [persistencyManager addDessert:dessert atIndex:index];
    if (isOnline)
    {
        //[httpClient postRequest:@"/api/addAlbum" body:[album description]];
    }
}

- (void)deleteDessertAtIndex:(int)index
{
    [persistencyManager deleteDessertAtIndex:index];
    if (isOnline)
    {
        //[httpClient postRequest:@"/api/deleteAlbum" body:[@(index) description]];
    }
}


@end
