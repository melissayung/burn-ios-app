//
//  StoryboardUtil.h
//  PhotoSoundApp
//
//  Created by Anita Santoso on 9/10/13.
//  Copyright (c) 2013 as. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoryboardUtil : NSObject

+ (UIViewController*)loadViewControllerWithID:(NSString*)viewConID;
+ (UIViewController*)loadInitialViewController;
@end
