//
//  ImageCell.h
//  PhotoSoundApp
//
//  Created by Anita Santoso on 9/10/13.
//  Copyright (c) 2013 as. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *infoLabel;

- (void)setImageURL:(NSURL*)imageURL;

@end
