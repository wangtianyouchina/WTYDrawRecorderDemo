//
//  WTYBaseTool.h
//  WTYDrawRecorderDemo
//
//  Created by 王天佑 on 2017/7/27.
//  Copyright © 2017年 wang.tianyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface WTYBaseTool : NSObject
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
-(void)drawRect:(CGRect)rect context:(CGContextRef)context;

@end
