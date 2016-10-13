//
//  NotiferController.m
//  testNSLog
//
//  Created by yu-yanase on 2016/07/01.
//  Copyright © 2016年 yu-yanase. All rights reserved.
//

#import <UserNotifications/UserNotifications.h>
#import "NotiferController.h"

@interface NotiferController ()<UNUserNotificationCenterDelegate>

@end

@implementation NotiferController
- (instancetype)init
{
    self = [super init];
    if (self) {
        [[UNUserNotificationCenter currentNotificationCenter] requestAuthorizationWithOptions:(UNAuthorizationOptionBadge |
                                                                                               UNAuthorizationOptionSound |
                                                                                               UNAuthorizationOptionAlert )
                                                                            completionHandler:^(BOOL granted, NSError * _Nullable error) {
                                                                                
                                                                                if (granted) {
                                                                                    // APNSはここで設定するの？
                                                                                }
                                                                            }];
        
        [UNUserNotificationCenter currentNotificationCenter].delegate = self;
        
    }
    return self;
}

- (void)notiferRequestFiveSecond {
    UNMutableNotificationContent* content = [[UNMutableNotificationContent alloc] init];
    content.title    = [NSString localizedUserNotificationStringForKey:@"Hello!"
                                                             arguments:nil];
    content.body     = [NSString localizedUserNotificationStringForKey:@"Hello_message_body"
                                                             arguments:nil];
    content.subtitle = [NSString localizedUserNotificationStringForKey:@"Hello_subtitle"
                                                             arguments:nil];
    content.sound    = [UNNotificationSound defaultSound];
    
    // Deliver the notification in five seconds.
    UNTimeIntervalNotificationTrigger* trigger = [UNTimeIntervalNotificationTrigger
                                                  triggerWithTimeInterval:5
                                                  repeats:NO];
    UNNotificationRequest* request = [UNNotificationRequest requestWithIdentifier:@"FiveSecond"
                                                                          content:content
                                                                          trigger:trigger];
    
    // Schedule the notification.
    UNUserNotificationCenter* center = [UNUserNotificationCenter currentNotificationCenter];
    [center addNotificationRequest:request
             withCompletionHandler:^(NSError * _Nullable error) {
        if (!error) {
            NSLog(@"notifer request sucess");
        }
    }];
}

#pragma mark - Notifer delegate
// アプリがフォアグランドの時表示前に呼ばれる
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    // アプリがフォアグランドにいた場合の通知動作を指定する。
    completionHandler(UNNotificationPresentationOptionBadge |
                      UNNotificationPresentationOptionSound |
                      UNNotificationPresentationOptionAlert);
};

// Notiferをタッチした時呼ばれる
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(void (^)())completionHandler {
    // タッチした時の処理
    NSLog(@"Touch Notifer");
    
    // 終了
    completionHandler();
}

@end
