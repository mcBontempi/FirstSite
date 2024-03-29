//
//  FileScanner.m
//  FirstSite
//
//  Created by Daren taylor on 05/03/2014.
//  Copyright (c) 2014 Sparx. All rights reserved.
//

#import "FileScanner.h"
#import "FolderNode.h"
#import "FileNode.h"
#import "NSString+ContainsStringInArray.h"
#import "UIImage+Resizing.h"
#import "Paths.h"

@implementation FileScanner

- (NSArray *)scanWithPath:(NSString *)path
{
  NSError * error;
  
  NSArray * directoryContents =  [[NSFileManager defaultManager]
                                  contentsOfDirectoryAtPath:[[Paths applicationDocumentsDirectory].path stringByAppendingPathComponent:path] error:&error];
  
  NSMutableArray *array = [@[] mutableCopy];
  
  [directoryContents enumerateObjectsUsingBlock:^(NSString *innerPath, NSUInteger idx, BOOL *stop) {
    
    id<Node> node = nil;
    
    if (![innerPath containsStringInArray:@[@"__MACOSX", @".DS_Store", @"Root.zip"]]) {
      
      if (innerPath.pathExtension.length && [innerPath.pathExtension containsStringInArray:@[@"jpg", @"png"]]) {
        FileNode *fileNode = [[FileNode alloc] init];
        
        node = fileNode;
        
        node.name = [innerPath stringByDeletingPathExtension];
        
        NSLog(@"%@", innerPath);
      }
      else {
        FolderNode *folderNode = [[FolderNode alloc] init];
        folderNode.folders = [self scanWithPath:[path stringByAppendingPathComponent:innerPath]];
        
        node = folderNode;
        node.name = innerPath;
      }
      
      
      node.path = [path stringByAppendingPathComponent:innerPath];
 
      NSLog(@"%@", node.path);
      
      [array addObject:node];
    }
  }];
  
  return array;
}


@end
