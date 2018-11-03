//
//  AppDelegate.m
//  本地通知
//
//  Created by Sunweisheng on 2018/11/3.
//  Copyright © 2018年 Sunweisheng. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //ios 8之后必须配置信息才可以 发送推送 必须用户同意
    //判断用户系统版本号
    if ([[[UIDevice currentDevice] systemVersion] doubleValue] > 8.0)
    {
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert
                                                                                                                                                        
                                                                                                                                                        categories:nil];
        [application registerUserNotificationSettings:settings];
    }
    
    //跳转代码
    //针对程序退出时的情况
    if (launchOptions[UIApplicationLaunchOptionsLocalNotificationKey]) {//取字典的方法 直接加[];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 1001, 100, 100)];
        label.backgroundColor = [UIColor blueColor];
        [self.window.rootViewController.view addSubview:label];
    }
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
//跳转到固定的界面 APPdelegate中做
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSLog(@"_________");
    //一般用到单例控制器
    
    //专门处理本地通知进来后的操作
    if (application.applicationState == UIApplicationStateInactive)
    {
        //数字消失
        application.applicationIconBadgeNumber = 0;
        
        //程序退出 还起不起作用
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        label.backgroundColor = [UIColor blueColor];
        [self.window.rootViewController.view addSubview:label];
    }
}
@end
