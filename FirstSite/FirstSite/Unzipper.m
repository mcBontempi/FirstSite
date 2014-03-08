//
//  Unzipper.m
//  FirstSite
//
//  Created by Daren taylor on 05/03/2014.
//  Copyright (c) 2014 Sparx. All rights reserved.
//

#import "Unzipper.h"
#import <ZipArchive/ZipArchive.h>
#import "Paths.h"

@implementation Unzipper

- (void)unzip
{
  ZipArchive *zipArchive = [[ZipArchive alloc] init];
  
  NSURL *docsURL = [Paths applicationDocumentsDirectory];
  
  NSString *zipPath = [docsURL.path stringByAppendingPathComponent:@"Root.zip"];
  
  BOOL success = [zipArchive UnzipOpenFile:zipPath];
  
  if(success) {
    [self removeAllFilesAndFolders];
    [zipArchive UnzipFileTo:docsURL.path overWrite:YES];
  }
  
}


- (void)removeAllFilesAndFolders
{
  NSFileManager *fileMgr = [[NSFileManager alloc] init];
  NSError *error = nil;
  NSArray *directoryContents = [fileMgr contentsOfDirectoryAtPath:[[Paths applicationDocumentsDirectory] path] error:&error];
  if (error == nil) {
    for (NSString *path in directoryContents) {
      NSString *fullPath = [[[Paths applicationDocumentsDirectory] path] stringByAppendingPathComponent:path];
      [fileMgr removeItemAtPath:fullPath error:&error];
    }
  }
}

@end
