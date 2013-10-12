//
//  PhotoViewController.m
//  burn-ios-app
//
//  Created by Anita Santoso on 13/10/13.
//  Copyright (c) 2013 burn. All rights reserved.
//

#import "PhotoViewController.h"
#import "UIImageView+AFNetworking.h"
#import "EyeEmNetworkService.h"
#import "LoadingView.h"

@interface PhotoViewController ()
@property (strong, nonatomic) IBOutlet UILabel *infoLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation PhotoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.imageView setImageWithURL:[NSURL URLWithString:self.photo.photoURL]];

//    [LoadingView show];
//    [[EyeEmNetworkService sharedInstance]fetchPhotoDetails:self.photo completion:^() {
//        [LoadingView hide];
//        self.infoLabel.text = [NSString stringWithFormat:@"Latitude: %f - longitude: %f", self.photo.location.latitude, self.photo.location.longitude];
//        // TODO show GPS info
//    } error:^(NSString *errorMsg) {
//        [LoadingView hide];
//        // TODO alert view
//    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
