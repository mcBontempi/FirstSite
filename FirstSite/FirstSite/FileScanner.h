//
//  FileSystemNode.h
//  FirstSite
//
//  Created by Daren taylor on 05/03/2014.
//  Copyright (c) 2014 Sparx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileScanner : NSObject

- (id)initWithURL:(NSURL *)url;
- (NSArray *)scan;

@end
