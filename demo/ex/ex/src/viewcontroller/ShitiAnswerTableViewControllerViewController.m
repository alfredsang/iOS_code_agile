//
//  ShitiAnswerTableViewControllerViewController.m
//  ex
//
//  Created by alfred sang on 12-8-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ShitiAnswerTableViewControllerViewController.h"

@interface ShitiAnswerTableViewControllerViewController ()

@end

@implementation ShitiAnswerTableViewControllerViewController

- (id)initView:(DM_Shiti *)shiti{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
//        _shiti = [shiti retain];
        _shiti = [[[CXDataService sharedInstance]  shiti_find_by_id:1] retain];
        
//        items = [NSMutableArray array];
//        
//        if (_shiti.a1.length>0) {
//            [items addObject:_shiti.a1];
//        }
//        
//        if (_shiti.a2.length>0) {
//            [items addObject:_shiti.a2];
//        }
//        
//        if (_shiti.a3.length>0) {
//            [items addObject:_shiti.a3];
//        }
//        if (_shiti.a4.length>0) {
//            [items addObject:_shiti.a4];
//        }
//        if (_shiti.a5.length>0) {
//            [items addObject:_shiti.a5];
//        }
    }
    return self;
}

- (int)getAnswerCount:(DM_Shiti *)shiti{
    int c = 0;
    
    if (shiti.a1.length>0||shiti.a2.length>0||shiti.a3.length>0||shiti.a4.length>0||shiti.a5.length>0) {
        c++;
    }
    return c;
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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    items = [NSMutableArray array];
    
    if (_shiti.a1.length>0) {
        [items addObject:_shiti.a1];
    }
    
    if (_shiti.a2.length>0) {
        [items addObject:_shiti.a2];
    }
    
    if (_shiti.a3.length>0) {
        [items addObject:_shiti.a3];
    }
    if (_shiti.a4.length>0) {
        [items addObject:_shiti.a4];
    }
    if (_shiti.a5.length>0) {
        [items addObject:_shiti.a5];
    }
 
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *CellIdentifier = @"BirdSightingCell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    cell.frame = CGRectMake(0, 0, 320, 40);
//    // Configure the cell...
//    
//    UIView *a = [UIView new];
//    a.frame = CGRectMake(0, 0, 320, 40);
//    [cell addSubview:a];
////    [[cell textLabel] setText:@"sss"];
//    
//    return cell;
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
//    cell.textLabel.text = [items objectAtIndex:indexPath.row];
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
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
