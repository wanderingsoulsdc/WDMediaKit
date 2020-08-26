//
//  WDCaptureRecordViewController.m
//  WDMediaKit-demo
//
//  Created by 祁云 on 2020/8/21.
//  Copyright © 2020 祁云. All rights reserved.
//

#import "WDCaptureRecordViewController.h"
#import <WDMediaKit/WDMediaWriter.h>

@interface WDCaptureRecordViewController () <WDGLDelegate>

@property (strong, nonatomic) WDMediaWriter *mediaWriter;

@end

@implementation WDCaptureRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *outputFile = [self createTempFileWithFormat:@"mp4"];
    self.mediaWriter = [[WDMediaWriter alloc] initWithOutputURL:outputFile size:self.videoCapture.mCaptureParams.resoulution];
    
    self.textureProcessing.delegate = self;
    
    
    NSArray *titles = @[@"开始录制", @"结束录制"];
    [titles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setBackgroundColor:[UIColor whiteColor]];
        [button setFrame:CGRectMake(220 + (idx % 2) * 100, 120 + (idx / 2) * 60, 80, 30)];
        [button setTitle:obj forState:UIControlStateNormal];
        [button addTarget:self action:@selector(recordAction:) forControlEvents:UIControlEventTouchUpInside];
        [button setTag:idx + 10];
        [self.view addSubview:button];
    }];
}

- (void)videoCapture:(WDVideoCapture *)videoCapture captureOutput:(AVCaptureOutput *)output didOutputVideoSampleBuffer:(CMSampleBufferRef)sampleBuffer connection:(AVCaptureConnection *)connection {
    [super videoCapture:videoCapture captureOutput:output didOutputVideoSampleBuffer:sampleBuffer connection:connection];
    
}


- (void)gl_textureProcessing:(WDGLTextureProcessing *)processing didOutputPixelBuffer:(CVPixelBufferRef)pixelBuffer timestamp:(CMTime)ts {
    
    [self.mediaWriter writerInputPixelBuffer:pixelBuffer timestamp:ts];
}


- (void)gl_textureProcessing:(nonnull WDGLTextureProcessing *)processing occurError:(int)error {
    
}




- (void)recordAction:(UIButton *)sender {
    
    if (sender.tag == 10) {
        [self.mediaWriter startWriter];
    } else {
        [self.mediaWriter finishWriter];
    }
}


@end
