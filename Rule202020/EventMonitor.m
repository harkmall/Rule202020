//
//  EventMonitor.m
//  Rule202020
//
//  Created by Mark Hall on 2015-12-16.
//  Copyright © 2015 Mark Hall. All rights reserved.
//

#import "EventMonitor.h"

@interface EventMonitor ()

@property (nonatomic, strong) id monitor;
@property (nonatomic, assign) NSEventMask mask;
@property (nonatomic, strong) void (^handler)(NSEvent *);

@end

@implementation EventMonitor

- (id)initWithMask:(NSEventMask)mask handler:(void (^)(NSEvent *))handler

{
    self = [super init];
    if (self) {
        _mask = mask;
        _handler = handler;
    }
    return self;
}

- (void)start
{
    self.monitor = [NSEvent addGlobalMonitorForEventsMatchingMask:self.mask handler:self.handler];
}

- (void)stop
{
    if (self.monitor != nil) {
        [NSEvent removeMonitor:self.monitor];
        self.monitor = nil;
    }
}

@end
