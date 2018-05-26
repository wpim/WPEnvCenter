//
//  WPEnvCenter.h
//  WPEnvCenter
//
//  Created by 甘文鹏 on 2018/5/26.
//

#import <Foundation/Foundation.h>
#import "WPEnvConfig.h"

typedef NS_ENUM(NSInteger, WPEnvMode) {
    WPEnvModeDebug,
    WPEnvModeRelease
};

@interface WPEnvCenter : NSObject

+ (instancetype)sharedCenter;

- (WPEnvConfig *)currentConfig;
- (void)switchMode:(WPEnvMode)mode;
@end
