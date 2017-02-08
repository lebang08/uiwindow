//
//  ButtonViewController.h
//  uiwindow
//
//  Created by apple on 2017/2/5.
//  Copyright © 2017年 lebang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ButtonViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *MyFirstButton;
- (IBAction)DoFirst:(UIButton *)sender;

@end
