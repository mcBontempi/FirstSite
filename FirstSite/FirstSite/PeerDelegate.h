//
//  PeerDelegate.h
//  FirstSite
//
//  Created by Daren taylor on 15/03/2014.
//  Copyright (c) 2014 Sparx. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Card;
@class Peer;

@protocol PeerDelegate <NSObject>

- (void)peer:(Peer *)peer didRecieveCard:(Card *)card;

@end
