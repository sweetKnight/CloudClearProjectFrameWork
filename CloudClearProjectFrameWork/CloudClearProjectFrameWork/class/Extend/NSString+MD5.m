//
//  NSString+MD5.m
//  ZhongGuoCha
//
//  Created by 张长乐 on 15/6/5.
//  Copyright (c) 2015年 BMCL. All rights reserved.
//

#import "NSString+MD5.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (MD5)


-(NSString *)md5HexDigests
{
    const char* str = [self UTF8String];
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
   CC_MD5(str, (uint32_t)strlen(str), result);
    
    NSMutableString *ret = [NSMutableString string];
    
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

-(NSString*)MD5SXBK{
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYYMMdd"];
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    
    NSString* starStr=[[[locationString stringByAppendingString:self] md5HexDigests] md5HexDigests];
    NSString* endStr=[[[@"g,ICxkqDjg*SUKGrZDb9eQ4F*Z.7l96X" stringByAppendingString:self] md5HexDigests] md5HexDigests];
    NSString *String1 = [starStr substringWithRange:NSMakeRange(0,16)];
    NSString *String2 = [endStr substringWithRange:NSMakeRange(16,16)];
    NSString* lastStr=[String1 stringByAppendingString:String2];
    return [[lastStr md5HexDigests] md5HexDigests];;
}

@end
