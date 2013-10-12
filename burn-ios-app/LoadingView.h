//
//  LoadingView.h
//  PhotoSoundApp
//
//  Created by Anita Santoso on 9/10/13.
//  Copyright (c) 2013 as. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTSingleton.h"

@interface LoadingView : UIView

+ (LoadingView*)sharedInstance;
+ (void)show;
+ (void)hide;

@end
