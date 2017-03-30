//
//  ViewController.m
//  uiwindow
//
//  Created by apple on 2017/1/18.
//  Copyright © 2017年 lebang. All rights reserved.
//

#import "ViewController.h"
#import "EditViewController.h"
#import "Header.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize slider;
@synthesize stepper;


- (IBAction)swipe:(UISwipeGestureRecognizer *)sender {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    EditViewController *edtViewControll = [mainStoryboard instantiateViewControllerWithIdentifier:@"myEditViewController"];
    [self presentViewController: edtViewControll animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *img = [UIImage imageNamed:@"logo"];
    UIImageView *imgview = [[UIImageView alloc] initWithImage:img];
    imgview.frame = CGRectMake(10, 30,KWidth,180);
    imgview.backgroundColor = [UIColor yellowColor];
    imgview.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *singletap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(myTouch:)];
    [imgview addGestureRecognizer:singletap];
    [self.view addSubview:imgview];
    
    slider = [[UISlider alloc]initWithFrame:CGRectMake(10, 240,KWidth, 0)];
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
    self.view.backgroundColor = [UIColor whiteColor];
}

-(IBAction)myTouch:(id)sender{
    NSLog(@"I am touch");
}

-(IBAction)valueChange:(id)sender{
    NSLog(@"I am change value + %f",stepper.value);
}

- (IBAction)mysSider:(id)sender forEvent:(UIEvent *)event {
    slider.value = _myIBslider.value;
    NSLog(@"sender --%f",slider.value);
}
- (IBAction)CodeOpen:(UIButton *)sender {
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    EditViewController *edtViewControll = [mainStoryboard instantiateViewControllerWithIdentifier:@"myEditViewController"];
    [self presentViewController: edtViewControll animated:YES completion:nil];
}
@end
