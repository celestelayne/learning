//
//  LabyrinthViewController.m
//  Labyrinth
//
//  Created by hugo on 9/3/12.
//  Copyright (c) 2012 ChiefSquanto. All rights reserved.
//

#import "LabyrinthViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <CoreMotion/CoreMotion.h>
#import <GameKit/GameKit.h>

@interface LabyrinthViewController () <GKSessionDelegate, GKPeerPickerControllerDelegate>

@property (strong) GKSession *session;
@property (strong) GKPeerPickerController *peerPickerController;

@property (strong) CMMotionManager *motionManager;
@property (strong) CMDeviceMotion *deviceMotion;
@property (strong) CMAttitude *deviceAttitude;


@end

@implementation LabyrinthViewController

@synthesize ball;

-(void)loadView
{
    self.view = [LabyrinthView new];
}

- (id)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    // Gamekit Session Initialization
    self.session = [[GKSession alloc] initWithSessionID:@"RobertMcBaller" displayName:@"McBaller" sessionMode:GKSessionModePeer];
    [self.session setDataReceiveHandler:self withContext:nil];
    self.session.delegate = self;
    self.session.available = YES;
    
    
    // Motion Things
    // initialize CoreMotion object
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.deviceMotionUpdateInterval = 0.1;
    [self.motionManager startDeviceMotionUpdates];
    [self.motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion *motion, NSError *error) {
        [self updateOrientationWithDeviceMotion:motion];
    }];
    
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

// Mandatory delegate methods for session delegate
-(void)session:(GKSession *)session didReceiveConnectionRequestFromPeer:(NSString *)peerID
{
    [self.session acceptConnectionFromPeer:peerID error:nil];
    self.session.available = NO; // This booth is now taken.
    NSLog(@"Successfully connected to: %@", peerID);
}

-(void)session:(GKSession *)session peer:(NSString *)peerID didChangeState:(GKPeerConnectionState)state
{
    if (state == GKPeerStateAvailable) {
        NSLog(@"Peer Did change state: %@", peerID);
        [session connectToPeer:peerID withTimeout:2.0];
    } else if (state == GKPeerStateConnected) {
        NSLog(@"Peer Already Connected: %@", peerID);
        session.available = NO;
    }
}

-(void)updateOrientationWithDeviceMotion:(CMDeviceMotion *)deviceMotion
{
    [(LabyrinthView *)self.view updateBallPositionWithDeviceMotion:deviceMotion];
    [self sendAllData];
}



-(void)sendAllData
{
    LabyrinthView *labView = (LabyrinthView *)self.view;
    // CGPoint -> String -> Data
    NSData *payload = [NSStringFromCGPoint(labView.ball.position) dataUsingEncoding:NSUTF8StringEncoding];
    [self.session sendDataToAllPeers:payload withDataMode:GKSendDataReliable error:nil];
}

- (void) receiveData:(NSData *)data fromPeer:(NSString *)peer inSession: (GKSession *)session context:(void *)context
{
    // Read the bytes in data and perform an application-specific action.
    CGPoint receivePoint = CGPointFromString([[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
    
    if (!ball) {
        ball = [CALayer layer];
        ball.bounds = CGRectMake(0, 0, 30, 30);
        ball.backgroundColor = [[UIColor blackColor] CGColor];
        [self.view.layer addSublayer:ball];
    }
    ball.position = receivePoint;
    [self.view setNeedsDisplay];
}



@end
