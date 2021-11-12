//
//  WPProxy.m
//  WPObserver
//
//  Created by wupeng on 2021/11/12.
//

#import "WPProxy.h"

@implementation WPProxy

- (instancetype)initWithTarget:(id)target queue_t:(dispatch_queue_t)queue_t{
    _target = target;
    _queue_t = queue_t;
    return self;
}

+ (instancetype)proxyWithTarget:(id)target {
    return [[WPProxy alloc] initWithTarget:target queue_t:NULL];
}

+ (instancetype)proxyWithTarget:(id)target queue_t:(dispatch_queue_t)queue_t{
    return [[WPProxy alloc] initWithTarget:target queue_t:queue_t];
}

- (id)forwardingTargetForSelector:(SEL)selector {
    return _target;
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    void *null = NULL;
    [invocation setReturnValue:&null];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector {
    return [NSObject instanceMethodSignatureForSelector:@selector(init)];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    return [_target respondsToSelector:aSelector];
}

- (BOOL)isEqual:(id)object {
    return [_target isEqual:object];
}

- (NSUInteger)hash {
    return [_target hash];
}

- (Class)superclass {
    return [_target superclass];
}

- (Class)class {
    return [_target class];
}

- (BOOL)isKindOfClass:(Class)aClass {
    return [_target isKindOfClass:aClass];
}

- (BOOL)isMemberOfClass:(Class)aClass {
    return [_target isMemberOfClass:aClass];
}

- (BOOL)conformsToProtocol:(Protocol *)aProtocol {
    return [_target conformsToProtocol:aProtocol];
}

- (BOOL)isProxy {
    return YES;
}

- (NSString *)description {
    return [_target description];
}

- (NSString *)debugDescription {
    return [_target debugDescription];
}

@end
