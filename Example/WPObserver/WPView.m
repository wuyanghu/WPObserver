//
//  WPTextView.m
//  WPObserver_Example
//
//  Created by wupeng on 2021/2/5.
//  Copyright © 2021 823105162@qq.com. All rights reserved.
//

#import "WPView.h"
#import "NSObject+WPObserver.h"
#import "WPButtonFactory.h"
@implementation WPView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton * notifyBtn = [WPButtonFactory createButton:@"通知" frame:CGRectMake(100, 250, 100, 40)];
        [self addSubview:notifyBtn];
        [notifyBtn addTarget:self action:@selector(notifyBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)notifyBtnAction:(UIButton *)button{
    [self wp_notifyObserverWithAction:@selector(update), nil];
    [self wp_notifyObserverWithAction:@selector(update:), 1,nil];
    [self wp_notifyObserverWithAction:@selector(update:count2:), 1,2,nil];
}

- (void)dealloc{
    NSLog(@"WPView dealloc");
}



@end
