//
//  ButtonViewController.m
//  uiwindow
//
//  Created by apple on 2017/2/5.
//  Copyright © 2017年 lebang. All rights reserved.
//

#import "ButtonViewController.h"
#import "NavigateController.h"

@interface ButtonViewController ()
@property (strong, nonatomic) IBOutlet UIButton *MySecondButton;
@property (strong, nonatomic) IBOutlet UIButton *MyThirdButton;

@end

@implementation ButtonViewController
@synthesize MySecondButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _MyFirstButton.backgroundColor = [UIColor purpleColor];
    
    MySecondButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 300, 100, 28)];
    MySecondButton.backgroundColor = [UIColor redColor];
    [MySecondButton addTarget:self action:@selector(DoSecond:) forControlEvents:UIControlEventTouchUpInside];
    
    _MyThirdButton  = [[UIButton alloc]initWithFrame:CGRectMake(80, 400, 100, 20)];
    _MyThirdButton.backgroundColor = [UIColor purpleColor];
    [_MyThirdButton setTitle:@"Third" forState:UIControlStateHighlighted];
    [_MyThirdButton addTarget:self action:@selector(DoThird:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:MySecondButton];
    [self.view addSubview:_MyThirdButton];
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

- (IBAction)DoSecond:(id)sender{
    MySecondButton.backgroundColor = [UIColor greenColor];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NavigateController *myNavigateController = [storyboard instantiateViewControllerWithIdentifier:@"MyNavigate"];
    [self presentViewController:myNavigateController animated:NO completion:nil];
}

-(IBAction)DoThird:(id)sender{
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
