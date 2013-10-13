//
//  MealAlbumView.h
//  burn-ios-app
//
//  Created by Melissa Yung on 10/12/13.
//  Copyright (c) 2013 burn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MealAlbumView : UIView

-(id)initWithFrame:(CGRect)frame mealImage:(NSString*)mealImage highlightedMealImage:(NSString*)highlightedMealImage;
@property (nonatomic) BOOL selected;
@property (nonatomic, strong) NSString *mealImage;
@property (nonatomic, strong) UIView *overlay;
@end
