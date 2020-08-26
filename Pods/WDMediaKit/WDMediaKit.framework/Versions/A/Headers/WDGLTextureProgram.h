//
//  WDGLTextureProgram.h
//  FBSnapshotTestCase
//
//  Created by 祁云 on 2020/7/14.
//

#import <Foundation/Foundation.h>
#import <OpenGLES/gltypes.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WDGLTextureProgram : NSObject


// 使用内置opengles库创建
+ (BOOL)createProgramWithShaders:(NSString *)vertexSource
                  fragmentSource:(NSString *)fragSource
              beforeDettachBlock:(nullable void (^) (GLuint))block;

@end

@interface WDGLTextureUtils : NSObject

+ (GLuint)textureIdForImage:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
