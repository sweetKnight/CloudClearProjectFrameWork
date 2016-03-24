//
//  BMNetworkItem.h
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-12.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMNetworkDefine.h"
#import "AFNetworking.h"

/**
 *  网络请求子项
 */
@interface BMNetworkItem : NSObject

/**
 *  网络请求方式
 */
@property (nonatomic, assign) NetWorkType networkType;

/**
 *  网络请求URL
 */
@property (nonatomic, strong) NSString *url;

/**
 *  网络请求参数
 */
@property (nonatomic, strong) id params;

/**
 *  网络请求的委托
 */
@property (nonatomic, assign) id delegate;

/**
 *  网络请求的委托delegate的唯一标示，因为delegate不能直接作为Key，所以转化了一步，用hashValue代替
 */
@property (nonatomic, assign) NSUInteger hashValue;

/**
 *  是否显示HUD
 */
@property (nonatomic, assign) BOOL showHUD;

/**
 *  NWConnItem对象中封装的ASIHTTPRequest成员变量
 */
@property (nonatomic, strong) AFHTTPRequestOperation *httpRequest;

/**
 *  请求成功后的block
 */
@property (nonatomic, strong) NWSuccessBlock successBlock;

/**
 *  请求失败后的block
 */
@property (nonatomic, strong) NWFailureBlock failureBlock;

/**
 *  创建一个网络请求项，开始请求网络
 *
 *  @param networkType  网络请求方式
 *  @param url          网络请求URL
 *  @param params       网络请求参数
 *  @param delegate     网络请求的委托，如果没有取消网络请求的需求，可传nil
 *  @param hashValue    网络请求的委托delegate的唯一标示
 *  @param showHUD      是否显示HUD
 *  @param successBlock 请求成功后的block
 *  @param failureBlock 请求失败后的block
 *
 *  @return BMNetworkItem对象
 */
- (BMNetworkItem *) initWithtype:(NetWorkType) networkType
                             url:(NSString *) url
                          params:(NSDictionary *) params
                        delegate:(id) delegate
                       hashValue:(NSUInteger) hashValue
                         showHUD:(BOOL) showHUD
                    successBlock:(NWSuccessBlock) successBlock
                    failureBlock:(NWFailureBlock) failureBlock;

/**
 *  创建一个网络请求项，开始上传图片
 *
 *  @param networkType  网络请求方式
 *  @param url          网络请求URL
 *  @param params       网络请求参数
 *  @param images       图片二进制数组
 *  @param delegate     网络请求的委托，如果没有取消网络请求的需求，可传nil
 *  @param hashValue    网络请求的委托delegate的唯一标示
 *  @param showHUD      是否显示HUD
 *  @param successBlock 请求成功后的block
 *  @param failureBlock 请求失败后的block
 *
 *  @return BMNetworkItem对象
 */
- (BMNetworkItem *) initWithtype:(NetWorkType) networkType
                             url:(NSString *) url
                          params:(NSDictionary *) params
                          images:(NSDictionary *) images
                        delegate:(id) delegate
                       hashValue:(NSUInteger) hashValue
                         showHUD:(BOOL) showHUD
                    successBlock:(NWSuccessBlock) successBlock
                    failureBlock:(NWFailureBlock) failureBlock;

/**
 *  创建一个下载的网络请求项，开始请求网络
 *
 *  @param networkType  网络请求方式
 *  @param url          网络请求URL
 *  @param params       网络请求参数
 *  @param delegate     网络请求的委托，如果没有取消网络请求的需求，可传nil
 *  @param hashValue    网络请求的委托delegate的唯一标示
 *  @param startBlock   请求开始后的block
 *  @param successBlock 请求成功后的block
 *  @param failureBlock 请求失败后的block
 *
 *  @return BMNetworkItem对象
 */
- (BMNetworkItem *) initDownloadWithtype:(NetWorkType) networkType
                                     url:(NSString *) url
                                delegate:(id) delegate
                               hashValue:(NSUInteger) hashValue
                              startBlock:(NWStartBlock) startBlock
                            successBlock:(NWSuccessBlock) successBlock
                            failureBlock:(NWFailureBlock) failureBlock;

@end
