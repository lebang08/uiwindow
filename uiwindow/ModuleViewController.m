//
//  ModuleViewController.m
//  uiwindow
//
//  Created by apple on 2017/3/19.
//  Copyright © 2017年 lebang. All rights reserved.
//

#import "ModuleViewController.h"

@interface ModuleViewController ()
@property (weak, nonatomic) IBOutlet UILabel *moduleName;
@property (weak, nonatomic) IBOutlet UITextField *edtPracticed;
- (IBAction)doCommit:(id)sender;

@end

@implementation ModuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.moduleName.text = self.name;
}

-(void)viewWillDisappear:(BOOL)animated{
    NSLog(@"done something 1");
    self.name = self.edtPracticed.text;
    if ([self.mDelegate respondsToSelector:@selector(setString:)]) {
        [self.mDelegate setString:self.name];
        NSLog(@"done something 2");
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"done something 3");
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)doCommit:(id)sender {
    NSLog(@"done something 1");
    self.name = self.edtPracticed.text;
    if ([self.mDelegate respondsToSelector:@selector(setString:)]) {
        [self.mDelegate setString:self.name];
        NSLog(@"done something 2");
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"done something 3");
}
@end
