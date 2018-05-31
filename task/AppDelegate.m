//
//  AppDelegate.m
//  task
//
//  Created by huangqizai on 2018/5/28.
//  Copyright © 2018年 FYCK. All rights reserved.
//

#import "AppDelegate.h"
#import "UserManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    

    //开启task
    [[UserManager sharedManager] startTask];
    
}




- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
