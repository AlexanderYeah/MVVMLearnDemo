//
//  SKViewModel.h
//  MVVMLearnDemo
//
//  Created by Alexander on 2018/4/19.
//  Copyright © 2018年 alexander. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SKSuccessBlock)(id data);

typedef void(^SKFailBlock)(id data);

@interface SKViewModel : NSObject

/**
 成功的回调
 */
@property (nonatomic,copy)SKSuccessBlock successCb;
/**
 失败的回调
 */
@property (nonatomic,copy)SKFailBlock failCb;


+ (void)loadDataWithSuccessCB:(SKSuccessBlock )cb;


@end
