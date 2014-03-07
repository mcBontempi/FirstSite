//
//  DisplayViewController.m
//  FirstSite
//
//  Created by Daren taylor on 05/03/2014.
//  Copyright (c) 2014 Sparx. All rights reserved.
//

#import "DisplayViewController.h"
#import "SelectorViewController.h"

@implementation DisplayViewController {
    UIPopoverController *_popOver;
  __weak IBOutlet UIImageView *_imageView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.userInteractionEnabled = YES;
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewWasTapped:)]];
    
    self.view.layer.cornerRadius = 20;
    
}

- (IBAction)viewWasTapped:(id)sender
{
    UITapGestureRecognizer *tapRecognizer = (UITapGestureRecognizer *)sender;
    CGPoint tapPoint = [tapRecognizer locationInView:self.view];
    
    UINavigationController *nc = [[UIStoryboard storyboardWithName:@"Selector" bundle:nil] instantiateInitialViewController];
    SelectorViewController *vc = nc.viewControllers[0];
  vc.title = @"Music Documents";
  vc.delegate = self;
    
    vc.root = self.model.root;
    
    _popOver =[[UIPopoverController alloc] initWithContentViewController:nc];
    [_popOver presentPopoverFromRect:CGRectMake(tapPoint.x, tapPoint.y, 0,0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}


- (void)selectorViewControllerDelegate:(SelectorViewController *)selectorViewController didSelectFileAtPath:(NSString *)path
{
  
  
  
  _imageView.image = [UIImage imageWithContentsOfFile:path];
  
  [_popOver dismissPopoverAnimated:YES];
}


@end
