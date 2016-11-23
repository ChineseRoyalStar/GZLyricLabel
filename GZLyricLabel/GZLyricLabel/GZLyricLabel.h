//
//  GZLyricLabel.h
//  GZLyricLabel
//
//  Created by armada on 2016/11/22.
//  Copyright © 2016年 com.zlot.gz. All rights reserved.
//



/*                         贺铸《青玉案》
    凌波不过横塘路，但目送，芳尘去。锦瑟华年谁与度？月桥花院，琐窗朱户，只有春知处。
 　　飞云冉冉蘅皋暮，彩笔新题断肠句。试问闲愁都几许？一川烟草，满城风絮，梅子黄时雨。
 */

#import <UIKit/UIKit.h>

@interface GZLyricLabel : UIView
/*!
 * @brief 当前滚动位置
 */
@property(nonatomic,assign) NSInteger location;

/*!
 * @brief 滚动字体颜色
 */
@property(nonatomic,strong) UIColor *trackTintColor;

/*!
 * @brief 构造器
 * @param lyric 歌词字符串
 * @param font 字体
 * @param widthLimit 宽度限制
 * @param heightLimit 高度限制
 */
- (instancetype)initWithLyric:(NSString *)lyric
                         font:(UIFont *)font
                   widthLimit:(CGFloat)widthLimit
                  heightLimit:(CGFloat)heightLimit;

/*!
 * @brief 按照duration动画滚动一个文字
 * @param duration 动画持续时间
 */
- (void)updateWithDuration:(CFTimeInterval)duration;

/*!
 * @brief 按照duration动画滚动到文本的location处
 * @param location 动画结束位置
 * @param duration 动画持续时间
 */
- (void)updateInLocation:(NSInteger)location
          withinDuration:(CFTimeInterval)duration;
/*!
 * @brief 按照duration滚动到文本的百分比progress处
 * @param progress 动画滚动到文字的百分比处
 * @param duration 动画持续时间
 */
- (void)updateProgress:(CGFloat)progress
        withinDuration:(CFTimeInterval)duration
              animated:(BOOL)animated;
@end
