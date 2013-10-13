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
#import "PhotoGalleryViewController.h"
#import "StoryboardUtil.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, HorizontalScrollerDelegate> {
    
    UITableView *mainsDataTable;
    NSArray *allMains;
    NSDictionary *currentMainData;
    int currentMainIndex;
    HorizontalScroller *mainScroller;
    
    UITableView *drinksDataTable;
    NSArray *allDrinks;
    NSDictionary *currentDrinkData;
    int currentDrinkIndex;
    HorizontalScroller *drinksScroller;
    
    
    UITableView *dessertsDataTable;
    NSArray *allDesserts;
    NSDictionary *currentDessertData;
    int currentDessertIndex;
    HorizontalScroller *dessertsScroller;
    
    
    int totalCalories; // we add it all up on Next button pressed
}
@end

@implementation ViewController

#pragma mark - HorizontalScrollerDelegate methods
- (void)horizontalScroller:(HorizontalScroller *)scroller clickedViewAtIndex:(int)index
{
    if (scroller == mainScroller)
    {
        currentMainIndex = index;
        [self showDataForMainAtIndex:index];
    }
    else if (scroller == drinksScroller)
    {
        currentDrinkIndex = index;
        [self showDataForDrinkAtIndex:index];
    }
    else if (scroller == dessertsScroller)
    {
        currentDessertIndex = index;
        [self showDataForDessertAtIndex:index];
    }
}

// can't get this to work
- (void)horizontalScroller:(HorizontalScroller*)scroller selectedViewAtIndex:(int)index
{
    if (scroller == mainScroller)
    {
        Meal *main = allMains[index];
        totalCalories += main.calories;
    }
    else if (scroller == drinksScroller)
    {
        Meal *drink = allDrinks[index];
        totalCalories += drink.calories;
    }
    else if (scroller == dessertsScroller)
    {
        Meal *dessert = allDesserts[index];
        totalCalories += dessert.calories;
    }
    
    NSLog(@"Total calories: %i", totalCalories);
}

- (NSInteger)numberOfViewsForHorizontalScroller:(HorizontalScroller*)scroller
{
    if (scroller == mainScroller)
    {
        return allMains.count;
    }
    else if (scroller == drinksScroller)
    {
        return allDrinks.count;
    }
    else if (scroller == dessertsScroller)
    {
        return allDesserts.count;
    }
    return 0;
}

- (UIView*)horizontalScroller:(HorizontalScroller*)scroller viewAtIndex:(int)index
{
    if (scroller == mainScroller)
    {
        Meal *main = allMains[index];
        return [[MealAlbumView alloc] initWithFrame:CGRectMake(0, 0, 100, 100) mealImage:main.imagePath highlightedMealImage:main.highlightedImagePath];
    }
    else if (scroller == drinksScroller)
    {
        Meal *drink = allDrinks[index];
        return [[MealAlbumView alloc] initWithFrame:CGRectMake(0, 0, 100, 100) mealImage:drink.imagePath highlightedMealImage:drink.highlightedImagePath];
    }
    else if (scroller == dessertsScroller)
    {
        Meal *dessert = allDesserts[index];
        return [[MealAlbumView alloc] initWithFrame:CGRectMake(0, 0, 100, 100) mealImage:dessert.imagePath highlightedMealImage:dessert.highlightedImagePath];
    }
    return nil;
}

- (void)reloadMainScroller
{
    allMains = [[LibraryAPI sharedInstance] getMains];
    if (currentMainIndex < 0) currentMainIndex = 0;
    else if (currentMainIndex >= allMains.count) currentMainIndex = allMains.count-1;
    [mainScroller reload];
    
    [self showDataForMainAtIndex:currentMainIndex];
}


- (void)reloadDrinksScroller
{
    allDrinks = [[LibraryAPI sharedInstance] getDrinks];
    if (currentDrinkIndex < 0) currentDrinkIndex = 0;
    else if (currentDrinkIndex >= allDrinks.count) currentDrinkIndex = allDrinks.count-1;
    [drinksScroller reload];
    
    [self showDataForDrinkAtIndex:currentDrinkIndex];
}

