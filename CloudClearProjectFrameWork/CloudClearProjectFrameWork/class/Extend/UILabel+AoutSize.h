//
//  UILabel+AoutSize.h
//  MBCLText
//
//  Created by 张长乐 on 15/4/10.
//  Copyright (c) 2015年 BMCL. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *   自适应大小Lab (顶端对齐) 对text,fount赋值时有效
 */
@interface UILabel (AoutSize)

/**
 *   添加动态大小监听 对text,fount赋值时有效
 */
-(void)aoutSize;

/**
 *  计算字符串Size
 
 *
 *  @param str   字符串
 *  @param fount 字体
 *  @param size  最大Size   0不限制最大最
 *
 *  @return 返回字符串所需最小Size
 */
+(CGSize)sizeWithString:(NSString *)str fount:(UIFont*)fount maxSize:(CGSize)size;


@end
