//
//  WDCommonDefine.h
//  WDMediaKit
//
//  Created by 祁云 on 2020/7/31.
//  Copyright © 2020 祁云. All rights reserved.
//

#ifndef WDCommonDefine_h
#define WDCommonDefine_h



#define MEDIA_RESOURCE_BUNDLE               [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: @"Frameworks/WDMediaKit.framework/MediaKit_Resources.bundle"]
#define MEDIA_RESOURCE                      [NSBundle bundleWithPath:MEDIA_RESOURCE_BUNDLE]

#define MEDIA_RESOURCE_LUT_BUNDLE           [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: @"Frameworks/WDMediaKit.framework/MediaKit_LUT.bundle"]
#define MEDIA_RESOURCE_LUT                  [NSBundle bundleWithPath:MEDIA_RESOURCE_LUT_BUNDLE]

#define MEDIA_RESOURCE_SHADERS_BUNDLE       [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent: @"Frameworks/WDMediaKit.framework/MediaKit_Shaders.bundle"]
#define MEDIA_RESOURCE_SHADERS              [NSBundle bundleWithPath:MEDIA_RESOURCE_SHADERS_BUNDLE]



#endif /* WDCommonDefine_h */
