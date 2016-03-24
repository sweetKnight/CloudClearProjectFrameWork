//
//  BMNetWorkURLs.h
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-12.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#ifndef BlueMobiProject_BMNetWorkURLs_h
#define BlueMobiProject_BMNetWorkURLs_h

//Code=-1001 "The request timed out."
//Code=-1009 "The Internet connection appears to be offline."
//Code=-1004 "Could not connect to the server."

/**
 *  超时错误序号 －1001
 */
#define API_COULD_NOT_CONNECT_ERROR -1001

/*!
 *  国茶正式网
 */
#define API_HOST_TeaTwo @"http://app.zggszgc.com/newTea" //外
//张雄国茶
//#define API_HOST @"http://10.58.153.164/" //外
#define API_HOST @"http://10.58.153.164/cherub/" //外

//#define API_HOST @"http://121.40.219.90/ctea/" //外
//#define API_HOST @"http://10.58.160.42:8080/cherub"//内

/**
 *  拼接URL
 *
 *  @param URL 路径
 *
 *  @return 完整的路径
 */
#define GET_URL(URL) [NSString stringWithFormat:@"%@%@", API_HOST,URL]

/**
 *  Socket的HOST
 */
#define SOCKET_HOST @"58.83.147.106"

/**
 *  Socket的PORT
 */
#define SOCKET_PORT 10000

/// Class
#define PublicitfcClass @"Publicitfc"
#define UseritfcClass @"Useritfc"
#define WeiboitfcClass @"Weiboitfc"

#endif

