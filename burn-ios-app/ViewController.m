//
//  ViewController.m
//  burn-ios-app
//
//  Created by Anita Santoso on 12/10/13.
//  Copyright (c) 2013 burn. All rights reserved.
//

#import "ViewController.h"
#import "HorizontalScroller.h"
#import "MealAlbumView.h"
#import "LibraryAPI.h"
#import "Meal+TableRepresentation.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, HorizontalScrollerDelegate> {
    
    UITableView *dataTable;
    NSArray *allMeals;
    NSDictionary *currentMealData;
    int currentMealIndex;
    HorizontalScroller *scroller;
}
@end

@implementation ViewController

#pragma mark - HorizontalScrollerDelegate methods
- (void)horizontalScroller:(HorizontalScroller *)scroller clickedViewAtIndex:(int)index
{
    currentMealIndex = index;
    [self showDataForMealAtIndex:index];
}

- (NSInteger)numberOfViewsForHorizontalScroller:(HorizontalScroller*)scroller
{
    return allMeals.count;
}

- (UIView*)horizontalScroller:(HorizontalScroller*)scroller viewAtIndex:(int)index
{
    Meal *meal = allMeals[index];
    return [[MealAlbumView alloc] initWithFrame:CGRectMake(0, 0, 100, 100) mealImage:meal.imagePath];
}

- (void)reloadScroller
{
    allMeals = [[LibraryAPI sharedInstance] getMeals];
    if (currentMealIndex < 0) currentMealIndex = 0;
    else if (currentMealIndex >= allMeals.count) currentMealIndex = allMeals.count-1;
    [scroller reload];
    
    [self showDataForMealAtIndex:currentMealIndex];
}

- (NSInteger)initialViewIndexForHorizontalScroller:(HorizontalScroller *)scroller
{
    return currentMealIndex;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 1
    self.view.backgroundColor = [UIColor colorWithRed:0.76f green:0.81f blue:0.87f alpha:1];
    currentMealIndex = 0;
    
    //2
    allMeals = [[LibraryAPI sharedInstance] getMeals];
    
    // 3
    // the uitableview that presents the album data
    dataTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 120, self.view.frame.size.width, self.view.frame.size.height-120) style:UITableViewStyleGrouped];
    dataTable.delegate = self;
    dataTable.dataSource = self;
    dataTable.backgroundView = nil;
    [self.view addSubview:dataTable];
    
    [self loadPreviousState];
    
    scroller = [[HorizontalScroller alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 120)];
    scroller.backgroundColor = [UIColor colorWithRed:0.24f green:0.35f blue:0.49f alpha:1];
    scroller.delegate = self;
    [self.view addSubview:scroller];
    
    [self reloadScroller];
    
    [self showDataForMealAtIndex:currentMealIndex];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveCurrentState) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
}

- (void)showDataForMealAtIndex:(int)mealIndex
{
    // defensive code: make sure the requested index is lower than the amount of albums
    if (mealIndex < allMeals.count)
    {
    	// fetch the meal data
        Meal *meal = allMeals[mealIndex];
        // save the meal data to present it later in the tableview
        currentMealData = [meal tr_tableRepresentation];
    }
    else
    {
        currentMealData = nil;
    }
    
    // we have the data we need, let's refresh our tableview
    [dataTable reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [currentMealData[@"titles"] count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = currentMealData[@"titles"][indexPath.row];
    cell.detailTextLabel.text = currentMealData[@"values"][indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)saveCurrentState
{
    // When the user leaves the app and then comes back again, he wants it to be in the exact same state
    // he left it. In order to do this we need to save the currently displayed album.
    // Since it's only one piece of information we can use NSUserDefaults.
    [[NSUserDefaults standardUserDefaults] setInteger:currentMealIndex forKey:@"currentMealIndex"];
}

- (void)loadPreviousState
{
    currentMealIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"currentMealIndex"];
    [self showDataForMealAtIndex:currentMealIndex];
}

@end

