//
//  ButtonViewController.m
//  uiwindow
//
//  Created by apple on 2017/2/5.
//  Copyright © 2017年 lebang. All rights reserved.
//

#import "ButtonViewController.h"

@interface ButtonViewController ()

@end

@implementation ButtonViewController
@synthesize MySecondButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    MySecondButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 300, 100, 28)];
    MySecondButton.backgroundColor = [UIColor redColor];
    [MySecondButton addTarget:self action:@selector(DoSecond:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:MySecondButton];
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

- (IBAction)DoFirst:(UIButton *)sender {
    self.MyFirstButton.backgroundColor = [UIColor redColor];
}

-(IBAction)DoSecond:(id)sender{
    MySecondButton.backgroundColor = [UIColor greenColor];
}

@end
