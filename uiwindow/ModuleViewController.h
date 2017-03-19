//
//  ModuleViewController.h
//  uiwindow
//
//  Created by apple on 2017/3/19.
//  Copyright © 2017年 lebang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ModuleDelegate <NSObject>

@required
-(void) setString:(NSString*) arg;

@optional
-(void) setNothing:(NSString*) arg;


@end

@interface ModuleViewController : UIViewController

@property (strong,nonatomic) NSString* name;

@property (weak,nonatomic) id<ModuleDelegate> mDelegate;

@end
