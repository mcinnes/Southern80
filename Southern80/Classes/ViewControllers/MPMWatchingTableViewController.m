//
//  MPMWatchingTableViewController.m
//  Southern80
//
//  Created by Matt McInnes on 27/05/14.
//  Copyright (c) 2014 Matt McInnes. All rights reserved.
//

#import "MPMWatchingTableViewController.h"
#import "WatchingTableCell.h"
@interface MPMWatchingTableViewController ()

@end

@implementation MPMWatchingTableViewController {
    NSArray *names;
    NSArray *images;
    NSArray *descs;
    
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
    names = @[@"Thisplace, thatpalce"];
    NSLog(@"%@", names);
    images = @[@"01d.png", @"02d.png"];
    descs = @[@"dfvghjkjnhbgvfjhbjh bjhb kjhv kjhv jhvfkjhvdsjk hbfj hbg jkhbsfjh bgsjkbfkjgfhb gkjbkjdbhgkjbsgfdjkbkjdhsb jkdbh", @"fdshjkjfdkshasdknk jjhg uhouh uewfhef iouhabsfobfiuh hbjb fjdsfjbsdfjuh kljbkjv dyvjhjvvhjvj vjv jhg ksadbflabfdliusbdlkjb"];
    
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
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"WatchingTableCell";
    
    WatchingTableCell *cell = (WatchingTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"WatchingTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        cell.nameLabel.text = [names objectAtIndex:indexPath.row];

    }
 //   cell.nameLabel.font = [UIFont fontWithName:@"BrandonGrotesque-Bold" size:17.0];

    NSLog(@"potato %@", [names objectAtIndex:indexPath.row]);
    cell.descLabel.text = [descs objectAtIndex:indexPath.row];
    cell.thumbnailImageView.image = [UIImage imageNamed:[images objectAtIndex:indexPath.row]];
    
    return cell;
}

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

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
