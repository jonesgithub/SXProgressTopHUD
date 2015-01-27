//
//  SXProgressTopHUD.h
//  SXProgressTopHUDDemo
//
//  Created by 董 尚先 on 15-1-27.
//  Copyright (c) 2015年 董 尚先. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SXProgressTopHUD : NSObject

/* 本程序是本人写出的第一个小框架，用到的知识浅薄，用法简单便于上手，里面提供了几种自定义的接口，可由使用者自定义图片，暂时还未使用多种自定义颜色主题功能。有空会更新，里面的指示器使用了按钮而不是视图以便于扩展，有兴趣可设置点击按钮触发事件，打开相册等。 对于连续弹出的消息提示，暂时的设置是：只要顶部还有指示器后面的消息就忽略，如果不满意可在自己的控制器中设置缓存数组，每次操作都存入数组再从数组里一个一个播出 */

/**
 *  甩出一个信息，里面可以填充类似于“成功”的消息。
 *
 *  @param success 成功信息
 */
+ (void)throwSuccess:(NSString *)success;

/**
 *  甩出一个信息，里面可以填充类似于“失败”的消息。
 *
 *  @param error 失败信息
 */
+ (void)throwError:(NSString *)error;

/**
 *  甩出一个信息，里面可以填充自定义消息和自定义图片
 *
 *  @param message   自定义信息
 *  @param imageName 自定义图片名（仅可以填写本地的图片名）
 */
+ (void)throwMessage:(NSString *)message withImageName:(NSString *)imageName;

/**
 *  甩出一个信息，里面可以填充自定义消息和自定义图片
 *
 *  @param message 自定义信息
 *  @param image   自定义图片
 */
+ (void)throwMessage:(NSString *)message withImage:(UIImage *)image;

/**
 *  甩出一个信息，里面可以填充类似于“耐心等待”的消息，但本消息不会自动消失，需要配合completeLoading方法使用
 *  建议：传入字数不要超过10个汉字，即20个字符。以达到最佳效果
 *  @param message 耐心等待消息
 */
+ (void)throwLoading:(NSString *)message;

/**
 *  隐藏等待信息。
 */
+ (void)completeLoading;

@end
