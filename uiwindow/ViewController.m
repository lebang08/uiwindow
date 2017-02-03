//
//  ViewController.m
//  uiwindow
//
//  Created by apple on 2017/1/18.
//  Copyright © 2017年 lebang. All rights reserved.
//

#import "ViewController.h"
#import "EditViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize slider;
@synthesize stepper;

- (void)viewDidLoad {
    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.
//    UIView *view1 = [[UIView alloc]init];
//    view1.frame = CGRectMake(10, 30, 300, 440);
//    view1.backgroundColor = [UIColor redColor];
//    [self.view addSubview:view1];
//    
//    UIView *view2 =[[UIView alloc]init];
//    view2.frame = CGRectMake(20, 20, 260, 400);
//    view2.backgroundColor = [UIColor greenColor];
//    view2.tag =3;
//    [view1 addSubview:view2];
//
//    view1.autoresizesSubviews = YES;
//    
////    UIView *view3 = [[UIView alloc]init];
////    view3.frame = CGRectMake(20, 40, 280, 420);
////    view3.backgroundColor = [UIColor purpleColor];
////    view3.tag = 2;
////    [self.view addSubview:view3];
////    
////    UIView *view4 = [view1 viewWithTag:3];
//////    view4.frame = CGRectMake(50 ,50, 20, 20);
////    view4.backgroundColor = [UIColor yellowColor];
////    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
//    UILabel *label = [[UILabel alloc]init];
//    label.frame = CGRectMake(40, 40, 200, 700);
//    label.backgroundColor = [UIColor grayColor];
//    label.text = @" 我是label";
//    label.textColor = [UIColor colorWithRed:0.18f green:0.63f blue:0.86f alpha:0.80f];
//    label.alpha =0.5;
//    label.shadowOffset = CGSizeMake(5, 5);
//    label.shadowColor = [UIColor redColor];
//    label.numberOfLines = 20;
////    label.font = [UIFont systemFontSize:36];
//    [self.view addSubview:label];
//    NSLog(@"uuuuuuu----%f",50.0);
    UIImage *img = [UIImage imageNamed:@"logo"];
    UIImageView *imgview = [[UIImageView alloc] initWithImage:img];
    imgview.frame = CGRectMake(10, 30, 300,180);
    imgview.backgroundColor = [UIColor yellowColor];
    imgview.userInteractionEnabled = YES;
    UITapGestureRecognizer *singletap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageView)];
    [imgview addGestureRecognizer:singletap];
    [self.view addSubview:imgview];
    
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(10, 30, 30, 30);
    btn.backgroundColor = [UIColor redColor];
//    [btn addTarget:self action:@selector(yourBtn:) forControlEvents:UIControlEventTouchUpInside];
    [btn addTarget:self action:@selector(mybtnclick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
//    UILabel *label = [[UILabel alloc]init];
//    label.frame = CGRectMake(80, 80, 200, 100);
//    label.backgroundColor = [UIColor greenColor];
//    label.text = @"xcode- 人不能忘本";
//    [self.view addSubview:label];
    
    slider = [[UISlider alloc]initWithFrame:CGRectMake(10, 240, 300, 0)];
    slider.minimumValue = 0.0;
    slider.maximumValue =300.0;
    slider.value = 128;
    
    [slider setEnabled:YES];
    [self.view addSubview:slider];
    
    stepper = [[UIStepper alloc]init];
    stepper.minimumValue =0;
    stepper.maximumValue = 5;
    stepper.stepValue = 1;
    stepper.value =3;
    stepper.center = CGPointMake(160, 280);
    [stepper addTarget:self action:@selector(valueChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:stepper];
}


-(IBAction)mybtnclick:(id)sender{
    NSLog(@"my btn click");
}

-(IBAction)valueChange:(id)sender{
    NSLog(@"I am change value");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)mysSider:(id)sender forEvent:(UIEvent *)event {
    slider.value = slider.value+10;
    NSLog(@"sender --%f",slider.value);
}
- (IBAction)CodeOpen:(UIButton *)sender {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    EditViewController *edtViewControll = [mainStoryboard instantiateViewControllerWithIdentifier:@"myEditViewController"];
    [self presentViewController: edtViewControll animated:YES completion:nil];
}
@end
