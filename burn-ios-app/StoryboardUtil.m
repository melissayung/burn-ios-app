//
//  StoryboardUtil.m
//  PhotoSoundApp
//
//  Created by Anita Santoso on 9/10/13.
//  Copyright (c) 2013 as. All rights reserved.
//

#import "StoryboardUtil.h"

@implementation StoryboardUtil

+ (UIViewController*)loadInitialViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *viewCon = [storyboard instantiateInitialViewController];
    return viewCon;
}

+ (UIViewController*)loadViewControllerWithID:(NSString*)viewConID {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *viewCon = [storyboard instantiateViewControllerWithIdentifier:viewConID];
    return viewCon;
}

@end
