//
//  WPViewController.m
//  WPEnvCenter
//
//  Created by gwpp on 05/26/2018.
//  Copyright (c) 2018 gwpp. All rights reserved.
//

#import "WPViewController.h"
#import <WPEnvCenter/WPEnvCenter.h>

@interface WPViewController ()

@end

@implementation WPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    WPEnvCenter *center = [WPEnvCenter sharedCenter];
    
    NSLog(@"%@", center.currentConfig.baseApiUrl);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
