//
//  WPProxy.h
//  WPObserver
//
//  Created by wupeng on 2021/11/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WPProxy : NSProxy
@property (nullable, nonatomic, weak, readonly) id target;
@property(nonatomic, strong,readonly) dispatch_queue_t queue_t;

- (instancetype)initWithTarget:(id)target queue_t:(dispatch_queue_t)queue_t;
+ (instancetype)proxyWithTarget:(id)target;
+ (instancetype)proxyWithTarget:(id)target queue_t:(dispatch_queue_t)queue_t;

@end

NS_ASSUME_NONNULL_END
