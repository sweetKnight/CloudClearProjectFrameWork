//
//  LeftImageTextField.h
//  CloudClearProjectFrameWork
//
//  Created by 冯剑锋 on 16/3/24.
//  Copyright © 2016年 冯剑锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftImageTextField : UITextField
@property (nonatomic, strong) UIImageView * leftImageView;

-(instancetype)initWithFrame:(CGRect)frame AndImageSize:(CGSize)imageSize;

@end
