//
//  WPObserver.m
//  WPObserver
//
//  Created by wupeng on 2021/11/12.
//

#import "WPObserver.h"
#import "WPProxy.h"

@interface WPObserver()
@property(nonatomic, strong) NSMutableArray<WPProxy *> * proxyObservers;
@property(nonatomic,strong) dispatch_semaphore_t semaphore_t;
@end

@implementation WPObserver

- (instancetype)init{
    self = [super init];
    if (self) {
        _proxyObservers = [NSMutableArray new];
        _semaphore_t = dispatch_semaphore_create(1);
    }
    return self;
}

#pragma mark - 添加移除观察者

- (void)addObserver:(id)observer{
    dispatch_semaphore_wait(self.semaphore_t, DISPATCH_TIME_FOREVER);
    [self.proxyObservers addObject:[WPProxy proxyWithTarget:observer]];
    dispatch_semaphore_signal(self.semaphore_t);
}

- (void)addObserver:(id)observer delegateQueue:(dispatch_queue_t)queue_t{
    dispatch_semaphore_wait(self.semaphore_t, DISPATCH_TIME_FOREVER);
    [self.proxyObservers addObject:[WPProxy proxyWithTarget:observer queue_t:queue_t]];
    dispatch_semaphore_signal(self.semaphore_t);
}

- (void)removeObserver:(id)observer{
    if (!observer) {
        return;
    }
    dispatch_semaphore_wait(self.semaphore_t, DISPATCH_TIME_FOREVER);

    NSMutableArray * delObservers = [[NSMutableArray alloc] init];
    for (WPProxy * proxy in self.proxyObservers.copy) {
        if (proxy.target == observer || !proxy.target) {
            [delObservers addObject:proxy];
        }
    }
    
    [self.proxyObservers removeObjectsInArray:delObservers];
    dispatch_semaphore_signal(self.semaphore_t);
}

- (void)notifyObserver:(WPObserverBlock)observerBlock selector:(SEL)aSelector{
    dispatch_semaphore_wait(self.semaphore_t, DISPATCH_TIME_FOREVER);

    for (WPProxy * proxy in self.proxyObservers) {
        if (!proxy.target) {
            NSLog(@"target为空");
            dispatch_semaphore_signal(self.semaphore_t);
            return;
        }
        NSObject * target = proxy.target;
        if (![target respondsToSelector:aSelector]) {
            NSLog(@"%@-%@不能响应",NSStringFromClass(target.class),NSStringFromSelector(aSelector));
            dispatch_semaphore_signal(self.semaphore_t);
            return;
        }
        if (proxy.queue_t == NULL) {
            if (observerBlock) {
                observerBlock(proxy.target);
            }
        }else{
            dispatch_async(proxy.queue_t, ^{
                observerBlock(proxy.target);
            });
        }
    }
    
    dispatch_semaphore_signal(self.semaphore_t);
}

@end
