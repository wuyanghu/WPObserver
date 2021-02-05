//
//  WPViewObserver1.m
//  WPObserver_Example
//
//  Created by wupeng on 2021/2/5.
//  Copyright © 2021 823105162@qq.com. All rights reserved.
//

#import "WPViewObserver.h"

@implementation WPViewObserver

- (void)update{
    NSLog(@"update");
}

- (void)update:(NSInteger)count{
    NSLog(@"update %ld",count);
}

- (void)update:(NSInteger)count count2:(NSInteger)count2{
    NSLog(@"update %ld,%ld",count,count2);
}

@end
