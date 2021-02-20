//
//  WPViewObserver1.m
//  WPObserver_Example
//
//  Created by wupeng on 2021/2/5.
//  Copyright © 2021 823105162@qq.com. All rights reserved.
//

#import "WPViewObserver.h"

@implementation WPViewObserver

- (void)pushDetailViewController{
    NSLog(@"WPViewObserver update %@",_title);
    [self printThreadName];
}

- (void)update:(NSInteger)count{
    NSLog(@"WPViewObserver update %ld,%@",count,_title);
    [self printThreadName];
}

- (void)update:(NSInteger)count count2:(NSInteger)count2{
    NSLog(@"WPViewObserver update %ld,%ld,%@",count,count2,_title);
    [self printThreadName];
}

- (void)updateTitle:(NSString *)title count:(NSInteger)count{
    NSLog(@"%@-%ld",title,count);
}

- (void)printThreadName{
    if (![NSThread isMainThread]) {
        NSLog(@"%@-%@",_title,[NSThread currentThread]);
    }
}

- (void)dealloc{
    NSLog(@"WPViewObserver dealloc %@",_title);
}

@end
