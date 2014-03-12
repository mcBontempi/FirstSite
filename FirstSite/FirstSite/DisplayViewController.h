//
//  ViewController.h
//  FirstSite
//
//  Created by Daren taylor on 05/03/2014.
//  Copyright (c) 2014 Sparx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"
#import "SelectorViewControllerDelegate.h"

@interface DisplayViewController : UIViewController <SelectorViewControllerDelegate>

@property (nonatomic, strong) Model *model;


@end
