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
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *myIndicate;

@end

@implementation ButtonViewController
@synthesize MySecondButton;

#pragma mark
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _MyFirstButton.backgroundColor = [UIColor greenColor];
    
    MySecondButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 300, 100, 28)];
    MySecondButton.backgroundColor = [UIColor redColor];
    [MySecondButton setTitle:@"Second" forState:UIControlStateNormal];
    [MySecondButton addTarget:self action:@selector(DoSecond:) forControlEvents:UIControlEventTouchUpInside];
    
    _MyThirdButton  = [[UIButton alloc]initWithFrame:CGRectMake(80, 400, 100, 20)];
    _MyThirdButton.backgroundColor = [UIColor purpleColor];
    [_MyThirdButton setTitle:@"Third" forState:UIControlStateNormal];
    [_MyThirdButton addTarget:self action:@selector(DoThird:) forControlEvents:UIControlEventTouchUpInside];
    
    self.myIndicate = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(100, 10, 40, 40)];
    self.myIndicate.backgroundColor = [UIColor blueColor];
    [self.myIndicate startAnimating];
    [self.view addSubview:MySecondButton];
    [self.view addSubview:_MyThirdButton];
    [self.view addSubview:_myIndicate];
}

#pragma mark
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)DoFirst:(UIButton *)sender {
    self.MyFirstButton.backgroundColor = [UIColor redColor];
    
    if ([self.myIndicate isAnimating]) {
        [self.myIndicate stopAnimating];
    }else{
        [self.myIndicate startAnimating];
        
    }
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                    target:self
                                                  selector:@selector(download)
                                                  userInfo:nil
                                                   repeats:YES];
}

-(void)download{
    self.myProgress.progress = self.myProgress.progress +0.1;
    NSLog(@"downprogress=%f",self.myProgress.progress);
    if(self.myProgress.progress == 1){
        [self.myTimer invalidate];
        NSLog(@"download finish");
    }
}

#pragma mark
- (IBAction)DoSecond:(id)sender{
    MySecondButton.backgroundColor = [UIColor greenColor];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NavigateController *myNavigateController = [storyboard instantiateViewControllerWithIdentifier:@"MyNavigate"];
    [self presentViewController:myNavigateController animated:NO completion:nil];
}

#pragma mark
-(IBAction)DoThird:(id)sender{
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
