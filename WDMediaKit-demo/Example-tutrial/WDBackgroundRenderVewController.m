//
//  WDBackgroundRenderVewController.m
//  WDMediaKit-demo
//
//  Created by 祁云 on 2020/8/21.
//  Copyright © 2020 祁云. All rights reserved.
//

#import "WDBackgroundRenderVewController.h"
#import <WDMediaKit/WDMeidaExportManager.h>

@interface WDBackgroundRenderVewController ()

@property (strong, nonatomic) WDMeidaExportManager *exportManager;
@end

@implementation WDBackgroundRenderVewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *file = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"mp4"];

    
    self.exportManager = [[WDMeidaExportManager alloc] initWithMediaURL:[NSURL fileURLWithPath:file]];
    
    [self.exportManager startExportWithProgressHanlder:^(float progress) {
        NSLog(@"------------->>  处理进度  =  %.2f", progress);
    }];
}



@end
