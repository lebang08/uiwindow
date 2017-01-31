//
//  EditViewController.m
//  uiwindow
//
//  Created by apple on 2017/1/31.
//  Copyright © 2017年 lebang. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController

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

- (IBAction)logSomeThing:(UIButton *)sender {
    NSLog(@"editview----------------------%s","what");
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"这是一个简单的警告框" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}

- (IBAction)DeleteViewControl:(UIButton *)sender {
//    finish this UIViewController
    [self dismissViewControllerAnimated:YES completion:nil];
//    UIWebView *webview = [[UIWebView alloc]initWithFrame:CGRectMake(10, 10, 300, 300)];
//    [self.view addSubview:webview];
//    NSURL *url;
//    url = [[NSURL alloc]initWithString:@"http://www.baidu.com/"];
//    [webview loadRequest:[NSURLRequest requestWithURL:url]];
}

@end
