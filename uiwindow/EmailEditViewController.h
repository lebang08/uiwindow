//
//  EmailEditViewController.h
//  uiwindow
//
//  Created by apple on 2017/3/16.
//  Copyright © 2017年 lebang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EmailEditDelegate <NSObject>

-(void) sendValues:(NSString*) value;

@end

@interface EmailEditViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *editxtEmail;
@property (strong, nonatomic) NSString *data;

@property (weak, nonatomic) id<EmailEditDelegate> mdelegate;

@end
