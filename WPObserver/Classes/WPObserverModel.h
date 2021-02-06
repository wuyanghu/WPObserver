//
//  WPObserverModel.h
//  WPObserver
//
//  Created by wupeng on 2021/2/6.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WPObserverModel : NSObject
@property(nonatomic, weak,readonly) id observer;
@property(nonatomic, strong,readonly) dispatch_queue_t queue_t;

- (instancetype)initWithObserver:(id)observer;
- (instancetype)initWithObserver:(id)observer queue_t:(dispatch_queue_t)queue_t;
@end

NS_ASSUME_NONNULL_END
