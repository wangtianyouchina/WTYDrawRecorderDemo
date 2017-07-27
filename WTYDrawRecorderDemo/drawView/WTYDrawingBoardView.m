//
//  WTYDrawingBoardView.m
//  WTYDrawRecorderDemo
//
//  Created by 王天佑 on 2017/7/27.
//  Copyright © 2017年 wang.tianyou. All rights reserved.
//

#import "WTYDrawingBoardView.h"
#import "WTYBaseTool.h"
#import "WTYPenTool.h"
#import "WTYDrawingCanvasView.h"
enum {
    WTYDrawingBoardTypeNormal,
    WTYDrawingBoardTypeEdit,
    WTYDrawingBoardTypeMove,
    WTYDrawingBoardTypeZoom,
    
}WTYDrawingType;
@interface WTYDrawingBoardView()


@property(nonatomic,assign) NSInteger *drawingType;
@property(nonatomic,strong) WTYDrawingCanvasView *canvasView;
@property(nonatomic,strong) WTYPenTool *pentool;
@end

@implementation WTYDrawingBoardView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.canvasView = [[WTYDrawingCanvasView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:self.canvasView];
    }
    return self;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.drawingType = WTYDrawingBoardTypeEdit;
        
    }
    return self;
}

-(WTYBaseTool *)currentTool {
    if (_pentool) {
        return _pentool;
    }
    
    _pentool = [[WTYPenTool alloc] init];
    _pentool.view = self.canvasView;
    self.canvasView.tool = _pentool;;
    return _pentool;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    WTYBaseTool *baseTool = self.currentTool;
    [baseTool touchesBegan:touches withEvent:event];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    WTYBaseTool *baseTool = self.currentTool;
    [baseTool touchesMoved:touches withEvent:event];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    WTYBaseTool *baseTool = self.currentTool;
    [baseTool touchesEnded:touches withEvent:event];
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    WTYBaseTool *baseTool = self.currentTool;
    [baseTool touchesCancelled:touches withEvent:event];
}

@end
