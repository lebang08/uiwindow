//
//  ButtonViewController.h
//  uiwindow
//
//  Created by apple on 2017/2/5.
//  Copyright © 2017年 lebang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ButtonViewController : UIViewController
@property (strong,nonatomic) NSTimer *myTimer;
@property (weak, nonatomic) IBOutlet UIButton *MyFirstButton;
@property (weak, nonatomic) IBOutlet UIProgressView *myProgress;

- (IBAction)DoFirst:(UIButton *)sender;

@end
