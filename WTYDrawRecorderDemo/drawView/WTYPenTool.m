//
//  WTYPenTool.m
//  WTYDrawRecorderDemo
//
//  Created by 王天佑 on 2017/7/27.
//  Copyright © 2017年 wang.tianyou. All rights reserved.
//

#import "WTYPenTool.h"
#import <UIKit/UIKit.h>
#import "LuWeiKeVideo.pbobjc.h"
#import "WTYCommandPen.h"
@interface WTYPenTool()
@property(nonatomic,strong)         SMPGraphics *graph;
@property(nonatomic,strong) WTYCommandPen *commond;
@end
@implementation WTYPenTool

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    
    int32_t curTime=0;//[self currentRecordTime];
 
    UITouch* touch=[touches anyObject];

    
    SMPGraphics* gs= [SMPGraphics message];
    WTYCommandPen *command = [[WTYCommandPen alloc] init];
    self.commond = command;
    command.gs = gs;
    command.view = self.view;
    
    self.graph = gs;
    SMPGraphics_TouchCurves *touchCures = [SMPGraphics_TouchCurves message];
    CGPoint pt=[touch locationInView:self.view];

    touchCures.x = pt.x;
    touchCures.y = pt.y;
    touchCures.time = 0;
    NSMutableArray *mutarray = [@[] mutableCopy];
    [mutarray addObject:touchCures];
    gs.touchCurvesArray = mutarray;
    [command execute];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    UITouch* touch=[touches anyObject];

    SMPGraphics_TouchCurves *touchCures = [SMPGraphics_TouchCurves message];
    CGPoint pt=[touch locationInView:self.view];
    
    touchCures.x = pt.x;
    touchCures.y = pt.y;
    touchCures.time = 0;
    [self.graph.touchCurvesArray addObject:touchCures];
    [self.commond execute];

}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch* touch=[touches anyObject];
    
    SMPGraphics_TouchCurves *touchCures = [SMPGraphics_TouchCurves message];
    CGPoint pt=[touch locationInView:self.view];
    
    touchCures.x = pt.x;
    touchCures.y = pt.y;
    touchCures.time = 0;
    [self.graph.touchCurvesArray addObject:touchCures];
    [self.commond execute];
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

-(void)drawRect:(CGRect)rect context:(CGContextRef)context {
    
    
    SMPGraphics_TouchCurves* obj=[self.graph.touchCurvesArray firstObject];
    
    CGContextSetLineWidth(context, 20);
    CGContextBeginPath(context);
    
//    CGContextSetRGBStrokeColor(context, 1, 1, 1, 1);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    //*//不用曲线
    CGContextMoveToPoint(context, obj.x, obj.y);
    
    SMPGraphics_TouchCurves* lastobj=[self.graph.touchCurvesArray lastObject];
//    for (int i=1; i<[self.graph.touchCurvesArray count]; i++) {
//        obj=[_touchCurves objectAtIndex:i];
//        if (obj.time<=curTime) {
//            lastobj = obj;
//        }
//        else {
//            break;
//        }
//    }
    CGContextAddLineToPoint(context, lastobj.x, lastobj.y);
    

    
    CGContextStrokePath(context);

}

@end
