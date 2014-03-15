//
//  PeerHelper.m
//  FirstSite
//
//  Created by Daren taylor on 14/03/2014.
//  Copyright (c) 2014 Sparx. All rights reserved.
//

#import "PeerHelper.h"
#import "CommsConstants.h"

@interface PeerHelper()

@end

@implementation PeerHelper

+(PeerHelper *) sharedHelper
{
    static PeerHelper *sharedInstance = nil;
    static dispatch_once_t once;
    
    dispatch_once(&once,^{
    
        sharedInstance = [[self alloc] init];
        
    });
    
    return sharedInstance;
}

-(void) sendData:(Card *)card
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:card];
    
    NSError *error;
    
    [self.peer.session sendData:data toPeers:self.peer.session.connectedPeers withMode:MCSessionSendDataReliable error:&error];
}

-(void) start
{
    [self.peer.assistant start];
}

-(void) stop
{
    [self.peer.assistant stop];
}

-(void) restart
{
    [self stop];
   // [self initialize];
    [self start];
}

@end
