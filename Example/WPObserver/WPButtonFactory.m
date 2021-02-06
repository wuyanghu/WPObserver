//
//  WPButtonFactory.m
//  WPObserver_Example
//
//  Created by wupeng on 2021/2/6.
//  Copyright © 2021 823105162@qq.com. All rights reserved.
//

#import "WPButtonFactory.h"

@implementation WPButtonFactory

+ (UIButton *)createButton:(NSString *)title frame:(CGRect)frame{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.frame = frame;
    button.backgroundColor = [UIColor redColor];
    return button;
}

@end
