//
//  TKModule+Mock.m
//  TKMRechargeModule
//
//  Created by Thief Toki on 2021/3/26.
//

#import <TKModule/TKModule.h>

#import <TKMInfoManager/TKMInfoManager.h>
#import <TKMAccountModule/TKMAccountModule.h>

@implementation TKModule (Mock)

- (void)showRechargeView {
    [TKMAccountInfoManager shared].money = 10;
    
    [[TKModule shared] showInfoView];
}

@end
