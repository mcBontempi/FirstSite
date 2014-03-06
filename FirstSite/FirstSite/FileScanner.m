//
//  FileScanner.m
//  FirstSite
//
//  Created by Daren taylor on 05/03/2014.
//  Copyright (c) 2014 Sparx. All rights reserved.
//

#import "FileScanner.h"

@implementation FileScanner

- (NSArray *)scanWithPath:(NSString *)path
{
  NSError * error;
  NSArray * directoryContents =  [[NSFileManager defaultManager]
                                  contentsOfDirectoryAtPath:path error:&error];
  
 
  if (directoryContents)
  
  
  return directoryContents;
}
@end
