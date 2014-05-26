//
//  SidebarViewController.m
//  SidebarDemo
//
//  Created by Simon on 29/6/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "SidebarViewController.h"
#import "SWRevealViewController.h"
#import "SimpleTableCell.h"
@interface SidebarViewController ()

@end

@implementation SidebarViewController {
    NSArray *segueNames;
    NSArray *thumbnails;

    NSMutableArray *dataArray;
    NSMutableArray *imageNameArray;

}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    segueNames = @[@"home", @"times", @"results", @"tracker", @"locations", @"wishlist", @"bookmark", @"tag", @"tag", @"tag", @"instagram", @"twitter", @"facebook"];
    
    dataArray = [[NSMutableArray alloc] init];
    
    //First section data
    NSArray *firstItemsArray = [[NSArray alloc] initWithObjects:@"Southern 80", nil];
    NSDictionary *firstItemsArrayDict = [NSDictionary dictionaryWithObject:firstItemsArray forKey:@"data"];
    [dataArray addObject:firstItemsArrayDict];
    
    //Second section data
    NSArray *secondItemsArray = [[NSArray alloc] initWithObjects:@"Times", @"Results", @"Tracker", @"Locations", @"Sponsors", nil];
    NSDictionary *secondItemsArrayDict = [NSDictionary dictionaryWithObject:secondItemsArray forKey:@"data"];
    [dataArray addObject:secondItemsArrayDict];
    NSArray *thirdItemsArray = [[NSArray alloc] initWithObjects:@"Item 4", @"Item 5", @"Item 6", @"Last Item", nil];
    NSDictionary *thirdItemsArrayDict = [NSDictionary dictionaryWithObject:thirdItemsArray forKey:@"data"];
    [dataArray addObject:thirdItemsArrayDict];
    NSArray *fourthItemsArray = [[NSArray alloc] initWithObjects:@"Instagram", @"Twitter", @"Facebook", nil];
    NSDictionary *fourthItemsArrayDict = [NSDictionary dictionaryWithObject:fourthItemsArray forKey:@"data"];
    [dataArray addObject:fourthItemsArrayDict];

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [dataArray count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *dictionary = [dataArray objectAtIndex:section];
    NSArray *array = [dictionary objectForKey:@"data"];
    return [array count];
}
/*- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
  *  if(section == 0)
    {
        return nil;
    }
    else if(section == 1)
    {
        return @"The Race";
    }
    else if(section ==2)
    {
        return @"Sights";
    }
    else
    {
        return @"Social";
    }
    [[UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView class], nil] setTextColor:[UIColor greenColor]];
    [[UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView class], nil] setBackgroundColor:[UIColor blackColor]];
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,  tableView.bounds.size.width, 30)];
    
    UILabel *labelHeader = [[UILabel alloc] initWithFrame:CGRectMake (0,0,320,30)
                            labelHeader.font = [UIFont fontWithName:@"Helvetica" size:7];
                            labelHeader.textColor = [UIColor whiteColor];
                            
                            [headerView addSubview:labelHeader];
                            
                            if (section == 0)
                            [headerView setBackgroundColor:[UIColor clearColor]];
                            else if (section == 1) {
                                
                                [headerView setBackgroundColor:[UIColor colorWithRed:156.0f/255.0f green:156.0f/255.0f blue:156.0f/255.0f alpha:0.75f]];
                                labelHeader.text = @"Offers";
                            }
                            else if (section == 2) {
                                [headerView setBackgroundColor:[UIColor colorWithRed:156.0f/255.0f green:156.0f/255.0f blue:156.0f/255.0f alpha:0.75f]];
                                labelHeader.text = @"Workouts";
                                
                            }
                            
                            else {
                                
                                [headerView setBackgroundColor:[UIColor colorWithRed:156.0f/255.0f green:156.0f/255.0f blue:156.0f/255.0f alpha:0.75f]];
                                labelHeader.text = @"Weights";
                            }

}
*/
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    // create the parent view that will hold header Label
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 40.0)];
    
    UIImage *image = [UIImage imageNamed:@"Background_320x22"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    // create the button object
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    
    headerLabel.backgroundColor = [UIColor blackColor];
    headerLabel.opaque = NO;
    headerLabel.textColor = [UIColor greenColor];
    headerLabel.highlightedTextColor = [UIColor whiteColor];
    headerLabel.font = [UIFont boldSystemFontOfSize:23];
    headerLabel.frame = CGRectMake(0.0, 0.0, 320.0, 22.0);
    
    headerLabel.text = @"My Header"; // i.e. array element
    
    [customView addSubview:imageView];
    [customView addSubview:headerLabel];
    if(section == 0)
    {
        customView =nil;
    }
    else if(section == 1)
    {
        headerLabel.textColor = [UIColor redColor];

        headerLabel.text = @"The race";
    }
    else if(section ==2)
    {
        headerLabel.text = @"Sights";
    }
    else
    {
        headerLabel.textColor = [UIColor blueColor];

        headerLabel.text = @"Social";
    }
    return customView;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 22.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  /*
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary *dictionary = [dataArray objectAtIndex:indexPath.section];
    NSArray *array = [dictionary objectForKey:@"data"];
    NSString *cellValue = [array objectAtIndex:indexPath.row];
    cell.textLabel.text = cellValue;
    
    return cell;
   */
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    SimpleTableCell *cell = (SimpleTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    NSDictionary *dictionary = [dataArray objectAtIndex:indexPath.section];
    NSArray *array = [dictionary objectForKey:@"data"];
    NSString *cellValue = [array objectAtIndex:indexPath.row];
    cell.nameLabel.text = cellValue;
    cell.thumbnailImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", cellValue]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
   
    //UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSDictionary *dictionary = [dataArray objectAtIndex:indexPath.section];
    NSArray *array = [dictionary objectForKey:@"data"];
    NSString *cellValue = [array objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:cellValue sender:self];
    
}

- (void) prepareForSegue: (UIStoryboardSegue *) segue sender: (id) sender
{
    // Set the title of navigation bar by using the menu items
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    UINavigationController *destViewController = (UINavigationController*)segue.destinationViewController;
    destViewController.title = [[segueNames objectAtIndex:indexPath.row] capitalizedString];
    
    
    if ( [segue isKindOfClass: [SWRevealViewControllerSegue class]] ) {
        SWRevealViewControllerSegue *swSegue = (SWRevealViewControllerSegue*) segue;
        
        swSegue.performBlock = ^(SWRevealViewControllerSegue* rvc_segue, UIViewController* svc, UIViewController* dvc) {
            
            UINavigationController* navController = (UINavigationController*)self.revealViewController.frontViewController;
            [navController setViewControllers: @[dvc] animated: NO ];
            [self.revealViewController setFrontViewPosition: FrontViewPositionLeft animated: YES];
        };
        
    }
    
}

@end
