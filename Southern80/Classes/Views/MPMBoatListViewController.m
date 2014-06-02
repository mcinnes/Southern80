//
//  MPMBoatListViewController.m
//  Southern80
//
//  Created by Matt McInnes on 1/06/14.
//  Copyright (c) 2014 Matt McInnes. All rights reserved.
//

#import "MPMBoatListViewController.h"
#import "MPMBoatCell.h"
#import "SWRevealViewController.h"
@interface MPMBoatListViewController ()

@end

@implementation MPMBoatListViewController {
    NSArray *names;
    NSArray *classes;
    NSArray *images;
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
    UIBarButtonItem *sidebarButton = [UIBarButtonItem alloc];
    self.navigationItem.leftBarButtonItem = sidebarButton;
    sidebarButton.title = @"Menu";
    sidebarButton.tintColor = [UIColor colorWithWhite:0.1f alpha:0.9f];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    sidebarButton.target = self.revealViewController;
    sidebarButton.action = @selector(revealToggle:);
    
    names = @[@"Nipple", @"99 Psycho Clowns", @"Stinga"];
    classes = @[@"Superclass", @"Unilimted", @"6.0 Liter"];
    images = @[@"nipple 2001.JPG", @"Psycho-1.jpg", @"stinga-1.jpg"];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return names.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"MPMBoatCell";
    
    MPMBoatCell *cell = (MPMBoatCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"BoatTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        cell.nameLable.font = [UIFont fontWithName:@"PillGothic300mg-Semibd" size:50.0];
        cell.nameLable.textColor = [UIColor whiteColor];
        cell.classLabel.font = [UIFont fontWithName:@"BrandonGrotesque-Regular" size:30.0];
        cell.classLabel.textColor = [UIColor colorWithRed:0.501 green:0.487 blue:0.493 alpha:1.000];
    }
    //
    
    cell.nameLable.text = [names objectAtIndex:indexPath.row];
    cell.classLabel.text = [classes objectAtIndex:indexPath.row];
    cell.backgroundImage.image = [UIImage imageNamed:[images objectAtIndex:indexPath.row]];
    
    return cell;}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   
}



@end
