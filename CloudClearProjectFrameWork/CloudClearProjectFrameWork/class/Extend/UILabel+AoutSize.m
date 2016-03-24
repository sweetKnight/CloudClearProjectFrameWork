//
//  UILabel+AoutSize.m
//  MBCLText
//
//  Created by 张长乐 on 15/4/10.
//  Copyright (c) 2015年 BMCL. All rights reserved.
//

#import "UILabel+AoutSize.h"

static  CGSize  MaxSize;

@implementation UILabel (AoutSize)

//-(void)dealloc{
//    [self removeObserver:self forKeyPath:@"text"];
//    [self removeObserver:self forKeyPath:@"font"];
//}
#pragma mark- 添加监听
-(void)aoutSize{
    MaxSize=self.frame.size;
    self.numberOfLines=0;
    //添加kvo监听
    [self addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:self forKeyPath:@"font" options:NSKeyValueObservingOptionNew context:nil];
    //
    if (self.text.length>0) {[self changeSizeWithString];}
}
#pragma mark- KVO监听方法
-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary *)change
                      context:(void *)context{
    
    [self changeSizeWithString];
    
}
#pragma mark- 改变self大小
-(void)changeSizeWithString{
   // NSLog(@"rect1: %@", NSStringFromCGRect( self.frame));
    CGRect rect = [self.text boundingRectWithSize:MaxSize
                                          options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                       attributes:@{NSFontAttributeName:self.font}
                                          context:nil];
    
    CGRect labrect =self.frame;
    labrect.size=rect.size;
    self.frame=labrect;
    //NSLog(@"rect1: %@", NSStringFromCGRect( self.frame));
}
#pragma mark- 外部方法 计算字符串 占位大小
+(CGSize)sizeWithString:(NSString *)str
                    fount:(UIFont*)fount
                  maxSize:(CGSize)size {
    
    CGRect rect = [str boundingRectWithSize:size
                                    options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                 attributes:@{NSFontAttributeName:fount}
                                    context:nil];
    return rect.size;
}
@end
