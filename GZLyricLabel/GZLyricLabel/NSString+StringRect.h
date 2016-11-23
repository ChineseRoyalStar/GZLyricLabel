//
//  NSString+StringRect.h
//  GZLyricLabel
//
//  Created by armada on 2016/11/22.
//  Copyright © 2016年 com.zlot.gz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (StringRect)

- (CGSize)stringSizeWithFont:(UIFont *)font
                   widthLimit:(CGFloat)widthLimit
                   heightLimit:(CGFloat)heightLimit;
@end
