//
//  ViewController.h
//  uiwindow
//
//  Created by apple on 2017/1/18.
//  Copyright © 2017年 lebang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)mysSider:(id)sender forEvent:(UIEvent *)event;
- (IBAction)CodeOpen:(id)sender;

@property (strong,nonatomic) UISlider *slider;
@property (strong,nonatomic) UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UISlider *myIBslider;


@end
