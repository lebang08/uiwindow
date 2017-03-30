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
- (IBAction)setDataDefault:(id)sender;
@end

@implementation EmailEditViewController


- (void)viewDidLoad {
    //    self.editxtEmail.text = ((EmaiViewController *)self.presentingViewController).txtEmail.text;
    //    self.editxtEmail.text = @" i have a dream";
    self.editxtEmail.text = self.data;
    [super viewDidLoad];
}


- (IBAction)commit:(id)sender {
    //    ((EmaiViewController *)self.presentingViewController).txtEmail.text = self.editxtEmail.text;
    
    if ([self.mdelegate respondsToSelector:@selector(sendValues:)]) {
        [self.mdelegate sendValues:self.editxtEmail.text];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)setDataDefault:(id)sender {
    
}
@end
