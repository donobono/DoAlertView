//
//  ViewController.m
//  TestAlert
//
//  Created by Seungbo Cho on 2013. 12. 19..
//  Copyright (c) 2013년 Seungbo Cho. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _sgSelect.selectedSegmentIndex = 0;
    _sgType.selectedSegmentIndex = 0;

    [self onSelect:nil];
    [self onSelectAnimationType:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onShowAlert:(id)sender
{
    _vAlert = [[DoAlertView alloc] init];
    _vAlert.nAnimationType = _sgType.selectedSegmentIndex;
    _vAlert.dRound = 2.0;
    
    if (_sgSelectImage.selectedSegmentIndex == 1)
    {
        _vAlert.iImage = [UIImage imageNamed:@"pic1.jpg"];
        _vAlert.nContentMode = DoContentImage;
    }
    else if (_sgSelectImage.selectedSegmentIndex == 2)
    {
        _vAlert.iImage = [UIImage imageNamed:@"pic2.jpg"];
        _vAlert.nContentMode = DoContentImage;
    }
    else if (_sgSelectImage.selectedSegmentIndex == 3)
    {
        _vAlert.nContentMode = DoContentMap;
        _vAlert.dLocation = @{@"latitude" : @(37.78275123), @"longitude" : @(-122.40416442), @"altitude" : @200};
    }
    
    switch (_sgSelect.selectedSegmentIndex) {
        case 0:
            _vAlert.bDestructive = NO;
            [_vAlert doYesNo:@"Title"
                        body:@"Here’s a snippet of code that illustrates how the whole process works"
                         yes:^(DoAlertView *alertView) {
                          
                             NSLog(@"Yeeeeeeeeeeeees!!!!");

                         } no:^(DoAlertView *alertView) {

                             NSLog(@"Noooooooooooooo!!!!");
                           
                         }];
            _vAlert = nil;
            break;

        case 1:
            _vAlert.bDestructive = NO;
            [_vAlert doYes:@"Here’s a snippet of code that illustrates how the whole process works"
                       yes:^(DoAlertView *alertView) {
                         
                         NSLog(@"Yeeeeeeeeeeeees!!!!");
                         
                       }];
            _vAlert = nil;
            break;

        case 2:
            _vAlert.bDestructive = YES;
            [_vAlert doYes:@"Here’s a snippet of code that illustrates how the whole process works"
                       yes:^(DoAlertView *alertView) {
                           
                           NSLog(@"Yeeeeeeeeeeeees!!!!");
                           
                       }];
            _vAlert = nil;
            break;

        case 3:
            _vAlert.bDestructive = YES;
            [_vAlert doYesNo:@"Here’s a snippet of code that illustrates how the whole process works"
                         yes:^(DoAlertView *alertView) {
                           
                           NSLog(@"Yeeeeeeeeeeeees!!!!");
                           
                         } no:^(DoAlertView *alertView) {
                           
                           NSLog(@"Noooooooooooooo!!!!");
                           
                         }];
            _vAlert = nil;
            break;
            
        case 4:
            // case 1 : alertview has timer.
//            [_vAlert doAlert:@"Please wait a second!"
//                        body:@"Getting great data from server..."
//                    duration:1.0
//                        done:^(DoAlertView *alertView) {
//
//                          NSLog(@"Done!!!!");
//                          
//                        }];
//
//            _vAlert = nil;
            
            // case 2 : viewcontroller has timer for async operations
            [_vAlert doAlert:@"Please wait a second!"
                        body:@"Getting great data from server..."
                    duration:0.0
                        done:^(DoAlertView *alertView) {
                            
                            NSLog(@"Done!!!!");
                            
                        }];
            
            [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(onTimerOfViewController) userInfo:nil repeats:NO];
            break;

        default:
            break;
    }
}

- (void)onTimerOfViewController
{
    [_vAlert hideAlert];
    _vAlert = nil;
}

- (IBAction)onSelect:(id)sender
{
    switch (_sgSelect.selectedSegmentIndex) {
        case 0:
            _lbMode.text = @"Yes/No with title";
            break;
        case 1:
            _lbMode.text = @"Yes";
            break;
        case 2:
            _lbMode.text = @"Yes destructive";
            break;
        case 3:
            _lbMode.text = @"Yes/No destructive";
            break;
        case 4:
            _lbMode.text = @"Without any button";
            break;
            
        default:
            break;
    }
}

- (IBAction)onSelectAnimationType:(id)sender
{
    switch (_sgType.selectedSegmentIndex) {
        case DoTransitionStyleTopDown:
            _lbType.text = @"DoTransitionStyleTopDown";
            break;
        case DoTransitionStyleBottomUp:
            _lbType.text = @"DoTransitionStyleBottomUp";
            break;
        case DoTransitionStyleFade:
            _lbType.text = @"DoTransitionStyleFade";
            break;
        case DoTransitionStylePop:
            _lbType.text = @"DoTransitionStylePop";
            break;
        case DoTransitionStyleLine:
            _lbType.text = @"DoTransitionStyleLine";
            break;
            
        default:
            break;
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
