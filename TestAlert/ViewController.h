//
//  ViewController.h
//  TestAlert
//
//  Created by Seungbo Cho on 2013. 12. 19..
//  Copyright (c) 2013년 Seungbo Cho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DoAlertView.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl     *sgSelect;
@property (weak, nonatomic) IBOutlet UISegmentedControl     *sgType;
@property (weak, nonatomic) IBOutlet UISegmentedControl     *sgSelectImage;

@property (weak, nonatomic) IBOutlet UILabel                *lbMode;
@property (weak, nonatomic) IBOutlet UILabel                *lbType;

@property (strong, nonatomic)   DoAlertView                 *vAlert;

- (IBAction)onShowAlert:(id)sender;

- (IBAction)onSelect:(id)sender;
- (IBAction)onSelectAnimationType:(id)sender;

@end
