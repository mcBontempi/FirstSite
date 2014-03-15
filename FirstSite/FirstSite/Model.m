//
//  Model.m
//  FirstSite
//
//  Created by Daren David Taylor on 07/03/2014.
//  Copyright (c) 2014 Sparx. All rights reserved.
//

#import "Model.h"
#import "FileScanner.h"
#import "Paths.h"
#import "Unzipper.h"

@implementation Model

- (NSArray *)root
{
    if (!_root) {
        Unzipper *unzipper = [[Unzipper alloc] init];
        [unzipper unzip];
        
        FileScanner *scanner = [[FileScanner alloc] init];
        _root = [scanner scanWithPath:@""];
   }
    
    return _root;
}

@end
