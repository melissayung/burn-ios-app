//
//  PhotoGalleryViewController.m
//  burn-ios-app
//
//  Created by Anita Santoso on 13/10/13.
//  Copyright (c) 2013 burn. All rights reserved.
//

#import "PhotoGalleryViewController.h"
#import "PhotoViewController.h"
#import "StoryboardUtil.h"
#import "LoadingView.h"
#import "EyeEmNetworkService.h"

@interface PhotoGalleryViewController ()

@end

@implementation PhotoGalleryViewController

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
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [LoadingView show];
    [[EyeEmNetworkService sharedInstance]fetchPhotosHavingCoordinates:CLLocationCoordinate2DMake(0, 0) completion:^(NSArray *photos) {
        [LoadingView hide];
        
        PhotoGalleryViewController *viewCon = (PhotoGalleryViewController*)[StoryboardUtil loadViewControllerWithID:@"PhotoGallery"];
        viewCon.photos = photos;
        
    } error:^(NSString *errorMsg) {
        NSLog(0);
    }];
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    return [self.photos count];
}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImageCell *cell = [cv dequeueReusableCellWithReuseIdentifier:@"ImageCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    NSString *urlStr = ((Photo*)[self.photos objectAtIndex:indexPath.row]).photoURL;
    [cell setImageURL:[NSURL URLWithString:urlStr]];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    PhotoViewController *viewCon = (PhotoViewController*)[StoryboardUtil
                                                          loadViewControllerWithID:@"PhotoViewController"];
    viewCon.photo = [self.photos objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:viewCon animated:YES];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: Deselect item
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//}

- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(40, 10, 0, 10);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
