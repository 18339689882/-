//
//  ViewController.m
//  本地通知
//
//  Created by Sunweisheng on 2018/11/3.
//  Copyright © 2018年 Sunweisheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UILocalNotification *WSNoti = [[UILocalNotification alloc] init];
    WSNoti.fireDate = [NSDate dateWithTimeIntervalSinceNow:3.0];
    WSNoti.alertBody = @"该睡觉了";
    //锁屏后 描述
    WSNoti.alertAction = @"来找我吧";
    //默认声音
    WSNoti.soundName = UILocalNotificationDefaultSoundName;
    //自定义声音
    WSNoti.soundName = @"名字";
    //红色消失通知数字字样 固定的数字
    WSNoti.applicationIconBadgeNumber = 10;
    //让红色的字样消失 在APPdelegate中做属性设置为0
    //固定时间发一次
//    WSNoti.repeatInterval = NSCalendarUnitMinute;
    //启动图片 字符串随便写
    WSNoti.alertLaunchImage = @"33";
    
    //跳转到固定的界面 APPdelegate中做
    
    //给userinfo赋值，判断是哪个通知
    WSNoti.userInfo = @{@"type":@1};
    
    [[UIApplication sharedApplication] scheduleLocalNotification:WSNoti];
    //iOS 8.0 之后必须配置一些东西 必须用户同意才行。APPdelegate
}

@end
