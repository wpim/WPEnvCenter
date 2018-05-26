//
//  WPEnvCenter.h
//  WPEnvCenter
//
//  Created by 甘文鹏 on 2018/5/26.
//

#import <Foundation/Foundation.h>
#import "WPEnvConfig.h"

@interface WPEnvCenter : NSObject{
    @private
    WPEnvConfig *_debugConfig;
    WPEnvConfig *_releaseConfig;
}

+ (instancetype)sharedCenter;

- (WPEnvConfig *)debugConfig;
- (WPEnvConfig *)releaseConfig;
@end
