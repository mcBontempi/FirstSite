//
//  FolderNode.h
//  FirstSite
//
//  Created by Daren taylor on 05/03/2014.
//  Copyright (c) 2014 Sparx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface FolderNode : NSObject <Node>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *folders;

@end
