//
//  WTYCommandPen.h
//  WTYDrawRecorderDemo
//
//  Created by 王天佑 on 2017/7/27.
//  Copyright © 2017年 wang.tianyou. All rights reserved.
//

#import "WTYBaseCommand.h"
#import "LuWeiKeVideo.pbobjc.h"
#import <UIKit/UIKit.h>
@interface WTYCommandPen : WTYBaseCommand
@property(nonatomic,strong) SMPGraphics *gs;
@property(nonatomic,strong) UIView *view;
@end
