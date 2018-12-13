//
//  UIControl+Target.m
//  TransformDemo
//
//  Created by DJ on 2018/12/13.
//  Copyright © 2018年 MAC. All rights reserved.
//

#import "UIControl+Target.h"
#import <objc/runtime.h>

static const int _dj_block_key;

@interface DJUIControlBlockTarget : NSObject

@property (nonatomic, copy) void (^block) (id sender);
@property (nonatomic, assign) UIControlEvents events;

- (id)initWithBlock:(void (^)(id sender))block events:(UIControlEvents)events;
- (void)invoke:(id)sender;

@end

@implementation DJUIControlBlockTarget

- (id)initWithBlock:(void (^)(id))block events:(UIControlEvents)events {
    self = [super init];
    if (self) {
        _block = block;
        _events = events;
    }
    return self;
}

- (void)invoke:(id)sender {
    if (_block) {
        _block(sender);
    }
}

@end

@implementation UIControl (Target)

- (void)addTargetForControlEvents:(UIControlEvents)controlEvents block:(void (^)(id))block {
    if (!controlEvents) return;
    DJUIControlBlockTarget *target = [[DJUIControlBlockTarget alloc]
                                       initWithBlock:block events:controlEvents];
    [self addTarget:target action:@selector(invoke:) forControlEvents:controlEvents];
    NSMutableArray *targets = [self _dj_allUIControlBlockTargets];
    [targets addObject:target];
}

- (NSMutableArray *)_dj_allUIControlBlockTargets {
    NSMutableArray *targets = objc_getAssociatedObject(self, &_dj_block_key);
    if (!targets) {
        targets = [NSMutableArray array];
        objc_setAssociatedObject(self, &_dj_block_key, targets, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return targets;
}

@end
