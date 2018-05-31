//
//  UserManager.h
//  Kinema-IOS
//
//  Created by huangqizai on 2018/3/14.
//  Copyright © 2018年 FYCK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserManager : NSObject

@property (nonatomic, strong) NSTask *task;

//启动task
- (void)startTask;
//结束task
- (void)terminatask;
//暂停task
- (void)suspendTask;
//恢复任务
- (void)resumeTask;

//实例化该类
+ (instancetype)sharedManager;


@end
