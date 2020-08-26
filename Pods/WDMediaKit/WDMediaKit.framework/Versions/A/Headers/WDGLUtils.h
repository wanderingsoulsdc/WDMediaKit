//
//  WDGLUtils.h
//  WDGLTextureKit
//
//  Created by 祁云 on 2020/7/23.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "WDGLTextureProgram.h"

NS_ASSUME_NONNULL_BEGIN

@interface WDGLUtils : NSObject

// 使用ImageIO进行gif解码，得到png序列图以及相关编码参数
+ (void)gif_decodeImageWithPath:(NSString *)path completionHandler:(void (^) (NSMutableArray *outImages, NSTimeInterval delayTime))handler;

// 创建gif文件，并存入指定的图片资源
+ (BOOL)gif_createFilePath:(NSString *)path makeFromImages:(NSArray <UIImage *> *)images;

@end

NS_ASSUME_NONNULL_END
