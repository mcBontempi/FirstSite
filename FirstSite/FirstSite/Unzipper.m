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
  
  [zipArchive UnzipOpenFile:zipPath];
  
  [zipArchive UnzipFileTo:docsURL.path overWrite:YES];
}

@end
