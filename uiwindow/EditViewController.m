//
//  EditViewController.m
//  uiwindow
//
//  Created by apple on 2017/1/31.
//  Copyright © 2017年 lebang. All rights reserved.
//

#import "EditViewController.h"
#import "ButtonViewController.h"

@interface EditViewController ()

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"edtsegue"]) {
        ButtonViewController* btncontrol = segue.destinationViewController;
        btncontrol.data = @"lalala";
    }
}

- (IBAction)logSomeThing:(id)sender {
    NSLog(@"editview----------------------%s","what");
    //    _logSomeThingBtn.backgroundColor = [UIColor redColor];
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"提示"
                          message:@"这是一个简单的警告框"
                          delegate:self
                          cancelButtonTitle:@"确定"
                          otherButtonTitles: @"取",nil];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"button index = %ld",(long)buttonIndex);
    if (buttonIndex == 1) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"sheet button index = %ld",buttonIndex);
}

- (IBAction)DeleteViewControl:(id)sender {
    UIActionSheet *actionsheet = [[UIActionSheet alloc]initWithTitle:nil
                                                            delegate:self
                                                   cancelButtonTitle:@"cancel"
                                              destructiveButtonTitle:@"destory"
                                                   otherButtonTitles:@"facebook",@"sina", nil];
    actionsheet.actionSheetStyle = UIActionSheetStyleAutomatic;
    [actionsheet showInView:self.view];
    
    //Todo 配置网络权限
    
    //    UIWebView *webview = [[UIWebView alloc]initWithFrame:CGRectMake(10, 10, 300, 300)];
    //    [self.view addSubview:webview];
    //    NSURL *url;
    //    url = [[NSURL alloc]initWithString:@"http://www.baidu.com/"];
    //    [webview loadRequest:[NSURLRequest requestWithURL:url]];
}

@end
