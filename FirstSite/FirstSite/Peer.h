//
//  Peer.h
//  FirstSite
//
//  Created by Daren taylor on 14/03/2014.
//  Copyright (c) 2014 Sparx. All rights reserved.
//

#import <Foundation/Foundation.h>
@import MultipeerConnectivity;

@interface Peer : NSObject
{
    
}

@property (nonatomic,strong) MCPeerID *peerId;
@property (nonatomic,strong) MCSession *session;
@property (nonatomic,strong) MCAdvertiserAssistant *assistant;

@end
