//
//  NSObject+WPObserver.h
//  BLing
//
//  Created by wupeng on 2021/2/5.
//  Copyright © 2021 baifendian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (WPObserver)
@property(nonatomic, strong,readonly) NSPointerArray * wp_observers;
@property(nonatomic, strong,readonly) dispatch_queue_t wp_delegateQueue;

//默认主队列
- (void)wp_addObserver:(id)delegate;
- (void)wp_addObserver:(id)delegate delegateQueue:(dispatch_queue_t)queue;

- (void)wp_notifyObserverWithAction:(SEL)action,...NS_REQUIRES_NIL_TERMINATION;//可变参数

@end

NS_ASSUME_NONNULL_END
