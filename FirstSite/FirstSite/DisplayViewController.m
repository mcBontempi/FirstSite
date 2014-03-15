//
//  DisplayViewController.m
//  FirstSite
//
//  Created by Daren taylor on 05/03/2014.
//  Copyright (c) 2014 Sparx. All rights reserved.
//

#import "DisplayViewController.h"
#import "SelectorViewController.h"
#import "PeerHelper.h"
#import "CommsConstants.h"
#import "Paths.h"

@interface DisplayViewController () <MCBrowserViewControllerDelegate, PeerDelegate>

@property(nonatomic, strong) PeerHelper *peerHelper;
@property(nonatomic, strong) Peer *clientPeer;
@property(nonatomic, strong) Peer *serverPeer;

@end

@implementation DisplayViewController {
  UIPopoverController *_popOver;
  __weak IBOutlet UIImageView *_imageView;

  __weak IBOutlet UIButton *_imAStudentButton;
  __weak IBOutlet UIButton *_imATeacherButton;
}

#pragma mark - Getters and Setters

- (Peer *)clientPeer
{
  if (!_clientPeer) {
    
    NSString *peerName = [[UIDevice currentDevice] name];
    MCPeerID *peerID = [[MCPeerID alloc] initWithDisplayName:peerName];
    
    _clientPeer = [[Peer alloc] init];
    _clientPeer.delegate = self;
    _clientPeer.peerId = peerID;
    _clientPeer.session = [[MCSession alloc]  initWithPeer:peerID];
    _clientPeer.session.delegate = _clientPeer;
    _clientPeer.assistant = [[MCAdvertiserAssistant alloc] initWithServiceType:kServiceType discoveryInfo:nil session:_clientPeer.session];

  }
  
  return _clientPeer;
}



- (Peer *)serverPeer
{
  if (!_serverPeer) {
    
    MCPeerID *peerID = [[MCPeerID alloc] initWithDisplayName:@"Server"];
    
    _serverPeer = [[Peer alloc] init];
    _serverPeer.delegate = self;
    _serverPeer.peerId = peerID;
    _serverPeer.session = [[MCSession alloc]  initWithPeer:peerID];
    _serverPeer.session.delegate = _serverPeer;
  }
  
  return _serverPeer;
}


- (PeerHelper *)peerHelper
{
  if (!_peerHelper) {
    _peerHelper = [PeerHelper sharedHelper];
  }
  
  return _peerHelper;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.view.userInteractionEnabled = YES;
  [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewWasTapped:)]];
}

#pragma mark - Actions

- (IBAction)viewWasTapped:(id)sender
{
  UITapGestureRecognizer *tapRecognizer = (UITapGestureRecognizer *)sender;
  CGPoint tapPoint = [tapRecognizer locationInView:self.view];
  
  UINavigationController *nc = [[UIStoryboard storyboardWithName:@"Selector" bundle:nil] instantiateInitialViewController];
  SelectorViewController *vc = nc.viewControllers[0];
  vc.title = @"Music Documents";
  vc.delegate = self;
  
  vc.root = self.model.root;
  
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    [self presentViewController:nc animated:YES completion:nil];
  }
  else {
    
    _popOver =[[UIPopoverController alloc] initWithContentViewController:nc];
    [_popOver presentPopoverFromRect:CGRectMake(tapPoint.x, tapPoint.y, 0,0) inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
  }
}
- (IBAction)imATeacherTapped:(id)sender
{
  self.peerHelper.peer = self.serverPeer;
  
  
  // open up the browsing services
  MCBrowserViewController *browserViewController = [[MCBrowserViewController alloc] initWithServiceType:kServiceType session:self.serverPeer.session];
  browserViewController.delegate = self;
  
  [self presentViewController:browserViewController animated:YES completion:nil];

  _imAStudentButton.hidden = YES;

}

- (IBAction)imAStudentTapped:(id)sender
{
  self.peerHelper.peer = self.clientPeer;

  [self.peerHelper start];

  _imAStudentButton.hidden = YES;
  _imATeacherButton.hidden = YES;
  
}

#pragma mark - SelectorViewControllerDelegate methods

- (void)selectorViewControllerDelegate:(SelectorViewController *)selectorViewController didSelectFileAtPath:(NSString *)path
{
  
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
    [_popOver dismissPopoverAnimated:YES];
    _imageView.image = [UIImage imageWithContentsOfFile:[[Paths applicationDocumentsDirectory].path stringByAppendingPathComponent:path]];
 
    
  }
  else {
    [self dismissViewControllerAnimated:YES completion:^{
      _imageView.image = [UIImage imageWithContentsOfFile:[[Paths applicationDocumentsDirectory].path stringByAppendingPathComponent:path]];
      
      
      
      ;}     ];
  }
  Card *card = [[Card alloc] init];
  
  card.name = path;
  
  [self.peerHelper sendData:card];
  

}


- (void)selectorViewControllerDelegateDidCancel:(SelectorViewController *)selectorViewController
{
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    [self dismissViewControllerAnimated:YES completion:nil];
  }
  
}



- (void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController
{
  [browserViewController dismissViewControllerAnimated:YES completion:nil];
}

-(void) browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController
{
  [browserViewController dismissViewControllerAnimated:YES completion:^{
    
  }];
}

#pragma mark - Peer Delegate

- (void)peer:(Peer *)peer didRecieveCard:(Card *)card
{
    _imageView.image = [UIImage imageWithContentsOfFile:[[Paths applicationDocumentsDirectory].path stringByAppendingPathComponent:card.name]];
}

@end
