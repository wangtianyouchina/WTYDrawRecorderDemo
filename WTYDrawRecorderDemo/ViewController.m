//
//  ViewController.m
//  WTYDrawRecorderDemo
//
//  Created by 王天佑 on 2017/7/26.
//  Copyright © 2017年 wang.tianyou. All rights reserved.
//

#import "ViewController.h"
#import "LuWeiKeVideo.pbobjc.h"
#import "WTYDrawingBoardView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SMPPackageData *root = [[SMPPackageData alloc] init];
    root.pageStartIndex = 10;
    root.imageIdmax = 10;
    root.totalTime = 1;
    NSLog(@"---%d",root.pageStartIndex);
    NSData *data = [root data];
    NSError *error = nil;
    SMPPackageData *pageData = [SMPPackageData parseFromData:data error:&error];
    if (error) {
        NSLog(@"%@",error);
    }
    NSLog(@"====%d",pageData.pageStartIndex);
    WTYDrawingBoardView *boardView = [[WTYDrawingBoardView alloc] initWithFrame:CGRectMake(0, 40, 300, 300)];
    [self.view addSubview:boardView];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
