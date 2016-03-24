//
//  Mybutton.m
//  BUTTONTEST
//
//  Created by 冯剑锋 on 15/11/23.
//  Copyright © 2015年 冯剑锋. All rights reserved.
//

#import "RightImageButton.h"

@interface RightImageButton (){
    CGRect titleFrame;
}

@end

@implementation RightImageButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGRect frame = [super imageRectForContentRect:contentRect];
    return CGRectMake(self.bounds.size.width - frame.size.width, frame.origin.y, frame.size.width, frame.size.height);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    titleFrame = [super titleRectForContentRect:contentRect];
    return CGRectMake(titleFrame.origin.x-12, titleFrame.origin.y, titleFrame.size.width, titleFrame.size.height);
}

@end
