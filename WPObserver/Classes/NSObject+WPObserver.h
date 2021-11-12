//
//  NSObject+WPObserver.h
//  BLing
//
//  Created by wupeng on 2021/2/5.
//  Copyright © 2021 baifendian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WPObserverModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (WPObserver)
@property(nonatomic, strong,readonly) NSMutableArray * wp_observers;

//默认主队列
- (void)wp_addObserver:(id)observer;
- (void)wp_addObserver:(id)observer delegateQueue:(dispatch_queue_t)queue;

- (void)wp_notifyObserverWithAction:(SEL)action,...NS_REQUIRES_NIL_TERMINATION;//可变参数

//移除:观察者对象释放，默认不用移除；不想监听时可调用此方法移除;监听单例需要移除。
//考虑到观察者数量不会太大，直接使用数组方法移除
- (void)wp_removeObserver:(id)observer;
@end

NS_ASSUME_NONNULL_END
