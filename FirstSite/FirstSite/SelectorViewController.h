//
//  SelectorViewController.h
//  FirstSite
//
//  Created by Daren David Taylor on 06/03/2014.
//  Copyright (c) 2014 Sparx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectorViewControllerDelegate.h"

@interface SelectorViewController : UITableViewController

@property (nonatomic, strong) NSArray *root;
@property (nonatomic, weak) id<SelectorViewControllerDelegate> delegate;

@end
