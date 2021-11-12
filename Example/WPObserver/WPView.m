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
#import "WPObserver.h"

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
//    [self wp_notifyObserverWithAction:@selector(update), nil];
//    [self wp_notifyObserverWithAction:@selector(update:), 1,nil];
//    [self wp_notifyObserverWithAction:@selector(update:count2:), 1,2,nil];
//    [self wp_notifyObserverWithAction:@selector(updateTitle:count:), @"1",3,nil];
//    [self wp_notifyObserverWithAction:@selector(updateTitle:count:), nil,4,nil];
    
    [self.proxyObserver notifyObserver:^(id<WPViewObserver>  _Nonnull target) {
        [target update];
    } selector:@selector(update)];
    
    [self.proxyObserver notifyObserver:^(id<WPViewObserver>  _Nonnull target) {
        [target update:1];
    } selector:@selector(update:)];
    
    [self.proxyObserver notifyObserver:^(id<WPViewObserver>  _Nonnull target) {
        [target update:1 count2:2];
    } selector:@selector(update:count2:)];
    
    [self.proxyObserver notifyObserver:^(id<WPViewObserver>  _Nonnull target) {
        [target updateTitle:@"标题" count:4];
    } selector:@selector(updateTitle:count:)];
}

- (void)dealloc{
    NSLog(@"WPView dealloc");
}



@end
