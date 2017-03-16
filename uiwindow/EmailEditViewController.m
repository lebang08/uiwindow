//
//  EmailEditViewController.m
//  uiwindow
//
//  Created by apple on 2017/3/16.
//  Copyright © 2017年 lebang. All rights reserved.
//

#import "EmailEditViewController.h"
#import "EmaiViewController.h"

@interface EmailEditViewController ()
- (IBAction)commit:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *editxtEmail;

@end

@implementation EmailEditViewController

- (void)viewDidLoad {
//    self.editxtEmail.text = ((EmaiViewController *)self.presentingViewController).txtEmail.text;
    self.editxtEmail.text = @" i have a dream";
    [super viewDidLoad];
}


- (IBAction)commit:(id)sender {
//    ((EmaiViewController *)self.presentingViewController).txtEmail.text = self.editxtEmail.text;
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
