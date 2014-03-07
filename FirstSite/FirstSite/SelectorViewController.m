//
//  SelectorViewController.m
//  FirstSite
//
//  Created by Daren David Taylor on 06/03/2014.
//  Copyright (c) 2014 Sparx. All rights reserved.
//

#import "SelectorViewController.h"
#import "Node.h"
#import "FolderNode.h"
#import "FileNode.h"

@interface SelectorViewController ()

@end

@implementation SelectorViewController

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
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return self.root.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  id<Node> node = self.root[indexPath.row];
  
  UITableViewCell *cell = nil;
  
  if ([node isKindOfClass:[FolderNode class]]) {
    cell = [tableView dequeueReusableCellWithIdentifier:@"FolderCell" forIndexPath:indexPath];
  }
  else if ([node isKindOfClass:[FileNode class]]) {
    cell = [tableView dequeueReusableCellWithIdentifier:@"FileCell" forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageWithContentsOfFile:node.path];
    
  }
  
  cell.textLabel.text= node.name;
  
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


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  
  id<Node> node = self.root[indexPath.row];
  
  if ([node isKindOfClass:[FolderNode class]]) {
    FolderNode *folderNode = node;
    
    UINavigationController *nc = [[UIStoryboard storyboardWithName:@"Selector" bundle:nil] instantiateInitialViewController];
    SelectorViewController *vc = nc.viewControllers[0];
    vc.delegate = self.delegate;
    vc.title = folderNode.name;
    
    
    vc.root = folderNode.folders;
    
    [self.navigationController pushViewController:vc animated:YES];
  }
  else if ([node isKindOfClass:[FileNode class]]) {
    FileNode *fileName = node;
    
    [self.delegate selectorViewControllerDelegate:self didSelectFileAtPath:node.path];
  }
  
  
  
}



@end
