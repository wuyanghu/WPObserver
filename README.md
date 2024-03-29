# WPObserver

[![CI Status](https://img.shields.io/travis/823105162@qq.com/WPObserver.svg?style=flat)](https://travis-ci.org/823105162@qq.com/WPObserver)
[![Version](https://img.shields.io/cocoapods/v/WPObserver.svg?style=flat)](https://cocoapods.org/pods/WPObserver)
[![License](https://img.shields.io/cocoapods/l/WPObserver.svg?style=flat)](https://cocoapods.org/pods/WPObserver)
[![Platform](https://img.shields.io/cocoapods/p/WPObserver.svg?style=flat)](https://cocoapods.org/pods/WPObserver)

# 描述:[git仓库](https://github.com/wuyanghu/WPObserver)
iOS delegate、block属于一对一的模式。
有时候需要实现一对多的需求，通知可以实现。但有时候业务关联是很紧密的，通知的可读性不是很好。

项目中目前使用的是GCDMulticastDelegate,发现其有几个缺点:
1. GCDMulticastDelegate中都是在消息转发中进行消息调用，消息转发在iOS中代价比较高。
2. 其消息调用都是异步提交到队列，导致堆栈信息无法跟踪。
3. 库也比较老了，偶现闪退。体验不是很好。
4. 使用起来不太方便，需要先定义multiDelegate,添加代理，不用需要移除，使用时还需要判断方法是否存在。
```
@property(nonatomic, strong) GCDMulticastDelegate <BLEnterpriseManagerDelegate> *multiDelegate;

- (instancetype)init {
    if (self = [super init]) {
        self.multiDelegate = (GCDMulticastDelegate <BLEnterpriseManagerDelegate> *) [[GCDMulticastDelegate alloc] init];
    }
    return self;
}

- (void)addDelegate:(id <BLEnterpriseManagerDelegate>)delegate delegateQueue:(dispatch_queue_t)queue {
    [_multiDelegate addDelegate:delegate delegateQueue:queue];
}

- (void)removeDelegate:(id <BLEnterpriseManagerDelegate>)delegate {
    [_multiDelegate removeDelegate:delegate];
}

if ([self.multiDelegate hasDelegateThatRespondsToSelector:@selector(enterpriseManager:didClearAllOrgs:)]) {
    [self.multiDelegate enterpriseManager:self didClearAllOrgs:YES];
}
```

# 思考
一对多就是观察者模式的使用,完全可以自己实现。

1. 观察者使用封装在了NSObject扩展中，任何对象都可以添加观察者对象。不再需要在被观察者中声明什么。
2. 消息调用使用了NSInvocation，不走消息转发。
3. 如果不设置队列，默认都回到主线程；也可指定队列。
4. 方法不存在，不需要外部判断。内部打印错误日志，注意观察。

# 方案一
##使用
1. 导入头文件
\#import "NSObject+BLObserver.h"
2. 添加观察者
```
[_customView wp_addObserver:self];
    
    _observer1 = [WPViewObserver new];
    _observer1.title = @"observer1 ";
    [_customView wp_addObserver:_observer1];
    
    _observer2 = [WPViewObserver new];
    _observer2.title = @"observer2 ";
    [_customView wp_addObserver:_observer2 delegateQueue:dispatch_queue_create("observer2", DISPATCH_QUEUE_SERIAL)];//指定队列
```
3. 被观察者通知观察者:带参数调用
```
    [self wp_notifyObserverWithAction:@selector(update), nil];
    [self wp_notifyObserverWithAction:@selector(update:), 1,nil];
    [self wp_notifyObserverWithAction:@selector(update:count2:), 1,2,nil];
```
4. 观察者监听
```
- (void)update:(NSInteger)count{
    NSLog(@"detail update %ld",count);
}

- (void)update:(NSInteger)count count2:(NSInteger)count2{
    NSLog(@"detail update %ld,%ld",count,count2);
}
```
5. 退出页面后内存自动释放
```
2021-02-06 23:18:16.655618+0800 WPObserver_Example[58471:640255] WPDetailViewController dealloc
2021-02-06 23:18:16.656013+0800 WPObserver_Example[58471:640255] WPViewObserver dealloc observer2
2021-02-06 23:18:16.656214+0800 WPObserver_Example[58471:640255] WPViewObserver dealloc observer1
2021-02-06 23:18:16.656621+0800 WPObserver_Example[58471:640255] WPView dealloc
```

## 小结
1. 多数监听的或移除的时候都是在主线程，如果觉得线程不安全，也可以加个信号量。
2. 观察者模式使用简单，要考虑到通用性，多参问题。
3. 多参要考虑到int,double等基本类型。
4. weak不持有观察者，不需要释放。只管监听，和通知观察者。如果有特殊情况，不需要监听了，可以调用[wp_removeObserver]，移除监听;单例的监听者，需要手动移除。


# 方案二
以上方案可以实现通知，调用wp_notifyObserverWithAction:，不支持泛型。
方案二去掉多参，加上线程安全，支持泛型。

## 使用
1. 添加观察者
```
- (void)addObserver2{
    [_customView.proxyObserver addObserver:self];
    [_customView.proxyObserver addObserver:_observer1];
    [_customView.proxyObserver addObserver:_observer2 delegateQueue:dispatch_queue_create("observer2", DISPATCH_QUEUE_SERIAL)];//指定队列
}
```
2. 通知观察者，支持泛型
```
[self.proxyObserver notifyObserver:^(id<WPViewObserver>  _Nonnull target) {
    [target update];
} selector:@selector(update)];

[self.proxyObserver notifyObserver:^(id<WPViewObserver>  _Nonnull target) {
    [target update:1];
} selector:@selector(update:)];

[self.proxyObserver notifyObserver:^(id<WPViewObserver>  _Nonnull target) {
    [target update:1 count2:2];
} selector:@selector(update:count2:)];

[self.proxyObserver notifyObserver:^(id<WPViewObserver>  _Nonnull target) {
    [target updateTitle:@"标题" count:4];
} selector:@selector(updateTitle:count:)];
```



## Installation

WPObserver is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'WPObserver'
```

## Author

823105162@qq.com, 823105162@qq.com

## License

WPObserver is available under the MIT license. See the LICENSE file for more info.
