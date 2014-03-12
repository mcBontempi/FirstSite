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
#import "UIImageView+Haneke.h"

@implementation SelectorViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                       target:self
                                                                                       action:@selector(cancelPressed:)];
}

#pragma mark - Actions

- (IBAction)cancelPressed:(id)sender
{
    [self.delegate selectorViewControllerDelegateDidCancel:self];
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
    
    FileNode *fileNode = (FileNode *)node;
    
    cell.imageView.image = [UIImage imageNamed:@"Placeholder.png"];
    [cell.imageView sizeToFit];
    
    [cell.imageView hnk_setImageFromFile:fileNode.path];
    
    
  }
  
  cell.textLabel.text= node.name;
  
  return cell;
}

#pragma mark - Table view delegate

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
    [self.delegate selectorViewControllerDelegate:self didSelectFileAtPath:node.path];
  }
}

@end
