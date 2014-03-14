//
//  PeerHelper.m
//  FirstSite
//
//  Created by Daren taylor on 14/03/2014.
//  Copyright (c) 2014 Sparx. All rights reserved.
//

#import "PeerHelper.h"

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

-(void) sendData
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:[Card cardFromArchive]];
    
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
    [self initialize];
    [self start];
}

-(void) initialize
{
    Card *card = [Card cardFromArchive];
    NSString *peerName = [[UIDevice currentDevice] name];
    
    if(card)
    {
        peerName = card.name.length > 0 ? card.name : peerName;
    }
    
    self.peer = [[Peer alloc] init];
    self.peer.peerId = [[MCPeerID alloc] initWithDisplayName:peerName];
    self.peer.session = [[MCSession alloc]  initWithPeer:self.peer.peerId];
    self.peer.session.delegate = self.peer;
    self.peer.assistant = [[MCAdvertiserAssistant alloc] initWithServiceType:kServiceType discoveryInfo:nil session:self.peer.session];
}

@end
