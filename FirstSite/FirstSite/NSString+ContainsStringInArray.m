//
//  NSString+ContainsStringInArray.m
//  FirstSite
//
//  Created by Daren taylor on 07/03/2014.
//  Copyright (c) 2014 Sparx. All rights reserved.
//

#import "NSString+ContainsStringInArray.h"

@implementation NSString (ContainsStringInArray)

- (BOOL)containsStringInArray:(NSArray *)array
{
  __block BOOL found = NO;
  
  [array enumerateObjectsUsingBlock:^(NSString *iteratedString, NSUInteger idx, BOOL *stop) {
    
    if ([iteratedString caseInsensitiveCompare:self] == NSOrderedSame) {
      found =YES;
      *stop = YES;
    }
    
  }];
  
  return found;
}

@end
