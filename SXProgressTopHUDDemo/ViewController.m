//
//  ViewController.m
//  SXProgressTopHUDDemo
//
//  Created by 董 尚先 on 15-1-27.
//  Copyright (c) 2015年 董 尚先. All rights reserved.
//

#import "ViewController.h"
#import "SXProgressTopHUD.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)btnSuccess {
    [SXProgressTopHUD throwSuccess:@"保存成功 ^。^"];
}
- (IBAction)btnError {
    [SXProgressTopHUD throwError:@"保存失败 0.0"];
}
- (IBAction)btnLoading {
    [SXProgressTopHUD throwLoading:@"正在玩命加载中。。。"];
}
- (IBAction)btnComplete {
    [SXProgressTopHUD completeLoading];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



@end

