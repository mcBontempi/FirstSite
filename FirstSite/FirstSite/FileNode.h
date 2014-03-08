//
//  FileNode.h
//  FirstSite
//
//  Created by Daren taylor on 05/03/2014.
//  Copyright (c) 2014 Sparx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@interface FileNode : NSObject <Node>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *path;

@property (nonatomic, strong) UIImage *thumbnail;

@end
