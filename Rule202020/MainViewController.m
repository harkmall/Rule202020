//
//  MainViewController.m
//  Rule202020
//
//  Created by Mark Hall on 2015-12-15.
//  Copyright © 2015 Mark Hall. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (weak) IBOutlet NSTextField *timerLabel;
@property (nonatomic, assign) NSInteger time;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSTimer *lookAwayTimer;

@end

#define TIME 1200

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)startPressed:(id)sender
{
    self.time = TIME;

    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                                  target:self
                                                selector:@selector(subtractTime)
                                                userInfo:nil
                                                 repeats:YES];
}

- (IBAction)stopPressed:(id)sender
{
    [self.timer invalidate];
    [self.lookAwayTimer invalidate];
    self.time = TIME;
    [self setLabelTime];
}

- (IBAction)quitPressed:(id)sender
{
    [NSApp terminate:self];
}
- (IBAction)helpPressed:(id)sender
{
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:@"http://visianinfo.com/the-20-20-20-rule-preventing-digital-eye-strain/"]];
}

- (void)subtractTime
{
    self.time--;
    if (self.time == 0) {
        [self showNotification];
        [self.timer invalidate];
        self.time = TIME;
        [self setLabelTime];
        self.lookAwayTimer = [NSTimer scheduledTimerWithTimeInterval:20.0f target:self selector:@selector(startPressed:) userInfo:nil repeats:NO];
        return;
    }
    [self setLabelTime];
}

- (void)setLabelTime
{
    NSInteger mins = self.time / 60;
    NSInteger seconds = self.time - mins * 60;
    [self.timerLabel setStringValue:[NSString stringWithFormat:@"%02ld:%02ld", (long)mins, (long)seconds]];
}

- (void)showNotification
{
    NSUserNotification *notification = [[NSUserNotification alloc] init];
    notification.title = @"Take a break!";
    notification.informativeText = @"Look at something 20 feet away, for 20 seconds.";
    notification.soundName = NSUserNotificationDefaultSoundName;

    [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification:notification];
}

@end
