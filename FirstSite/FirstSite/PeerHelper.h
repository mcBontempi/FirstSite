//
//  PeerHelper.h
//  FirstSite
//
//  Created by Daren taylor on 14/03/2014.
//  Copyright (c) 2014 Sparx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Peer.h"
#import "Card.h"
#import "AppDelegate.h"


@interface PeerHelper : NSObject
{
    
}

@property (nonatomic,strong) Peer *peer;

-(void) restart;
-(void) start;
-(void) stop;
-(void) sendData:(Card *)card;

+(PeerHelper *) sharedHelper;

@end
