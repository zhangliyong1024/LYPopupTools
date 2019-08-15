//
//  MBProgressHUD+LYPopupTools.h
//  LYPopupTools
//
//  Created by Polly polly on 8/14/19.
//  Copyright © 2019 zhangliyong. All rights reserved.
//

#import <MBProgressHUD/MBProgressHUD.h>

#define PROGRESS_DELAY_SHORT_HIDE    1.5f
#define PROGRESS_DELAY_LONG_HIDE     3.0f

typedef enum : NSUInteger {
    LYMBProgressPositionTop,
    LYMBProgressPositionMiddle,
    LYMBProgressPositionBottom
} LYMBProgressPosition;

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (LYPopupTools)

+ (MBProgressHUD *)startLoading:(UIView *)view;

+ (MBProgressHUD *)startLoading:(UIView *)view
                        message:(nullable NSString *)message;

+ (void)finishLoading:(MBProgressHUD *)hud;

+ (void)finishLoading:(MBProgressHUD *)hud
               result:(BOOL)success
                 text:(nullable NSString *)text
           completion:(nullable void (^)(void))completionBlock;

+ (void)showMessage:(NSString *)message
             onView:(UIView *)view
           position:(LYMBProgressPosition)position
         completion:(nullable void (^)(void))completionBlock;

+ (void)showMessage:(nullable NSString *)message
             onView:(UIView *)view;

+ (void)showMessage:(nullable NSString *)message
             onView:(UIView *)view
         completion:(nullable void (^)(void))completionBlock;

+ (void)showMessage:(nullable NSString *)message
             onView:(UIView *)view
             result:(BOOL)success
         completion:(nullable void (^)(void))completionBlock;

@end

NS_ASSUME_NONNULL_END
