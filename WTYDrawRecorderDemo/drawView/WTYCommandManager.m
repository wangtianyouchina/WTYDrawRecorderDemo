//
//  WTYCommandManager.m
//  WTYDrawRecorderDemo
//
//  Created by 王天佑 on 2017/7/27.
//  Copyright © 2017年 wang.tianyou. All rights reserved.
//

#import "WTYCommandManager.h"
@interface WTYCommandManager()
@property(nonatomic,strong) NSMutableArray *undoCommandArray;
@property(nonatomic,strong) NSMutableArray *redoCommandArray;

@end
static WTYCommandManager *instance;
@implementation WTYCommandManager
+(instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[WTYCommandManager alloc] init];
    });
    return instance;
}
@end
