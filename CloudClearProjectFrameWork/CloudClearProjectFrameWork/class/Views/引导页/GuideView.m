//
//  GuideView.m
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-1.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import "GuideView.h"

/**
 *  引导页张数
 */
#define DEF_GUIDE_COUNT 3

@implementation GuideView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        self.bounces=NO;
        self.contentSize = CGSizeMake(DEF_WIDTH(self)*DEF_GUIDE_COUNT, DEF_HEIGHT(self));
        self.backgroundColor = [UIColor blackColor];
        self.showsHorizontalScrollIndicator = NO;
        self.pagingEnabled = YES;
        self.backgroundColor = [UIColor clearColor];

        for (int i=0; i< DEF_GUIDE_COUNT; i++)
        {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(DEF_WIDTH(self)*i, 0, DEF_WIDTH(self), DEF_HEIGHT(self))];
    
            imageView.image = [UIImage imageNamed:DEF_SCREEN_IS_640_960?[NSString stringWithFormat:@"Guide%d",i]:[NSString stringWithFormat:@"Guide%d_ip6",i]];
            imageView.backgroundColor=[UIColor redColor];
            [self addSubview:imageView];
            
            if (i == DEF_GUIDE_COUNT - 1) {
                
            
                // 开始按钮，一般放在最后一张引导页上，frame大小自己根据需要进行调整
            UIButton *button = [[UIButton alloc] initWithFrame:imageView.bounds];
                [button setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
                [button addTarget:self action:@selector(beginClick) forControlEvents:UIControlEventTouchUpInside];
                imageView.userInteractionEnabled = YES;
                [imageView addSubview:button];
            }
        }
    }
    return self;
}

#pragma mark - 点击事件
- (void)beginClick
{
    self.userInteractionEnabled = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
