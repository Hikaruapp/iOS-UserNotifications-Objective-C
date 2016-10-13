//
//  NotiferiOS9Controller.m
//  testNSLog
//
//  Created by yu-yanase on 2016/10/04.
//  Copyright © 2016年 yu-yanase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NotiferiOS9Controller.h"

@implementation NotiferiOS9Controller

- (void)notiferRequestFiveSecondiOS9 {
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    
    // ios 8/9
    // 許可をもらう通知タイプの種類を定義
    UIUserNotificationType types = UIUserNotificationTypeBadge | // アイコンバッチ
    UIUserNotificationTypeSound | // サウンド
    UIUserNotificationTypeAlert;  // テキスト
    // UIUserNotificationSettingsの生成
    UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types
                                                                               categories:nil];
    // アプリケーションに登録
    [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
    
    // iOS 8/9
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:(5)];
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.alertBody = @"5sec経過しました。";
    notification.soundName = UILocalNotificationDefaultSoundName;
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
#pragma clang diagnostic pop
    
}

@end
