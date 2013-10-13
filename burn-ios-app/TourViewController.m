//
//  TourViewController.m
//  burn-ios-app
//
//  Created by Anita Santoso on 13/10/13.
//  Copyright (c) 2013 burn. All rights reserved.
//

#import "TourViewController.h"
#import "EyeEmNetworkService.h"

@interface TourViewController ()


@end


NSMutableArray* pics;
int counter;

@implementation TourViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)loginButtonPressed:(id)sender {
    [[EyeEmNetworkService sharedInstance]authenticate];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    counter = 0;
    
    pics = [[NSMutableArray alloc] init];
    [pics addObject:[UIImage imageNamed:@"photo_1.jpeg"]];
    [pics addObject:[UIImage imageNamed:@"photo_2.jpeg"]];
    [pics addObject:[UIImage imageNamed:@"photo_3.jpeg"]];
    [pics addObject:[UIImage imageNamed:@"photo_4.jpeg"]];

	// Do any additional setup after loading the view.
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(swapImage) userInfo:nil repeats:NO];
}

- (void) swapImage
{
    counter++;
    int index = counter % 4;
    UIImage *pic = pics[index];
    
    [UIView transitionWithView:self.view duration:2 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.loginImaveView.image = pic;
    } completion:^(BOOL finished) {
        
    }];
    
	// Do any additional setup after loading the view.
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(swapImage) userInfo:nil repeats:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
