//
//  PhotoGalleryViewController.h
//  burn-ios-app
//
//  Created by Anita Santoso on 13/10/13.
//  Copyright (c) 2013 burn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageCell.h"
#import "Photo.h"

@interface PhotoGalleryViewController : UICollectionViewController
@property (nonatomic, strong) NSArray *photos;
@end
