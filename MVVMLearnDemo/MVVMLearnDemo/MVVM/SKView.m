//
//  SKView.m
//  MVVMLearnDemo
//
//  Created by Alexander on 2018/4/19.
//  Copyright © 2018年 alexander. All rights reserved.
//

#import "SKView.h"

@implementation SKView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
	if (self == [super init]) {
		[self createUI];
	}
	return self;
}

// 创建 UI 界面
- (void)createUI
{

	CGFloat padding = 20;
	CGFloat item_w = ([UIScreen mainScreen].bounds.size.width - 4 * padding) / 3;
	UIImageView *imgView = [[UIImageView alloc]init];
	_imgView = imgView;
	// imgView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0f green:arc4random_uniform(256)/255.0f blue:arc4random_uniform(256)/255.0f alpha:1];
	imgView.frame = CGRectMake(0, 0, 70, 70);
	[self addSubview:imgView];
	
}

@end
