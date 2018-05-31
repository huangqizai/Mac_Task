//
//  UserManager.m
//  Kinema-IOS
//
//  Created by huangqizai on 2018/3/14.
//  Copyright © 2018年 FYCK. All rights reserved.
//

#import "UserManager.h"

@implementation UserManager

static id _instance;
//重写allocWithZone:方法，在这里创建唯一的实例(注意线程安全)
+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    @synchronized(self) {
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
        }
    }
    return _instance;
}

+ (instancetype)sharedManager
{
    @synchronized(self){
        if(_instance == nil){
            _instance = [[self alloc] init];
        }
    }
    return _instance;
}

-(id)copyWithZone:(struct _NSZone *)zone
{
    return _instance;
}

//开始task
- (void)startTask
{
    //开启线程 执行可执行文件
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        [self startExecuteShellCommand:@"/Users/huangqizai/Desktop/task/task/hello" parameter:nil];
    });
}

//停止task
- (void)terminatask
{
    [self.task terminate];
}

//暂停task
- (void)suspendTask
{
    [self.task suspend];
}

//恢复task
- (void)resumeTask
{
    [self.task resume];
}

- (void)startExecuteShellCommand:(NSString *)cmd parameter:(NSArray *)parameter
{
    self.task = [[NSTask alloc] init];
    
    
    //    [task setLaunchPath:@"/bin/bash"];
    //    [task setArguments:@[@"-c",cmd]];
    
    [self.task setLaunchPath:cmd];//可执行文件路径
    //    [task setArguments:parameter];//参数
    
    [self.task launch];//启动task
    //    [task waitUntilExit];//直到程序运行结束，相应程序才会往下执行
    //    resume//恢复task
    //    suspend//暂停task
    //    running//是否在运行中
    
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        [task suspend];
    //    });
    
    
    //    NSPipe *outputPipe = [NSPipe pipe];
    //    [task setStandardOutput:outputPipe];
    //    [task setStandardError:outputPipe];
    //    NSFileHandle *readHandle = [outputPipe fileHandleForReading];
    //
    //    NSData *outputData = [readHandle readDataToEndOfFile];
    //    NSString *outputString = [[NSString alloc] initWithData:outputData encoding:NSUTF8StringEncoding];
    //    NSLog(@"%@",outputString);
}



@end
