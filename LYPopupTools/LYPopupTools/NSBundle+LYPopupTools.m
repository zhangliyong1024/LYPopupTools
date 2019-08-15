//
//  NSBundle+LYPopupTools.m
//  LYPopupTools
//
//  Created by Polly polly on 8/14/19.
//  Copyright © 2019 zhangliyong. All rights reserved.
//

#import "NSBundle+LYPopupTools.h"

NSString *const LYPopupToosLoadingText = @"LYPopupToosLoadingText";
NSString *const LYPopupToosSuccessText = @"LYPopupToosSuccessText";
NSString *const LYPopupToosFailureText = @"LYPopupToosFailureText";

@implementation NSBundle (LYPopupTools)

+ (instancetype)ly_popupToolsBundle {
    static NSBundle *popupToolsBundle = nil;
    if (popupToolsBundle == nil) {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"LYPopupTools"
                                                               ofType:@"bundle"];
        popupToolsBundle = [NSBundle bundleWithPath:bundlePath];
    }
    
    return popupToolsBundle;
}

+ (UIImage *)ly_successImage {
    static UIImage *successImage = nil;
    
    if (successImage == nil) {
        successImage = [[UIImage imageWithContentsOfFile:[[self ly_popupToolsBundle] pathForResource:@"ic_hud_success@2x" ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    return successImage;
}

+ (UIImage *)ly_failureImage {
    static UIImage *failureImage = nil;
    
    if (failureImage == nil) {
        failureImage = [[UIImage imageWithContentsOfFile:[[self ly_popupToolsBundle] pathForResource:@"ic_hud_failure@2x" ofType:@"png"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    return failureImage;
}

+ (NSString *)ly_localizedStringForKey:(NSString *)key {
    return [self ly_localizedStringForKey:key value:nil];
}

+ (NSString *)ly_localizedStringForKey:(NSString *)key
                                 value:(NSString *)value {
    static NSBundle *bundle = nil;
    if (bundle == nil) {
        NSString *language = [NSLocale preferredLanguages].firstObject;
        
        // 支持英文和简体中文
        if ([language hasPrefix:@"en"]) {
            language = @"en";
        } else if ([language hasPrefix:@"zh"]) {
            if ([language rangeOfString:@"Hans"].location != NSNotFound) {
                language = @"zh-Hans";
            } else {
                language = @"en";
            }
        } else {
            language = @"en";
        }
        
        bundle = [NSBundle bundleWithPath:[[NSBundle ly_popupToolsBundle] pathForResource:language ofType:@"lproj"]];
    }
    
    value = [bundle localizedStringForKey:key value:value table:nil];
    
    return [[NSBundle mainBundle] localizedStringForKey:key value:value table:nil];
}

@end
