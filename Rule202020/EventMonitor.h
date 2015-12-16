//
//  EventMonitor.h
//  Rule202020
//
//  Created by Mark Hall on 2015-12-16.
//  Copyright © 2015 Mark Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
@import AppKit;

@interface EventMonitor : NSObject

- (id)initWithMask:(NSEventMask)mask handler:(void (^)(NSEvent *))handler;
- (void)start;
- (void)stop;

@end
