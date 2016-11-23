//
//  NSString+StringRect.m
//  GZLyricLabel
//
//  Created by armada on 2016/11/22.
//  Copyright © 2016年 com.zlot.gz. All rights reserved.
//

#import "NSString+StringRect.h"

@implementation NSString (StringRect)

- (CGSize)stringSizeWithFont:(UIFont *)font widthLimit:(CGFloat)widthLimit heightLimit:(CGFloat)heightLimit {
    
    return [self boundingRectWithSize:CGSizeMake(widthLimit, heightLimit) options:NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
}

@end
