//
//  Card.h
//  FirstSite
//
//  Created by Daren taylor on 14/03/2014.
//  Copyright (c) 2014 Sparx. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Card : NSObject
{
    
}

@property (nonatomic,copy) NSString *name; 
@property (nonatomic,copy) NSString *firstName;
@property (nonatomic,copy) NSString *lastName;


+(Card *) cardFromArchive;

-(void) archive;

@end
