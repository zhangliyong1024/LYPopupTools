//
//  MBProgressHUD+LYPopupTools.m
//  LYPopupTools
//
//  Created by Polly polly on 8/14/19.
//  Copyright © 2019 zhangliyong. All rights reserved.
//

#import "MBProgressHUD+LYPopupTools.h"
#import "NSBundle+LYPopupTools.h"

@implementation MBProgressHUD (LYPopupTools)

+ (MBProgressHUD *)startLoading:(UIView *)view {
    return [self startLoading:view
                      message:[NSBundle ly_localizedStringForKey:LYPopupToosLoadingText]];
}

+ (MBProgressHUD *)startLoading:(UIView *)view
                        message:(NSString *)message {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [hud setMode:MBProgressHUDModeIndeterminate];
    [hud setContentColor:[UIColor darkGrayColor]];
    hud.label.text = message?:[NSBundle ly_localizedStringForKey:LYPopupToosLoadingText];
    
    return hud;
}

+ (void)finishLoading:(MBProgressHUD *)hud {
    [hud hideAnimated:YES];
}

+ (void)finishLoading:(MBProgressHUD *)hud
               result:(BOOL)success
                 text:(NSString *)text
           completion:(void (^)(void))completionBlock {
    [hud setMode:MBProgressHUDModeCustomView];
    [hud setContentColor:[UIColor darkGrayColor]];
    
    if (success) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[NSBundle ly_successImage]];
        [hud setCustomView:imageView];
        hud.label.text = text?:[NSBundle ly_localizedStringForKey:LYPopupToosSuccessText];
    }
    else {
        [hud setCustomView:[[UIImageView alloc] initWithImage:[NSBundle ly_failureImage]]];
        hud.label.text = text?:[NSBundle ly_localizedStringForKey:LYPopupToosFailureText];
    }
    
    [hud hideAnimated:YES afterDelay:PROGRESS_DELAY_SHORT_HIDE];
    
    [hud setCompletionBlock:completionBlock];
}

+ (void)showMessage:(NSString *)message
             onView:(UIView *)view
           position:(LYMBProgressPosition)position
         completion:(void (^)(void))completionBlock {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [hud setMode:MBProgressHUDModeText];
    hud.label.text = message;
    switch (position) {
        case LYMBProgressPositionTop: {
            hud.offset = CGPointMake(0.f, -MBProgressMaxOffset);
        }
            break;
        case LYMBProgressPositionMiddle: {
            hud.offset = CGPointMake(0.f, 0.f);
            
        }
            break;
        case LYMBProgressPositionBottom: {
            hud.offset = CGPointMake(0.f, MBProgressMaxOffset);
            
        }
            break;
    }
    [hud setContentColor:[UIColor darkGrayColor]];
    [hud hideAnimated:YES afterDelay:PROGRESS_DELAY_LONG_HIDE];
    hud.completionBlock = completionBlock;
}

+ (void)showMessage:(NSString *)message
             onView:(UIView *)view {
    [self showMessage:message
               onView:view
           completion:nil];
}

+ (void)showMessage:(NSString *)message
             onView:(UIView *)view
         completion:(void (^)(void))completionBlock {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [hud setMode:MBProgressHUDModeText];
    hud.label.text = message;
    [hud setContentColor:[UIColor darkGrayColor]];
    [hud hideAnimated:YES afterDelay:PROGRESS_DELAY_LONG_HIDE];
    hud.completionBlock = completionBlock;
}

+ (void)showMessage:(NSString *)message
             onView:(UIView *)view
             result:(BOOL)success
         completion:(void (^)(void))completionBlock {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    UIImage *image = success?[NSBundle ly_successImage]:[NSBundle ly_failureImage];
    [hud setMode:MBProgressHUDModeCustomView];
    [hud setCustomView:[[UIImageView alloc] initWithImage:image]];
    [hud setContentColor:[UIColor darkGrayColor]];
    
    NSString *messageT = message;
    if (!messageT) {
        messageT = success?[NSBundle ly_localizedStringForKey:LYPopupToosSuccessText]:[NSBundle ly_localizedStringForKey:LYPopupToosFailureText];
    }
    
    hud.label.text = messageT;
    
    [hud hideAnimated:YES afterDelay:PROGRESS_DELAY_SHORT_HIDE];
    
    hud.completionBlock = completionBlock;
}

@end
