//
//  WDBaseViewController.h
//  WDMediaKit-demo
//
//  Created by 祁云 on 2020/8/20.
//  Copyright © 2020 祁云. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WDMediaKit/WDMediaPlayer.h>

NS_ASSUME_NONNULL_BEGIN

@interface WDBaseViewController : UIViewController

@property (strong, nonatomic) WDGLTextureProcessing *textureProcessing;

- (NSString *)createTempFileWithFormat:(NSString *)format;

@end

NS_ASSUME_NONNULL_END
