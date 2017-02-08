//
//  NavigateController.m
//  uiwindow
//
//  Created by apple on 2017/2/8.
//  Copyright © 2017年 lebang. All rights reserved.
//

#import "NavigateController.h"

@interface NavigateController ()

@end

@implementation NavigateController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)Cancel:(id)sender {
    self.HomeTitle.text = @"Cancel";
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)Save:(UIBarButtonItem *)sender {
    self.HomeTitle.text = @"Save";
}

- (IBAction)tool:(id)sender {
    self.HomeTitle.text = @"tool";
}

- (IBAction)bar:(id)sender {
    self.HomeTitle.text = @"bar";
}
@end
