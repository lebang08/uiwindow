//
//  NavigateController.h
//  uiwindow
//
//  Created by apple on 2017/2/8.
//  Copyright © 2017年 lebang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NavigateController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *HomeTitle;
- (IBAction)Cancel:(id)sender;
- (IBAction)Save:(UIBarButtonItem *)sender;

@end
