//
//  main.m
//  task
//
//  Created by huangqizai on 2018/5/28.
//  Copyright © 2018年 FYCK. All rights reserved.
//

#import <Cocoa/Cocoa.h>

int main(int argc, const char * argv[]) {
    
    
    if (argc == 2) { NSLog(@"AuthHelperTool executing self-repair"); OSStatus myStatus; AuthorizationFlags myFlags = kAuthorizationFlagDefaults; AuthorizationRef myAuthorizationRef; myStatus = AuthorizationCreate(NULL, kAuthorizationEmptyEnvironment, myFlags, &myAuthorizationRef); if (myStatus != errAuthorizationSuccess) return myStatus; AuthorizationItem myItems = {kAuthorizationRightExecute, 0, NULL, 0}; AuthorizationRights myRights = {1, &myItems}; myFlags = kAuthorizationFlagDefaults | kAuthorizationFlagInteractionAllowed | kAuthorizationFlagPreAuthorize | kAuthorizationFlagExtendRights; myStatus = AuthorizationCopyRights (myAuthorizationRef, &myRights, NULL, myFlags, NULL ); if (myStatus != errAuthorizationSuccess) return myStatus; char *myToolPath = argv[1]; char *myArguments[] = {argv[1], "--fix", NULL}; FILE *myCommunicationsPipe = NULL; myFlags = kAuthorizationFlagDefaults; //这句是获取管理员权限的代码 myStatus = AuthorizationExecuteWithPrivileges(myAuthorizationRef, myToolPath, myFlags, myArguments, &myCommunicationsPipe); return 0; } else if (argc == 3){ NSString *output = @""; NSString *error= @""; runProcessAsAdministrator(@"", [NSArray arrayWithObjects:@"launchctl", @"unload", @"/Library/LaunchAgents/com.******.******.plist",nil],false, &output, &error); runProcessAsAdministrator(@"", [NSArray arrayWithObjects:@"launchctl", @"unload", @"/Library/LaunchDaemons/com.******.******.Daemon.plist",nil], true, &output, &error);
    }
        
        return NSApplicationMain(argc, argv);
  
}
