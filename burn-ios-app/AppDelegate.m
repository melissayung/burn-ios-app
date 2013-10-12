//
//  AppDelegate.m
//  burn-ios-app
//
//  Created by Anita Santoso on 12/10/13.
//  Copyright (c) 2013 burn. All rights reserved.
//

#import "AppDelegate.h"
#import "StoryboardUtil.h"
#import "ViewController.h"
#import "EyeEmNetworkService.h"

@interface AppDelegate()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
//    UINavigationController *navCon = [[UINavigationController alloc]initWithRootViewController:[StoryboardUtil loadViewControllerWithID:@"TourView"]];
//    self.window.rootViewController = navCon;
//    [self.window makeKeyAndVisible];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    if([[url absoluteString]rangeOfString:@"burnapp://eyeem_auth"].location != NSNotFound) {
        NSString *codeParam = @"code=";
        NSString *urlStr = [url absoluteString];
        
        NSRange range = [urlStr rangeOfString:codeParam];
        if(range.location != NSNotFound) {
            int location = range.location+codeParam.length;
            NSString *apiCode = [urlStr substringWithRange:NSMakeRange(location, [urlStr length]-location)];
            [EyeEmNetworkService sharedInstance].apiCode = apiCode;
            [[EyeEmNetworkService sharedInstance]requestAccessTokenWithCompletion:^{
                
                ViewController *viewCon = [[ViewController alloc]init];
//                UINavigationController *navCon = [[UINavigationController alloc]initWithRootViewController:viewCon];
                self.window.rootViewController = viewCon;
            } error:^(NSString *errorMsg) {
                NSLog(0);
            }];
        }
       
    }
    return YES;
}

@end
