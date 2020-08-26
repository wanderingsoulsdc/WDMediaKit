//
//  WDGLTextureProcessing.h
//  AFNetworking
//
//  Created by 祁云 on 2020/7/10.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

extern const NSString* kWDGLIntensity;        // 强度，范围0~1的数值
extern const NSString* kWDGLDuration;         // 持续时长, 传入float类型
extern const NSString* KWDGLLoopEnable;       // 开启循环, 传入bool值


@interface WDGLTextureProcessing : NSObject

// 单例模式
+ (instancetype)shareInstanceTextureProcessiong;

// 初始化
- (id)init;


// 设置特效类型
@property (nonatomic, assign, setter=setEffectId:) NSInteger effectId;

// 设置滤镜类型
@property (nonatomic, assign, setter=setFilterId:) NSInteger filterId;


// 更新相关参数效果
- (void)updateParams:(NSDictionary *)params;


// 设置混合资源路径，该接口会立刻生成效果
- (void)setMixResourceOfPath:(NSString *)path;


// 传入纹理进行自定义处理
- (GLuint)renderToTextureWithSize:(CGSize)fboSize sourceTexture:(GLuint)sourceTexture;


// 清理资源
- (void)cleanup;

@end

NS_ASSUME_NONNULL_END
