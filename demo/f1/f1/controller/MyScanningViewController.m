//
//  MyCollectionViewController.m
//  CaiXin
//
//  Created by iPhuan on 11-11-21.
//  Copyright (c) 2011年 iTotemStudio. All rights reserved.
//

#import "MyScanningViewController.h"
#import "ScanningCell.h"
//#import "WebViewController.h"
//#import "PushArticleViewController.h"

@implementation MyScanningViewController

@synthesize saveIndexPath;
@synthesize scanningArray;
@synthesize editButton;
@synthesize noScanningLabel;
@synthesize collectionTableView;

 
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
//    aaa = [DB_SERVICE scanning_find_all];
    NSArray *scanningList = [DB_SERVICE scanning_find_all];//(NSArray *)[[DataCacheManager sharedManager] getCachedObjectByKey:KEY_SCANNING_LIST];

    
    scanningArray = [[NSMutableArray alloc] initWithArray:scanningList];
//    
//    for (DM_Scanning *db in scanningList) {
//        NSLog(@"db.scanUrl=%@",db.scanUrl);
//        Scanning *s = [Scanning new];
//        s.scanUrl = [NSURL  URLWithString:db.scanUrl];
//        
//        NSDateFormatter *df = [[NSDateFormatter alloc] init];
//        [df setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
//        NSDate *myDate = [df dateFromString: db.scanDate];
//        s.scanDate = myDate;
//        s.scanTitle = db.scanTitle;
//        [scanningArray addObject:s];
//        [s release];
//    }
//    
//    
////    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"scanDate" ascending:NO];
////    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
////    [scanningArray sortUsingDescriptors:sortDescriptors];
////    [sortDescriptor release];
    
}

- (void)viewDidUnload
{
    self.editButton = nil;
    self.noScanningLabel = nil;
    self.collectionTableView = nil;
    [super viewDidUnload];
}


#pragma mark TableView methods

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    
    if ([scanningArray count] == 0)
    {
        self.noScanningLabel.hidden = NO;
        self.editButton.hidden = YES;
    }
    else
    {
        self.noScanningLabel.hidden = YES;
        self.editButton.hidden = NO;
    }
    return [scanningArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    static NSString *CellIdentifier = @"ScanningCell";
    ScanningCell *cell = (ScanningCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) 
    {
        cell = (ScanningCell *)[[[NSBundle mainBundle] loadNibNamed:@"ScanningCell" owner:self options:nil] objectAtIndex:0];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    DM_Scanning *aScanning = [scanningArray objectAtIndex:indexPath.row];
    [cell setScanningListForCell:aScanning ];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    DM_Scanning *aScanning = [scanningArray objectAtIndex:indexPath.row];
    
    NSLog(@"%@",@"我的扫描");
//    WebViewController *webViewController = [[WebViewController alloc] initWithUrl:[NSURL URLWithString:aScanning.scanUrl]];
//    webViewController.backBtnTitle = @"我的扫描";
//    [self presentModalViewController:webViewController animated:YES];
//    [webViewController release];
}

#pragma mark Table view edit methods
- (void)tableView:(UITableView*)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.editButton setTitle:@"完成" forState:UIControlStateNormal];
    
}
- (void)tableView:(UITableView*)tableView didEndEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.editButton setTitle:@"编辑" forState:UIControlStateNormal];
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath 
{
	return YES;
}

- (void)tableView:(UITableView *)tableView 
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
forRowAtIndexPath:(NSIndexPath *)indexPath 
{    
    if (editingStyle == UITableViewCellEditingStyleDelete) 
    {
        UIAlertView *deleteNewsAlert = [[UIAlertView alloc]initWithTitle:@"删除扫描的新闻"
                                                                 message:@"您确认要删除该条扫描？" 
                                                                delegate:self
                                                       cancelButtonTitle:@"确认"
                                                       otherButtonTitles:@"取消",nil];
        [deleteNewsAlert show];
        [deleteNewsAlert release];
        
        self.saveIndexPath = indexPath;
    }    
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex 
{
    if (buttonIndex == 0)
    {
        DM_Scanning *aScanning = [scanningArray objectAtIndex:saveIndexPath.row];
        
        
        //[[DataCacheManager sharedManager] addObject:scanningArray forKey:KEY_SCANNING_LIST];
        //TODO:delete from tb_scanning
        [DB_SERVICE scanning_del_by_scanTitle:aScanning.scanUrl];
        [scanningArray removeObjectAtIndex:saveIndexPath.row];
        [collectionTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:saveIndexPath] 
                                   withRowAnimation:YES];
        [self.editButton setTitle:@"编辑" forState:UIControlStateNormal];
    }
}


- (IBAction)back:(id)sender
{

    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)backToRootView:(id)sender
{
 

}

- (IBAction)edit:(id)sender;
{
    if ([[self.editButton titleForState:UIControlStateNormal] isEqualToString:@"完成"])
    {
        [collectionTableView setEditing:NO animated:YES];
        [self.editButton setTitle:@"编辑" forState:UIControlStateNormal];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ScanningNewsExitEditMode" 
                                                            object:nil];
        
//        self.editButton.selected = NO;
    }
    else
    {
        [collectionTableView setEditing:YES animated:YES];
        [self.editButton setTitle:@"完成" forState:UIControlStateNormal];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"ScanningNewsEnterEditMode" 
                                                            object:nil];
//        self.editButton.selected = YES;
    }
}

- (void)dealloc 
{
//    release(saveIndexPath);
//    release(scanningArray);
//    [editButton release];
//    [noScanningLabel release];
//    [collectionTableView release];
    [super dealloc];
}


@end
