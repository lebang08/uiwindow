//
//  EditViewController.h
//  uiwindow
//
//  Created by apple on 2017/1/31.
//  Copyright © 2017年 lebang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController
- (IBAction)logSomeThing:(UIButton *)sender;
- (IBAction)DeleteViewControl:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *logSomeThingBtn;

@end
