//
//  EmaiViewController.m
//  uiwindow
//
//  Created by apple on 2017/3/16.
//  Copyright © 2017年 lebang. All rights reserved.
//

#import "EmaiViewController.h"
#import "EmailEditViewController.h"

@interface EmaiViewController ()<EmailEditDelegate>

@end

@implementation EmaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"color is %i",0xffeedd);
    self.txtEmail.textColor = [UIColor yellowColor];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    EmailEditViewController *emaiEditController = segue.destinationViewController;
    emaiEditController.data = self.txtEmail.text;
    
    emaiEditController.mdelegate = self;
}

- (void)sendValues:(NSString *)value
{
    
    self.txtEmail.text = value;
}

@end
