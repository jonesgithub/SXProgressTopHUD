//
//  SXProgressTopHUD.m
//  SXProgressTopHUDDemo
//
//  Created by 董 尚先 on 15-1-27.
//  Copyright (c) 2015年 董 尚先. All rights reserved.
//

#import "SXProgressTopHUD.h"

#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
static const int kProgressTopHeight = 40;
static const int kMessageFontSize = 18;
static const double kAnimateDuration = 0.5;
/**
 *  全局变量窗口
 */
static UIWindow *_window;
/**
 *  全局变量顶部的指示器按钮
 */
static UIButton *_btnTop;
/**
 *  全局变量是否动画
 */
BOOL _animate = YES;

@implementation SXProgressTopHUD

/**
 *  甩出一个信息，里面可以填充类似于“成功”的消息。
 *
 *  @param success 成功信息
 */
+ (void)throwSuccess:(NSString *)success{
    [self throwMessage:success withImageName:@"SXProgressTopHUD.bundle/success.png"];
}

/**
 *  甩出一个信息，里面可以填充类似于“失败”的消息。
 *
 *  @param error 失败信息
 */
+ (void)throwError:(NSString *)error{
    [self throwMessage:error withImageName:@"SXProgressTopHUD.bundle/error.png"];
}

/**
 *  甩出一个信息，传入图片名，里面可以填充自定义消息和自定义图片
 *
 *  @param message   自定义信息
 *  @param imageName 自定义图片名（仅可以填写本地的图片名）
 */
+ (void)throwMessage:(NSString *)message withImageName:(NSString *)imageName{
    [self throwMessage:message withImage:[UIImage imageNamed:imageName]];
}

/**
 *  甩出一个信息，传入图片，里面可以填充自定义消息和自定义图片
 *
 *  @param message 自定义信息
 *  @param image   自定义图片
 */
+ (void)throwMessage:(NSString *)message withImage:(UIImage *)image{
    // 已显示信息时，无视再次添加的信息
    if (_window !=nil) {
        return;
    }
    // 创建自定义按钮
    _btnTop = [[UIButton alloc]init];
    _btnTop.titleLabel.font = [UIFont boldSystemFontOfSize:kMessageFontSize];
    _btnTop.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    _btnTop.imageEdgeInsets = UIEdgeInsetsMake(5, 0, 0, 10);
    [_btnTop setTitle:message forState:UIControlStateNormal];
    [_btnTop setTitleColor:[UIColor colorWithRed:236/255.0 green:110/255.0 blue:123/255.0 alpha:1] forState:UIControlStateNormal];
    [_btnTop setImage:image forState:UIControlStateNormal];
    
    // 创建一个自定义窗口
    _window = [[UIWindow alloc]init];
    _window.windowLevel = UIWindowLevelAlert;
    _window.backgroundColor = [UIColor colorWithRed:175/255.0 green:208/255.0 blue:238/255.0 alpha:1];
    
    // 设置两个控件的尺寸
    _window.frame = CGRectMake(0, -kProgressTopHeight, kScreenWidth, kProgressTopHeight);
    _btnTop.frame = _window.bounds;
    [_window addSubview:_btnTop];
    
    // 显示窗口
    _window.hidden = NO;
    
    // 执行出现后类似弹簧的动画
    [UIView animateWithDuration:kAnimateDuration animations:^{
        _window.frame = CGRectMake(0, kProgressTopHeight, kScreenWidth, kProgressTopHeight);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            _window.frame = CGRectMake(0, 0, kScreenWidth, kProgressTopHeight);
        } completion:^(BOOL finished) {
            //            [UIView animateWithDuration:0.1 animations:^{
            //                _window.frame = CGRectMake(0, 15, kScreenWidth, kProgressTopHeight);
            //            } completion:^(BOOL finished) {
            //                [UIView animateWithDuration:0.1 animations:^{
            //                    _window.frame = CGRectMake(0, 0, kScreenWidth, kProgressTopHeight);
            //                } completion:^(BOOL finished) {
            [UIView animateWithDuration:kAnimateDuration delay:1.0 options:1 animations:^{
                _window.frame = CGRectMake(kScreenWidth, 0, kScreenWidth, kProgressTopHeight);
            } completion:^(BOOL finished) {
                _window = nil;
                _btnTop = nil;
            }];
        }];
    }];
    //        }];
    //    }];
}

/**
 *  甩出一个信息，里面可以填充类似于“耐心等待”的消息，但本消息不会自动消失，需要配合completeLoading方法使用
 *  建议：传入字数不要超过10个汉字，即20个字符。以达到最佳效果
 *  @param message 耐心等待消息
 */
+ (void)throwLoading:(NSString *)message{
    if (_window != nil) {
        return;
    }
    // 创建自定义按钮
    _btnTop = [[UIButton alloc]init];
    _btnTop.titleLabel.font = [UIFont boldSystemFontOfSize:kMessageFontSize];
    _btnTop.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [_btnTop setTitle:message forState:UIControlStateNormal];
    [_btnTop setTitleColor:[UIColor colorWithRed:236/255.0 green:110/255.0 blue:123/255.0 alpha:1] forState:UIControlStateNormal];
    
    // 创建一个自定义窗口
    _window = [[UIWindow alloc]init];
    _window.windowLevel = UIWindowLevelAlert;
    _window.backgroundColor = [UIColor colorWithRed:175/255.0 green:208/255.0 blue:238/255.0 alpha:1];
    
    // 设置两个控件的尺寸
    _window.frame = CGRectMake(0, -kProgressTopHeight, kScreenWidth * 1.5, kProgressTopHeight);
    _btnTop.frame = _window.bounds;
    [_window addSubview:_btnTop];
    
    // 显示窗口
    _window.hidden = NO;
    
    _animate = YES;
    
    [self loadingAnimate];
    
    
}

/**
 *  隐藏等待信息。
 */
+ (void)completeLoading{
    _animate = NO ;
    _btnTop = nil;
    _window.frame = CGRectMake(0, 0, kScreenWidth * 2, kProgressTopHeight);
    [UIView animateWithDuration:0.2 animations:^{
        _window.frame = CGRectMake(0, -kProgressTopHeight, kScreenWidth * 2, kProgressTopHeight);
    } completion:^(BOOL finished) {
        _window = nil;
    }];
    
}

/**
 *  用于loading循环动画
 */
+ (void)loadingAnimate
{
    if (_animate == NO) {
        return;
    }
    [UIView animateWithDuration:kAnimateDuration animations:^{
        _window.frame = CGRectMake(0, 0, kScreenWidth * 1.5, kProgressTopHeight);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            _window.frame = CGRectMake(-kScreenWidth * 0.5, 0, kScreenWidth * 1.5, kProgressTopHeight);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 animations:^{
                _window.frame = CGRectMake(-160, 0, kScreenWidth * 1.5, kProgressTopHeight);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.1 animations:^{
                    _window.frame = CGRectMake(-kScreenWidth * 0.5, 0, kScreenWidth * 1.5, kProgressTopHeight);
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:kAnimateDuration*2 delay:2.0 options:1 animations:^{
                        _window.frame = CGRectMake(0, 0, kScreenWidth * 1.5, kProgressTopHeight);
                    } completion:^(BOOL finished) {
                        [self loadingAnimate];
                    }];
                }];
            }];
        }];
    }];
}

@end

