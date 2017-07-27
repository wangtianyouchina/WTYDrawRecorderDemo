//
//  WTYBaseCommand.h
//  WTYDrawRecorderDemo
//
//  Created by 王天佑 on 2017/7/27.
//  Copyright © 2017年 wang.tianyou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WTYBaseCommand : NSObject
@property(nonatomic,strong) id model;
-(void)execute;
-(void)undo;
-(void)redo;
@end
