//
//  NSBundle+LYPopupTools.h
//  LYPopupTools
//
//  Created by Polly polly on 8/14/19.
//  Copyright © 2019 zhangliyong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

UIKIT_EXTERN NSString *const LYPopupToosLoadingText;
UIKIT_EXTERN NSString *const LYPopupToosSuccessText;
UIKIT_EXTERN NSString *const LYPopupToosFailureText;

@interface NSBundle (LYPopupTools)

+ (instancetype)ly_popupToolsBundle;

+ (UIImage *)ly_successImage;

+ (UIImage *)ly_failureImage;

+ (NSString *)ly_localizedStringForKey:(NSString *)key;

+ (NSString *)ly_localizedStringForKey:(NSString *)key
                                 value:(nullable NSString *)value;

@end

NS_ASSUME_NONNULL_END
