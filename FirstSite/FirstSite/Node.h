//
//  Node.h
//  FirstSite
//
//  Created by Daren taylor on 05/03/2014.
//  Copyright (c) 2014 Sparx. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Node <NSObject>

- (NSString *)name;
- (void) setName:(NSString *)name;

- (NSString *)path;
- (void) setPath:(NSString *)path;

@end
