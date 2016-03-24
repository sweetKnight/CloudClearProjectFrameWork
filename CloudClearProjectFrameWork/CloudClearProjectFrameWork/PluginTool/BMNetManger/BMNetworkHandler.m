//
//  BMNetworkHandler.m
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-12.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import "BMNetworkHandler.h"
#import "BMNetworkItem.h"

@implementation BMNetworkHandler

+ (BMNetworkHandler *) sharedInstance
{
    static BMNetworkHandler * handler = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        handler = [[BMNetworkHandler alloc] init];
        handler.networkItems = [[NSMutableArray alloc] init];
    });
    
    return handler;
}

- (BOOL)cancelForDelegate:(id)delelgate
{
    NSUInteger hashValue = [delelgate hash];
    
    BOOL flag = NO;
    
    for (BMNetworkItem *item in self.networkItems) 
    {
        if (item.hashValue == hashValue) 
        {
            [item.httpRequest cancel];
            [self removeItem:item];
            flag = YES;
        }
    }
    
    return flag;
}

- (void)addItem:(BMNetworkItem *)networkItem
{
    if (networkItem.showHUD) 
    {
        _showHUDReqCount++;
        
        if (_showHUDReqCount == 1) 
        {
            [[NSNotificationCenter defaultCenter] postNotificationName:DEFN_SHOW_HUD object:nil];
        }
    }
    
    [self.networkItems addObject:networkItem];
}

- (void)removeItem:(BMNetworkItem *)networkItem
{
    if (networkItem.showHUD) 
    {
        _showHUDReqCount--;
        
        if (_showHUDReqCount == 0) 
        {
            [[NSNotificationCenter defaultCenter] postNotificationName:DEFN_HIDE_HUD object:nil];
        }
    }
    
    [self.networkItems removeObject:networkItem];
}

- (NSUInteger)conURL:(NSString *) url
         networkType:(NetWorkType) networkType
              params:(NSMutableDictionary *) params
            delegate:(id) delegate
             showHUD:(BOOL) showHUD
        successBlock:(NWSuccessBlock) successBlock
        failureBlock:(NWFailureBlock) failureBlock
{
    /// 如果有一些公共处理，可以写在这里
    
#if DEBUG_LOG
    NSLog(@"BM网络请求接口url:%@", url);
    NSLog(@"BM网络请求params:%@", params);
#endif
    
    NSUInteger hashValue = [delegate hash];
    BMNetworkItem *item = [[BMNetworkItem alloc] initWithtype:networkType
                                                          url:url
                                                       params:params
                                                     delegate:delegate
                                                    hashValue:hashValue
                                                      showHUD:showHUD
                                                 successBlock:successBlock
                                                 failureBlock:failureBlock];
    return item.hashValue;
}

- (NSUInteger)conURL:(NSString *) url
         networkType:(NetWorkType) networkType
              params:(NSMutableDictionary *) params
              images:(NSDictionary *) images
            delegate:(id) delegate
             showHUD:(BOOL) showHUD
        successBlock:(NWSuccessBlock) successBlock
        failureBlock:(NWFailureBlock) failureBlock
{    
    NSUInteger hashValue = [delegate hash];
    BMNetworkItem *item = [[BMNetworkItem alloc] initWithtype:networkType
                                                          url:url
                                                       params:(NSMutableDictionary *) params
                                                       images:images
                                                     delegate:delegate
                                                    hashValue:hashValue
                                                      showHUD:showHUD
                                                 successBlock:successBlock
                                                 failureBlock:failureBlock];
    return item.hashValue;
}

- (NSUInteger)downloadURL:(NSString *) url
                 delegate:(id) delegate
               startBlock:(NWStartBlock) startBlock
             successBlock:(NWSuccessBlock) successBlock
             failureBlock:(NWFailureBlock) failureBlock
{
#if DEBUG_LOG
    NSLog(@"BM网络下载url:%@", url);
#endif
    
    NSUInteger hashValue = [delegate hash];
    BMNetworkItem *item = [[BMNetworkItem alloc] initDownloadWithtype:NetWorkPOST
                                                                  url:url
                                                             delegate:delegate
                                                            hashValue:hashValue
                                                           startBlock:startBlock
                                                         successBlock:successBlock
                                                         failureBlock:failureBlock];
    return item.hashValue;
}

@end
