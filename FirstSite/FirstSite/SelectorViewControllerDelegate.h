//
//  SelectorViewControllerDelegate.h
//  FirstSite
//
//  Created by Daren taylor on 07/03/2014.
//  Copyright (c) 2014 Sparx. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SelectorViewController;

@protocol SelectorViewControllerDelegate <NSObject>

- (void)selectorViewControllerDelegate:(SelectorViewController *)selectorViewController didSelectFileAtPath:(NSString *)path;

@end
