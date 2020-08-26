//
//  WDGLTextureBase.h
//  WDGLTextureKit
//
//  Created by 祁云 on 2020/7/15.
//

#import <Foundation/Foundation.h>
#import "WDGLUtils.h"

NS_ASSUME_NONNULL_BEGIN

#define STRINGIZE(x) #x
#define STRINGIZE2(x) STRINGIZE(x)
#define SHADER_STRING(text) @ STRINGIZE2(text)

extern NSString *const kDefaultVertexShaderString;

@class WDGLTextureBase;
@protocol
WDGLTextureOutput <NSObject>

- (void)renderTexture:(GLuint)texture displaySize:(CGSize)size;

@optional
- (void)addOutputTarget:(WDGLTextureBase *)target;
- (void)remoteOutputTarget:(WDGLTextureBase *)target;

@end


@protocol WDGLTextureDelegate <NSObject>

@optional
- (void)willUpdateFrameBufferOnTarget:(WDGLTextureBase *)textureTarget;

@end


@interface WDGLTextureBase : NSObject <WDGLTextureOutput> {
    // GL program
    GLuint _framebuffer;
    // FBO
    GLuint _mProgram;
}


- (id)init;
- (id)initWithVertexSource:(nullable NSString *)vSource fragmentSource:(nullable NSString *)fSource;

// Reset link to program
- (void)updateVertexShader:(nullable NSString *)vShader fragmentShader:(nullable NSString *)fShader attributesBindWithHandler:(nullable void (^) (GLuint))handler;


// Attributes
@property  GLint filterPositionAttribute;
@property  GLint filterTextureCoordinateAttribute;
@property  GLint filterInputTextureUniform;


// Current target of enable, defalue the value is yes
@property (nonatomic, assign)   BOOL enable;

// Texture size
@property (nonatomic, assign)   CGSize size;

// For effect of type id
@property (nonatomic, assign)   NSInteger effectType;

// For delegate
@property (nonatomic, weak) id<WDGLTextureDelegate> delegate;

// Output targets
@property (nonatomic, strong)   NSMutableArray<WDGLTextureBase *>  *outputTargets;


// Bind texture coordinate and vertex position
- (void)initializeAttributes:(GLuint)program;


// Set draw context
- (void)setContext;


// Sync Offscreen rendering texture
- (GLuint)renderToTextureWithSize:(CGSize)fboSize sourceTexture:(GLuint)sourceTexture;


// FBO size
- (void)setFilterFBO:(CGSize)size;


// Resource cleanup
- (void)cleanup;


// Remove current fbo
- (void)removeFramebuffer;


// Current draw framebuffer of clear
- (void)updateFrameBuffer;


// Current texture
- (GLuint)textureTarget;


// Create fbo
- (void)createDataFBO;

@end

NS_ASSUME_NONNULL_END
