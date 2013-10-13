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
#import "GeoCodeService.h"
#import "MapViewController.h"
#import "StoryboardUtil.h"

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
    self.infoLabel.hidden = YES;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Map" style:UIBarButtonItemStyleBordered target:self action:@selector(showMap)];
    
    [[GeoCodeService sharedInstance]lookUpAddressFromCoordinate:[EyeEmNetworkService sharedInstance].currentLocation completion:^(NSString *location) {
        self.infoLabel.hidden = NO;
        self.infoLabel.text = [NSString stringWithFormat:@"%@\n(%d meters away)", location, self.photo.distancdeInM];
    } error:^(NSString *errorMsg) {
        
    }];
    self.infoLabel.text = [NSString stringWithFormat:@"Latitude: %f - longitude: %f", self.photo.location.latitude, self.photo.location.longitude];
}

- (void)showMap {
    [UIView beginAnimations:@"animation" context:nil];
    MapViewController *mapViewCon = (MapViewController*)[StoryboardUtil loadViewControllerWithID:@"PhotoMapView"];
    mapViewCon.location = self.photo.location;
    [self.navigationController pushViewController:mapViewCon animated:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
