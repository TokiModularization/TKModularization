//
//  ViewController.m
//  TKModularization
//
//  Created by Thief Toki on 2021/3/26.
//

#import "ViewController.h"

#import <TKMInitializeModule/TKMInitializeModule.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [[TKModule shared] initializeWithEnvironment:0];
}

@end
