//
//  AppDelegate.m
//  SBTTask
//
//  Created by Isa Aliev on 21.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "AppDelegate.h"
#import "PaymentDetailsController.h"
#import "Payment.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    Payment *payment = [Payment dummyPayment];

    PaymentDetailsViewModel *viewModel = [[PaymentDetailsViewModel alloc] initWithPayment:payment];
    
    PaymentDetailsController *paymentController = [[PaymentDetailsController alloc]
                                                   initWithViewModel: viewModel];
    UINavigationController *navigationController = [[UINavigationController alloc]
                                                    initWithRootViewController: paymentController];
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    self.window = [[UIWindow alloc] initWithFrame: screenBounds];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    application.statusBarStyle = UIStatusBarStyleLightContent;
    
    return YES;
}

@end
