//
//  WPObserverModel.m
//  WPObserver
//
//  Created by wupeng on 2021/2/6.
//

#import "WPObserverModel.h"

@implementation WPObserverModel

- (instancetype)initWithObserver:(id)observer{
    self = [super init];
    if (self) {
        _observer = observer;
    }
    return self;
}

- (instancetype)initWithObserver:(id)observer queue_t:(dispatch_queue_t)queue_t{
    self = [super init];
    if (self) {
        _observer = observer;
        _queue_t = queue_t;
    }
    return self;
}

@end