- (void)reloadDessertsScroller
{
    allDesserts = [[LibraryAPI sharedInstance] getDesserts];
    if (currentDessertIndex < 0) currentDessertIndex = 0;
    else if (currentDessertIndex >= allDesserts.count) currentDessertIndex = allDesserts.count-1;
    [dessertsScroller reload];
    
    [self showDataForDessertAtIndex:currentDessertIndex];
}

- (NSInteger)initialViewIndexForHorizontalScroller:(HorizontalScroller *)scroller
{
    if (scroller == mainScroller)
    {
        return currentMainIndex;
    }
    else if (scroller == drinksScroller)
    {
        return currentDrinkIndex;
    }
    else if (scroller == dessertsScroller)
    {
        return currentDessertIndex;
    }
    return 0;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 1
    self.view.backgroundColor = [UIColor blackColor];//colorWithRed:0.76f green:0.81f blue:0.87f alpha:1];
    currentMainIndex = 0;
    currentDrinkIndex = 0;
    currentDessertIndex = 0;
    
    //2
    allMains = [[LibraryAPI sharedInstance] getMains];
    
    allDrinks = [[LibraryAPI sharedInstance] getDrinks];
    
    allDesserts = [[LibraryAPI sharedInstance] getDesserts];
    
    // 3
    // the uitableview that presents the mains data
    mainsDataTable = [[UITableView alloc] initWithFrame:CGRectMake(0, -40, self.view.frame.size.width, self.view.frame.size.height-120) style:UITableViewStyleGrouped];
    mainsDataTable.delegate = self;
    mainsDataTable.dataSource = self;
    mainsDataTable.backgroundView = nil;
    [self.view addSubview:mainsDataTable];
    
    // the uitableview that presents the drinks data
    drinksDataTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 180, self.view.frame.size.width, self.view.frame.size.height-120) style:UITableViewStyleGrouped];
    drinksDataTable.delegate = self;
    drinksDataTable.dataSource = self;
    drinksDataTable.backgroundView = nil;
    [self.view addSubview:drinksDataTable];
    
    
    // the uitableview that presents the desserts data
    dessertsDataTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 330, self.view.frame.size.width, self.view.frame.size.height-120) style:UITableViewStyleGrouped];
    dessertsDataTable.delegate = self;
    dessertsDataTable.dataSource = self;
    dessertsDataTable.backgroundView = nil;
    [self.view addSubview:dessertsDataTable];
    
    [self loadPreviousState];
    
    mainScroller = [[HorizontalScroller alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 120)];
    mainScroller.backgroundColor = [UIColor blackColor];//colorWithRed:0.24f green:0.35f blue:0.49f alpha:1];
    mainScroller.delegate = self;
    [self.view addSubview:mainScroller];
    
    [self reloadMainScroller];
    
    [self showDataForMainAtIndex:currentMainIndex];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveCurrentState) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    
    drinksScroller = [[HorizontalScroller alloc] initWithFrame:CGRectMake(0, 250, self.view.frame.size.width, 120)];
    drinksScroller.backgroundColor = [UIColor blackColor];//colorWithRed:0.24f green:0.35f blue:0.49f alpha:1];
    drinksScroller.delegate = self;
    [self.view addSubview:drinksScroller];
    
    [self reloadDrinksScroller];
    
    [self showDataForDrinkAtIndex:currentDrinkIndex];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveCurrentState) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    
    dessertsScroller = [[HorizontalScroller alloc] initWithFrame:CGRectMake(0, 400, self.view.frame.size.width, 120)];
    dessertsScroller.backgroundColor = [UIColor blackColor];//colorWithRed:0.24f green:0.35f blue:0.49f alpha:1];
    dessertsScroller.delegate = self;
    [self.view addSubview:dessertsScroller];
    
    [self reloadDessertsScroller];
    
    [self showDataForDessertAtIndex:currentDessertIndex];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveCurrentState) name:UIApplicationDidEnterBackgroundNotification object:nil];
    
    //100, 520, 100
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 520, 480, 50)];
    [button setTitle:@"Let's go explore" forState:UIControlStateNormal];

    [self.view addSubview:button];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor darkGrayColor]];
    [button addTarget:self action:@selector(nextButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
}

-(NSInteger) addUpAllCaloriesToBurn {
    
    Meal *main = allMains[currentMainIndex];
    totalCalories += main.calories;

    Meal *drink = allDrinks[currentDrinkIndex];
    totalCalories += drink.calories;

    Meal *dessert = allDesserts[currentDessertIndex];
    totalCalories += dessert.calories;

    NSLog(@"Total calories: %i", totalCalories);

    return totalCalories;
}

- (void)nextButtonPressed:(id)sender {
    // now is a good time to calculate addUpAllCaloriesToBurn;

    PhotoGalleryViewController *viewCon = (PhotoGalleryViewController*)[StoryboardUtil loadViewControllerWithID:@"PhotoGallery"];
    [self.navigationController pushViewController:viewCon animated:YES];
}

- (void)showDataForMainAtIndex:(int)mainIndex
{
    if (mainIndex < allMains.count)
    {
    	// fetch the meal data
        Meal *main = allMains[mainIndex];
        // save the meal data to present it later in the tableview
        currentMainData = [main tr_mainTableRepresentation];
    }
    else
    {
        currentMainData = nil;
    }
    
    // we have the data we need, let's refresh our tableview
    [mainsDataTable reloadData];
}

- (void)showDataForDrinkAtIndex:(int)drinkIndex
{
    // defensive code:
    if (drinkIndex < allDrinks.count)
    {
    	// fetch the drink data
        Meal *drink = allDrinks[drinkIndex];
        // save the drink data to present it later in the tableview
        currentDrinkData = [drink tr_drinkTableRepresentation];
    }
    else
    {
        currentDrinkData = nil;
    }
    
    // we have the data we need, let's refresh our tableview
    [drinksDataTable reloadData];
}

- (void)showDataForDessertAtIndex:(int)dessertIndex
{
    // defensive code:
    if (dessertIndex < allDesserts.count)
    {
    	// fetch the dessert data
        Meal *dessert = allDesserts[dessertIndex];
        // save the dessert data to present it later in the tableview
        currentDessertData = [dessert tr_dessertTableRepresentation];
    }
    else
    {
        currentDessertData = nil;
    }
    
    // we have the data we need, let's refresh our tableview
    [dessertsDataTable reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == mainsDataTable)
    {
        return [currentMainData[@"titles"] count];
    }
    else if (tableView == drinksDataTable)
    {
        return [currentDrinkData[@"titles"] count];
    }
    else if (tableView == dessertsDataTable)
    {
        return [currentDessertData[@"titles"] count];
    }
    
    return nil;
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    
    
    if (tableView == mainsDataTable)
    {
        cell.textLabel.text = currentMainData[@"titles"][indexPath.row];
        cell.detailTextLabel.text = currentMainData[@"values"][indexPath.row];
    }
    else if (tableView == drinksDataTable)
    {
        cell.textLabel.text = currentDrinkData[@"titles"][indexPath.row];
        cell.detailTextLabel.text = currentDrinkData[@"values"][indexPath.row];
    }
    else if (tableView == dessertsDataTable)
    {
        cell.textLabel.text = currentDessertData[@"titles"][indexPath.row];
        cell.detailTextLabel.text = currentDessertData[@"values"][indexPath.row];
    }
    
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
    [[NSUserDefaults standardUserDefaults] setInteger:currentMainIndex forKey:@"currentMealIndex"];
    
    [[NSUserDefaults standardUserDefaults] setInteger:currentDrinkIndex forKey:@"currentDrinkIndex"];
    
    [[NSUserDefaults standardUserDefaults] setInteger:currentDessertIndex forKey:@"currentDessertIndex"];
}

- (void)loadPreviousState
{
    currentMainIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"currentMealIndex"];
    [self showDataForMainAtIndex:currentMainIndex];
    
    currentDrinkIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"currentDrinkIndex"];
    [self showDataForDrinkAtIndex:currentMainIndex];
    
    currentDessertIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"currentDessertIndex"];
    [self showDataForDessertAtIndex:currentDessertIndex];
}

@end

