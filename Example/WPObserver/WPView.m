//
//  WPTextView.m
//  WPObserver_Example
//
//  Created by wupeng on 2021/2/5.
//  Copyright © 2021 823105162@qq.com. All rights reserved.
//

#import "WPView.h"
#import "NSObject+WPObserver.h"

@implementation WPView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"计数+1" forState:UIControlStateNormal];
        [self addSubview:button];
        
        button.frame = CGRectMake(100, 200, 100, 40);
        button.backgroundColor = [UIColor redColor];
        [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)clickAction:(UIButton *)button{
    [self wp_notifyObserverWithAction:@selector(update), nil];
    [self wp_notifyObserverWithAction:@selector(update:), 1,nil];
    [self wp_notifyObserverWithAction:@selector(update:count2:), 1,2,nil];
}

@end
