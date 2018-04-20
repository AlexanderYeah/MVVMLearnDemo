//
//  SKViewModel.m
//  MVVMLearnDemo
//
//  Created by Alexander on 2018/4/19.
//  Copyright © 2018年 alexander. All rights reserved.
//

#import "SKViewModel.h"
#import "SKModel.h"
@implementation SKViewModel

+ (void)loadDataWithSuccessCB:(SKSuccessBlock)cb
{

	NSMutableArray *dataArr = [NSMutableArray arrayWithCapacity:0];
	for (int i = 0 ; i < 9; i ++) {
		SKModel *model = [[SKModel alloc]init];
		model.imgName = [NSString stringWithFormat:@"%d",i];
		[dataArr addObject:model];
	}
	
	// 模拟网络请求成功的回调 将数据传回到ViewController
	cb(dataArr);

}



@end
