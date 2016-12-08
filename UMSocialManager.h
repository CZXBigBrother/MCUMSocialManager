//
//  UMSocialManager.h
//  Rivendell
//
//  Copyright © 2016年 MarcoChen. All rights reserved.
//
//  Copyright (c) 2016 czxghostyueqiu (http://blog.csdn.net/czxghostyueqiu，https://github.com/CZXBigBrother)
//

#import <Foundation/Foundation.h>
/**
 新浪微博
 */
//extern NSString *const UMShareToSina;
/**
 QQ空间
 */
//extern NSString *const UMShareToQzone;
/**
 短信
 */
//extern NSString *const UMShareToSms;
///**
// 微信好友
// */
//extern NSString *const UMShareToWechatSession;
///**
// 微信朋友圈
// */
//extern NSString *const UMShareToWechatTimeline;
/**
 手机QQ
 */
//extern NSString *const UMShareToQQ;

typedef enum : NSUInteger {
    shareWechatSession = 0,
    shareWechatTimeline,
    shareSina,
    shareQQ,
    shareQzone,
    shareSms,
}shareType;
@interface UMSocialManager : NSObject
/**
 *  注册第三方平台
 */
+ (void)registerSocialUmeng;
/**
 *  分享
 */
+ (void)shareTitle:(NSString *)title withText:(NSString *)text withImage:(UIImage *)image withUrl:(NSString *)url;
/**
 *  自定义分享
 */
+ (void)shareType:(shareType)type withTitle:(NSString *)title withText:(NSString *)text withImage:(UIImage *)image withUrl:(NSString *)url;
@end
