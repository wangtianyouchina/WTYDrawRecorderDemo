//
//  WTYDrawingCanvasView.m
//  WTYDrawRecorderDemo
//
//  Created by 王天佑 on 2017/7/27.
//  Copyright © 2017年 wang.tianyou. All rights reserved.
//

#import "WTYDrawingCanvasView.h"

@implementation WTYDrawingCanvasView


-(void)drawRect:(CGRect)rect {
//    [super drawRect:rect];
    [self.tool drawRect:rect context:UIGraphicsGetCurrentContext()];

}

@end
