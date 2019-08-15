//
//  ViewController.m
//  LYPopupTools
//
//  Created by Polly polly on 8/14/19.
//  Copyright © 2019 zhangliyong. All rights reserved.
//

#import "ViewController.h"
#import "LYPopupTools/LYPopupTools.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    MBProgressHUD *hud = [MBProgressHUD startLoading:self.view];
//
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        sleep(3);
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [MBProgressHUD finishLoading:hud
//                                  result:YES
//                                    text:nil
//                              completion:nil];
//        });
//    });
    
//    [MBProgressHUD showMessage:nil onView:self.view result:YES completion:nil];
    
    [MBProgressHUD showMessage:@"hello world" onView:self.view result:YES completion:nil];
    
//    [MBProgressHUD showMessage:@"hello world" onView:self.view.window];
    
//    [MBProgressHUD showMessage:@"服务器异常"
//                        onView:self.view
//                      position:LYMBProgressPositionBottom
//                    completion:nil];
}


@end
