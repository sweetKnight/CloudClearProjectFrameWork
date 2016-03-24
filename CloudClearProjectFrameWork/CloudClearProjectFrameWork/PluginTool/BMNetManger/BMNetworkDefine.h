//
//  BMNetworkDefine.h
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-12.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#ifndef BlueMobiProject_BMNetworkDefine_h
#define BlueMobiProject_BMNetworkDefine_h

/**
 *  请求类型
 */
typedef enum {
    NetWorkGET = 1,   /**< GET请求 */
    NetWorkPOST       /**< POST请求 */
} NetWorkType;

#define LIST_NUMBER @"10"

/**
 *  网络请求超时的时间
 */
#define API_TIME_OUT 60   

/**
 *  socket连接超时的时间
 */
#define SOCKET_TIME_OUT 60   
/**
 *  网络请求重新尝试的次数
 */
#define NetWorkRetryTimes     2    

#if NS_BLOCKS_AVAILABLE

/**
 *  显示HUD
 */
#define DEFN_SHOW_HUD  @"show_hud"

/**
 *  隐藏HUD
 */
#define DEFN_HIDE_HUD  @"hide_hud"

/**
 *  请求开始的回调（下载时用到）
 */
typedef void (^NWStartBlock)(void);

/**
 *  请求成功回调
 *
 *  @param returnData 回调block
 */
typedef void (^NWSuccessBlock)(id returnData);

/**
 *  请求失败回调
 *
 *  @param error 回调block
 */
typedef void (^NWFailureBlock)(NSError *error);
#endif

#endif
