//
//  WPEnvCenter.m
//  WPEnvCenter
//
//  Created by 甘文鹏 on 2018/5/26.
//

#import "WPEnvCenter.h"

@interface WPEnvCenter()
@property (nonatomic, strong) WPEnvConfig *debugConfig;
@property (nonatomic, strong) WPEnvConfig *releaseConfig;

@property (nonatomic, assign) WPEnvMode mode;
@end

@implementation WPEnvCenter
#pragma mark - 单例
static WPEnvCenter *_instance;

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

+ (instancetype)sharedCenter {
    if (!_instance) {
        _instance = [[self alloc] init];
    }
    return _instance;
}

#pragma mark - 获取环境配置
- (WPEnvConfig *)debugConfig {
    if (!_debugConfig) {
        WPEnvConfig *config = [[WPEnvConfig alloc] init];
        config.baseApiUrl = @"http://127.0.0.1:8080";
        config.socketUrl = @"ws://127.0.0.1:8081";
        config.appId = @"im10000";
        _debugConfig = config;
    }

    return _debugConfig;
}

- (WPEnvConfig *)releaseConfig {
    if (!_releaseConfig) {
        WPEnvConfig *config = [[WPEnvConfig alloc] init];
        config.baseApiUrl = @"https://api.wpim.ganwenpeng.com";
        config.socketUrl = @"wss://socket.wpim.ganwenpeng.com";
        config.appId = @"im10000";
        _releaseConfig = config;
    }
    return _releaseConfig;
}

- (WPEnvConfig *)currentConfig {
#if DEBUG
    switch (self.mode) {
        case WPEnvModeDebug:
            return self.debugConfig;
            break;
        case WPEnvModeRelease:
            return self.releaseConfig;
            
        default:
            break;
    }
#else
    return self.releaseConfig;
#endif
}

- (void)switchMode:(WPEnvMode)mode {
    self.mode = mode;
}
@end
