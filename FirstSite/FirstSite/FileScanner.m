//
//  FileScanner.m
//  FirstSite
//
//  Created by Daren taylor on 05/03/2014.
//  Copyright (c) 2014 Sparx. All rights reserved.
//

#import "FileScanner.h"
#import "FolderNode.h"

@implementation FileScanner

- (NSArray *)scanWithPath:(NSString *)path
{
    NSError * error;
    NSArray * directoryContents =  [[NSFileManager defaultManager]
                                    contentsOfDirectoryAtPath:path error:&error];
    
    NSMutableArray *array = [@[] mutableCopy];
    
    [directoryContents enumerateObjectsUsingBlock:^(NSString *innerPath, NSUInteger idx, BOOL *stop) {
        FolderNode *folderNode = [[FolderNode alloc] init];
        folderNode.name = innerPath;
        folderNode.folders = [self scanWithPath:[path stringByAppendingPathComponent:innerPath]];
        
        [array addObject:folderNode];
    }];
    
    return array;
}
@end
