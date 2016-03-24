//
//  LeftImageTextField.m
//  CloudClearProjectFrameWork
//
//  Created by 冯剑锋 on 16/3/24.
//  Copyright © 2016年 冯剑锋. All rights reserved.
//

#import "LeftImageTextField.h"

@implementation LeftImageTextField

-(instancetype)initWithFrame:(CGRect)frame AndImageSize:(CGSize)imageSize{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView * leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.height, frame.size.height)];
        leftView.backgroundColor = [UIColor clearColor];
        _leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, imageSize.width, imageSize.height)];
        _leftImageView.center = CGPointMake(leftView.bounds.size.width/2, leftView.bounds.size.height/2);
        [leftView addSubview:_leftImageView];
        self.leftView = leftView;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

@end
