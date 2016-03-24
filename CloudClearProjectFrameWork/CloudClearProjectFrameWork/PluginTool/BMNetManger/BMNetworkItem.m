//
//  BMNetworkItem.m
//  BlueMobiProject
//
//  Created by 朱 亮亮 on 14-5-12.
//  Copyright (c) 2014年 朱 亮亮. All rights reserved.
//

#import "BMNetworkItem.h"
#import "BMNetworkHandler.h"
//#import "NSString+Common.h"

@implementation BMNetworkItem

- (BMNetworkItem *) initWithtype:(NetWorkType) networkType
                             url:(NSString *) url
                          params:(NSDictionary *) params
                        delegate:(id) delegate
                       hashValue:(NSUInteger) hashValue
                         showHUD:(BOOL) showHUD
                    successBlock:(NWSuccessBlock) successBlock
                    failureBlock:(NWFailureBlock) failureBlock
{
    if (self = [super init])
    {
        self.networkType = networkType;
        self.url = url;
        self.params = params;
        self.delegate = delegate;
        self.hashValue = hashValue;
        self.showHUD = showHUD;
//        self.showHUD = NO;  //嫌弃菊花转的慢
        self.successBlock = successBlock;
        self.failureBlock = failureBlock;
        
        [[BMNetworkHandler sharedInstance] addItem:self];
        NSLog(@"BM网络请求接口url：%@\n参数：%@", url, params);
        
        //将字典变成字符串输出
        NSString * string = @"";
        NSArray * keyArray = [params allKeys];
        for (int i = 0; i < keyArray.count; i++) {
            if (i == 0) {
                string = [NSString stringWithFormat:@"%@=%@",keyArray[i], [params objectForKey:keyArray[i]]];
            }else{
                string = [NSString stringWithFormat:@"%@&%@=%@",string, keyArray[i], [params objectForKey:keyArray[i]]];
            }
        }
        NSLog(@"%@?%@",url,string);
        
        if (networkType == NetWorkGET)
        {
//            __weak BMNetworkItem *weakSelf = self;
            AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
            manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain",nil];
            self.httpRequest = [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
                
                NSLog(@"BM网络请求接口url:%@的回返数据 responseString:\n%@", url, responseObject);
                
                if (self.successBlock) {
                    self.successBlock(responseObject);
                }
                [[BMNetworkHandler sharedInstance] removeItem:self];
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"BM网络请求接口url:%@访问错误 error:\n%@", url, error);
                if (self.failureBlock) {
                    self.failureBlock(error);
                } else {
//                    [UIAlertView alertWithTitle:@"提示" message:@"网络异常，请稍后重试" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
                }
                [[BMNetworkHandler sharedInstance] removeItem:self];
            }];
        }
        else if (networkType == NetWorkPOST)
        {
//            __weak BMNetworkItem *weakSelf = self;
            AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
            manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain",nil];

            self.httpRequest = [manager POST:url parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"BM网络请求接口url:%@的回返数据 responseString:\n%@", url, responseObject);
                
                if (self.successBlock) {
                    self.successBlock(responseObject);
                }
                [[BMNetworkHandler sharedInstance] removeItem:self];
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"BM网络请求接口url:%@访问错误 error:\n%@", url, error);
                if (self.failureBlock) {
                    self.failureBlock(error);
                } else {
//                    [UIAlertView alertWithTitle:@"提示" message:@"网络异常，请稍后重试" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
                }
                [[BMNetworkHandler sharedInstance] removeItem:self];
            }];
        }
    }
    
    return self;
}

- (BMNetworkItem *) initWithtype:(NetWorkType) networkType
                             url:(NSString *) url
                          params:(NSDictionary *) params
                          images:(NSDictionary *) images
                        delegate:(id) delegate
                       hashValue:(NSUInteger) hashValue
                         showHUD:(BOOL) showHUD
                    successBlock:(NWSuccessBlock) successBlock
                    failureBlock:(NWFailureBlock) failureBlock
{
    if (self = [super init])
    {
        self.networkType = networkType;
        self.url = url;
        self.params = params;
        self.delegate = delegate;
        self.hashValue = hashValue;
        self.showHUD = showHUD;
        self.successBlock = successBlock;
        self.failureBlock = failureBlock;
        
        [[BMNetworkHandler sharedInstance] addItem:self];
        
        for (NSData *image in images) {
            NSLog(@"图片：%@", image);
            
//            __weak BMNetworkItem *weakSelf = self;
            AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
            manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain",nil];

            [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                
                for (NSString *keyString in [images allKeys])
                {
                    NSData *imgData = [images objectForKey:keyString];
                    if (imgData.length > 0) {
                        
                        [formData appendPartWithFormData:imgData name:keyString];
                        NSLog(@"图片上传%@",keyString);
                        
                    }
                }
                
            } success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"图片上传成功: %@", responseObject);
                if (self.successBlock) {
                    self.successBlock(responseObject);
                }
                [[BMNetworkHandler sharedInstance] removeItem:self];
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"图片上传失败: %@", error);
                if (self.failureBlock) {
                    self.failureBlock(error);
                } else {
//                    [UIAlertView alertWithTitle:@"提示" message:@"网络异常，请稍后重试" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
                }
                [[BMNetworkHandler sharedInstance] removeItem:self];
            }];
        }
    }
    
    return self;
}

- (BMNetworkItem *) initDownloadWithtype:(NetWorkType) networkType
                                     url:(NSString *) url
                                delegate:(id) delegate
                               hashValue:(NSUInteger) hashValue
                              startBlock:(NWStartBlock) startBlock
                            successBlock:(NWSuccessBlock) successBlock
                            failureBlock:(NWFailureBlock) failureBlock
{
    if (self = [super init])
    {
        self.networkType = networkType;
        self.url = url;
        self.delegate = delegate;
        self.hashValue = hashValue;
    }
    
    return self;
}

@end
