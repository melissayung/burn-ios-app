////
////  ViewController.m
////  burn-ios-app
////
////  Created by Anita Santoso on 12/10/13.
////  Copyright (c) 2013 burn. All rights reserved.
////
//
//#import "ViewController.h"
//#import "EyeEmNetworkService.h"
//#import "PhotoGalleryViewController.h"
//#import "StoryboardUtil.h"
//#import "LoadingView.h"
//
//@interface ViewController ()
//
//@end
//
//@implementation ViewController
//
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//	// Do any additional setup after loading the view, typically from a nib.
//}
//
//- (IBAction)fetchPhotosButtonPressed:(id)sender {
//    [[EyeEmNetworkService sharedInstance]authenticate];
//}
//
//- (void)fetchPhotos {
//    
//    // TODO Loading
//    [LoadingView show];
//    [[EyeEmNetworkService sharedInstance]fetchPhotosHavingCoordinates:CLLocationCoordinate2DMake(0, 0) completion:^(NSArray *photos) {
//        [LoadingView hide];
//        
//        PhotoGalleryViewController *viewCon = (PhotoGalleryViewController*)[StoryboardUtil loadViewControllerWithID:@"PhotoGallery"];
//        viewCon.photos = photos;
//        [self.navigationController pushViewController:viewCon animated:YES];
//    } error:^(NSString *errorMsg) {
//        NSLog(0);
//    }];
//}
//
//- (void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//@end
