//
//  WDGPUImageManager.h
//  WDMediaKit
//
//  Created by 祁云 on 2020/8/3.
//  Copyright © 2020 祁云. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WDGPUImageManager : NSObject

+ (instancetype)shareInstanceType;


// 设置特效类型
@property (nonatomic, assign, setter=setEffectId:) NSInteger effectId;


// 设置混合资源路径，该接口会立刻生成效果
- (void)setMixResourceOfPath:(NSString *)path;


// 传入纹理进行自定义处理
- (unsigned int)renderToTextureWithSize:(CGSize)size sourceTexture:(unsigned int)sourceTexture;


// 清理资源
- (void)cleanup;

@end

NS_ASSUME_NONNULL_END
