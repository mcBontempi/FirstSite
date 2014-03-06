//
//  DisplayViewController.m
//  FirstSite
//
//  Created by Daren taylor on 05/03/2014.
//  Copyright (c) 2014 Sparx. All rights reserved.
//

#import "DisplayViewController.h"
#import "SelectorViewController.h"

@interface DisplayViewController ()

@end

@implementation DisplayViewController {
    UIPopoverController *_popOver;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonWasTapped:(id)sender {

    SelectorViewController *vc =[[SelectorViewController alloc] initWithNibName:@"SelectorViewController" bundle:nil];
    _popOver =[[UIPopoverController alloc] initWithContentViewController:vc];
    //  [_popOver presentPopoverFromRect:sender.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];

}

- (IBAction)viewWasTapped:(id)sender
{
    SelectorViewController *vc =[[SelectorViewController alloc] initWithNibName:@"SelectorViewController" bundle:nil];
    _popOver =[[UIPopoverController alloc] initWithContentViewController:vc];
  //  [_popOver presentPopoverFromRect:sender.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
}

@end
