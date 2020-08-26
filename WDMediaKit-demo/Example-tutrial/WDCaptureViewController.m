//
//  WDCaptureViewController.m
//  WDMediaKit-demo
//
//  Created by 祁云 on 2020/8/20.
//  Copyright © 2020 祁云. All rights reserved.
//

#import "WDCaptureViewController.h"


@interface WDCaptureViewController () 


@end

@implementation WDCaptureViewController


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    [self.view.layer addSublayer:self.videoCapture.previewLayer];
    [self.videoCapture startCapture];
}


- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [_videoCapture stopCapture];
    [_renderView removeFromSuperview];
    _renderView = nil;
}


- (void)viewDidLoad {
    // Do any additional setup after loading the view.
    
    self.renderView.frame = CGRectMake(0, 84, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - 84);
    [self.view addSubview:self.renderView];
    self.renderView.presentationRect = self.videoCapture.mCaptureParams.resoulution;
    
    
    [super viewDidLoad];
    
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    tapGesture.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:tapGesture];
}


- (void)dealloc {
    _videoCapture = nil;
}


- (void)handleTapGesture:(UITapGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateRecognized) {
        // handling code
        [self.videoCapture switchPosition];
    }
}


- (WDGLRenderView *)renderView {
    if (!_renderView) {
        _renderView = [[WDGLRenderView alloc] init];
        _renderView.delegate = self;
    }
    return _renderView;
}

- (WDVideoCapture *)videoCapture {
    if (!_videoCapture) {
        _videoCapture = [[WDVideoCapture alloc] initWithVideoCaptureParams:[WDVideoCaptureParams defalutCaptureParams]];
        _videoCapture.delegate = self;
//        _videoCapture.previewLayer.frame = self.view.layer.bounds;
    }
    return _videoCapture;
}


#pragma mark    -   WDVideoCaptureDelegate

- (void)videoCapture:(WDVideoCapture *)videoCapture didOccurError:(WDCaptureStatus)status {
    
    NSLog(@"相机出现错误 ...");
}


- (void)videoCapture:(WDVideoCapture *)videoCapture captureOutput:(AVCaptureOutput *)output didOutputVideoSampleBuffer:(CMSampleBufferRef)sampleBuffer connection:(AVCaptureConnection *)connection {
        
    CVImageBufferRef imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
    [_renderView displayPixelBuffer:imageBuffer];
}


#pragma mark    -   WDGLDrawTextureDelegate


- (GLuint)textureWithSize:(CGSize)size textureId:(GLuint)texId {
    
    return [self.textureProcessing renderToTextureWithSize:size sourceTexture:texId];
}

@end
