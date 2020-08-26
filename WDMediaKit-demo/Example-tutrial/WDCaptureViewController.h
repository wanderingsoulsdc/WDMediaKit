//
//  WDCaptureViewController.h
//  WDMediaKit-demo
//
//  Created by 祁云 on 2020/8/20.
//  Copyright © 2020 祁云. All rights reserved.
//

#import "WDBaseViewController.h"
#import <WDMediaKit/WDVideoCapture.h>
#import <WDMediaKit/WDAudioCapture.h>
#import <WDMediaKit/WDGLRenderView.h>
#import <WDMediaKit/WDGLTextureProcessing.h>

NS_ASSUME_NONNULL_BEGIN

@interface WDCaptureViewController : WDBaseViewController <WDVideoCaptureDelegate, WDGLDrawTextureDelegate>

@property (nonatomic, strong, nonnull) WDVideoCapture  *videoCapture;
@property (nonatomic, strong, nonnull) WDAudioCapture  *audioCapture;
@property (strong, nonatomic) WDGLRenderView  *renderView;


@end

NS_ASSUME_NONNULL_END
