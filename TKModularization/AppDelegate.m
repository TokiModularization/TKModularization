//
//  AppDelegate.m
//  TKModularization
//
//  Created by Thief Toki on 2021/3/26.
//

#import "AppDelegate.h"

#import <TKMInitializeModule/TKMInitializeModule.h>
#import <TKMAccountModule/TKMAccountModule.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

#pragma mark - openURL

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    SEL selector = NSSelectorFromString(url.scheme);
    
    if ([[TKModule shared] respondsToSelector:selector]) {
        IMP imp = [[TKModule shared] methodForSelector:selector];
        void (*func)(id, SEL) = (void *)imp;
        func([TKModule shared], selector);
    }
    return YES;
}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
