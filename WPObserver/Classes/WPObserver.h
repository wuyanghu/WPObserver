//
//  WPObserver.h
//  WPObserver
//
//  Created by wupeng on 2021/11/12.
//

#import <Foundation/Foundation.h>
#import "WPProxy.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^WPObserverBlock)(id target);

@interface WPObserver : NSObject

//默认主队列
- (void)addObserver:(id)observer;
- (void)addObserver:(id)observer delegateQueue:(dispatch_queue_t)queue;

//移除:观察者对象释放，默认不用移除；不想监听时可调用此方法移除;监听单例需要移除。
//考虑到观察者数量不会太大，直接使用数组方法移除
- (void)removeObserver:(id)observer;

//selector:校验target是否响应selector方法
- (void)notifyObserver:(WPObserverBlock)observerBlock selector:(SEL)aSelector;
@end

NS_ASSUME_NONNULL_END
