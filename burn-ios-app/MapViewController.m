//
//  MapViewController.m
//  burn-ios-app
//
//  Created by Anita Santoso on 13/10/13.
//  Copyright (c) 2013 burn. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>

@interface MapViewController ()
@property (strong, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapViewController

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
    self.title = @"Map";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Photo" style:UIBarButtonItemStyleBordered target:self action:@selector(showPhotoView)];
    
    MKCoordinateRegion region;
    region.center.latitude = self.location.latitude;
    region.center.longitude = self.location.longitude;
    region.span.latitudeDelta = 0.1;
    region.span.longitudeDelta = 0.1;
    [self.mapView setRegion:region animated:YES];
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:self.location];
    [annotation setTitle:@"Destination"];
    [self.mapView addAnnotation:annotation];
}

- (void)showPhotoView {
    [self.navigationController popViewControllerAnimated:NO];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
