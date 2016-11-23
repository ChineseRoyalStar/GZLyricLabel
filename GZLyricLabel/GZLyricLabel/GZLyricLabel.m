//
//  GZLyricLabel.m
//  GZLyricLabel
//
//  Created by armada on 2016/11/22.
//  Copyright © 2016年 com.zlot.gz. All rights reserved.
//

#import "GZLyricLabel.h"
#import "NSString+StringRect.h"

@interface GZLyricLabel()

@property(nonatomic,copy) NSString *lyric;

@property(nonatomic,strong) UIFont *font;

@property(nonatomic,strong) CALayer *trackLayer;

@property(nonatomic,strong) CAShapeLayer *backLayer;

@property(nonatomic,strong) CATextLayer *textLayer;

@property(nonatomic,assign) CGFloat progress;

@end

@implementation GZLyricLabel


- (instancetype)initWithLyric:(NSString *)lyric
                         font:(UIFont *)font
                   widthLimit:(CGFloat)widthLimit
                  heightLimit:(CGFloat)heightLimit {
    
    CGSize labelSize = [lyric stringSizeWithFont:font widthLimit:widthLimit heightLimit:heightLimit];
    CGRect frame = CGRectMake(0, 0, labelSize.width, labelSize.height);
    
    if(self = [super initWithFrame:frame]) {
        
        _lyric = lyric;
        _location = -1;
        _font = font;
        
        [self createTrackLayer];
        [self createBackLayer];
        [self createTextLayer];
    }
    return self;
}

- (void)updateWithDuration:(CFTimeInterval)duration {
    if(self.location<self.lyric.length-1){
        [self updateInLocation:self.location+1 withinDuration:duration];
    }
}

- (void)updateInLocation:(NSInteger)location
          withinDuration:(CFTimeInterval)duration {
    self.location = location;
    CGFloat progress = (1+location)*1.0/self.lyric.length;
    [self updateProgress:progress withinDuration:duration animated:YES];
}

- (void)updateProgress:(CGFloat)progress
        withinDuration:(CFTimeInterval)duration
              animated:(BOOL)animated{
    
    self.progress = progress;
    [CATransaction begin];
    [CATransaction setAnimationDuration:duration];
    [CATransaction setDisableActions:!animated];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    self.backLayer.strokeEnd = progress;
    [CATransaction commit];
}

- (void)createTrackLayer {
    
    self.trackLayer = [CALayer layer];
    self.trackLayer.bounds = self.bounds;
    self.trackLayer.position = CGPointMake(self.bounds.size.width/2.0,self.bounds.size.height/2.0);
    self.trackLayer.backgroundColor = [UIColor lightGrayColor].CGColor;
    [self.layer addSublayer:self.trackLayer];
}

- (void)createBackLayer {
    
    self.backLayer = [CAShapeLayer layer];
    self.backLayer.bounds = self.bounds;
    self.backLayer.position = CGPointMake(self.backLayer.bounds.size.width/2.0, self.backLayer.bounds.size.height/2.0);
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, self.backLayer.bounds.size.height/2.0)];
    [path addLineToPoint:CGPointMake(self.backLayer.bounds.size.width, self.backLayer.bounds.size.height/2.0)];
    self.backLayer.path = path.CGPath;
    self.backLayer.lineWidth = self.backLayer.bounds.size.height;
    self.backLayer.strokeColor = [UIColor blackColor].CGColor;
    self.backLayer.strokeEnd = 0;
    [self.trackLayer addSublayer:self.backLayer];
}

- (void)createTextLayer {
    
    self.textLayer = [CATextLayer layer];
    self.textLayer.bounds = self.bounds;
    self.textLayer.position = CGPointMake(self.textLayer.bounds.size.width/2.0, self.textLayer.bounds.size.height/2.0);
    self.textLayer.foregroundColor=  [UIColor blackColor].CGColor;
    self.textLayer.string = self.lyric;
    self.textLayer.wrapped = YES;
    self.textLayer.truncationMode = @"end";
    self.textLayer.font = CFBridgingRetain(self.font.fontName);
    self.textLayer.fontSize = self.font.pointSize;
    self.trackLayer.mask = self.textLayer;
}

- (void)setTintColor:(UIColor *)tintColor {
    self.backLayer.strokeColor = tintColor.CGColor;
}

- ( UIColor *)tintColor {
    return [UIColor colorWithCGColor:self.backLayer.strokeColor];
}

- (void)setTrackTintColor:(UIColor *)trackTintColor {
    _trackTintColor = trackTintColor;
    self.trackLayer.backgroundColor = trackTintColor.CGColor;
}


@end
