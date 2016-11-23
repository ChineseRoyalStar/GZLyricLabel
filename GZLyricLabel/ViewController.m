//
//  ViewController.m
//  GZLyricLabel
//
//  Created by armada on 2016/11/22.
//  Copyright © 2016年 com.zlot.gz. All rights reserved.
//

#import "ViewController.h"
#import "GZLyricLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    GZLyricLabel *lyricLB = [[GZLyricLabel alloc]initWithLyric:@"一川烟草,满城风絮,梅子黄时雨" font:[UIFont fontWithName:@"PingFangSC-Semibold" size:25] widthLimit:0 heightLimit:100];
    lyricLB.backgroundColor = [UIColor yellowColor];
    lyricLB.tintColor = [UIColor redColor];
    lyricLB.trackTintColor = [UIColor greenColor];
    lyricLB.center = self.view.center;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [lyricLB updateProgress:1.0 withinDuration:4 animated:NO];
    });
    
    [self.view addSubview:lyricLB];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
