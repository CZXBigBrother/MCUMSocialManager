//
//  UMSocialManager.m
//
//  Copyright © 2016年 MarcoChen. All rights reserved.
//
//  Copyright (c) 2016 czxghostyueqiu (http://blog.csdn.net/czxghostyueqiu，https://github.com/CZXBigBrother)

#import "UMSocialManager.h"
#import <UMengSocial/UMSocial.h>
#import <UMengSocial/UMSocialWechatHandler.h>
#import <UMengSocial/UMSocialWhatsappHandler.h>
#import <UMengSocial/UMSocialAlipayShareHandler.h>
#import <UMengSocial/UMSocialSinaSSOHandler.h>
#import <UMengSocial/UMSocialQQHandler.h>
#import "RIVNavigationManager.h"

#define APPKEY_UMENG @"APPKEY_UMENG"
#define UMENG_URL    @"URL"
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

@implementation UMSocialManager
+ (NSArray *)allSnsValuesArray {
    return @[UMShareToWechatSession,
             UMShareToWechatTimeline,
             UMShareToSina,
             UMShareToQQ,
             UMShareToQzone,
             UMShareToSms
             ];
}
+ (void)shareType:(shareType)type withTitle:(NSString *)title withText:(NSString *)text withImage:(UIImage *)image withUrl:(NSString *)url {
    
    [[UMSocialData defaultData].extConfig.wechatTimelineData setWxMessageType:UMSocialWXMessageTypeWeb];
    [[UMSocialData defaultData].extConfig.wechatSessionData setWxMessageType:UMSocialWXMessageTypeWeb];
    [[UMSocialData defaultData].extConfig.qqData setQqMessageType:UMSocialQQMessageTypeDefault];
    
    NSString * shareTitle = title;
    NSString * shareText = [text length] > 0 ? text : @" ";
    
    //朋友圈
    [[UMSocialData defaultData].extConfig.wechatTimelineData setShareText:shareText];
    [[UMSocialData defaultData].extConfig.wechatTimelineData setShareImage:image];
    [[UMSocialData defaultData].extConfig.wechatTimelineData setUrl:url];
    
    //微信
    [[UMSocialData defaultData].extConfig.wechatSessionData setTitle:shareTitle];
    [[UMSocialData defaultData].extConfig.wechatTimelineData setShareText:shareText];
    [[UMSocialData defaultData].extConfig.wechatSessionData setShareImage:image];
    [[UMSocialData defaultData].extConfig.wechatSessionData setUrl:url];
    
    //QQ
    [[UMSocialData defaultData].extConfig.qqData setTitle:shareTitle];
    [[UMSocialData defaultData].extConfig.qqData setShareImage:image];
    [[UMSocialData defaultData].extConfig.qqData setUrl:url];
    
    //QQ空间
    [[UMSocialData defaultData].extConfig.qzoneData setTitle:shareTitle];
    [[UMSocialData defaultData].extConfig.qzoneData setShareImage:image];
    [[UMSocialData defaultData].extConfig.qzoneData setUrl:url];
    
    //短信平台
    [[UMSocialData defaultData].extConfig.smsData setShareText:[NSString stringWithFormat:@"【九天音乐】%@ %@",shareText,url]];
    
    //新浪
    [[UMSocialData defaultData].extConfig.sinaData setShareImage:image];
    [[UMSocialData defaultData].extConfig.sinaData setShareText:[NSString stringWithFormat:@"%@ %@",shareText,url]];
    
    [[UMSocialDataService defaultDataService] postSNSWithTypes:@[[UMSocialManager allSnsValuesArray][type]] content:text image:image location:nil urlResource:nil presentedController:[[RIVNavigationManager shared] getCurrentVC] completion:^(UMSocialResponseEntity * response){

    }];
}


+ (void)shareTitle:(NSString *)title withText:(NSString *)text withImage:(UIImage *)image withUrl:(NSString *)url {
    [[UMSocialData defaultData].extConfig.wechatTimelineData setWxMessageType:UMSocialWXMessageTypeWeb];
    [[UMSocialData defaultData].extConfig.wechatSessionData setWxMessageType:UMSocialWXMessageTypeWeb];
    [[UMSocialData defaultData].extConfig.qqData setQqMessageType:UMSocialQQMessageTypeDefault];
    
    NSString * shareTitle = title;
    NSString * shareText = [text length] > 0 ? text : @" ";
    
    //朋友圈
    [[UMSocialData defaultData].extConfig.wechatTimelineData setShareText:shareTitle];
    [[UMSocialData defaultData].extConfig.wechatTimelineData setShareImage:image];
    [[UMSocialData defaultData].extConfig.wechatTimelineData setUrl:url];
    
    //微信
    [[UMSocialData defaultData].extConfig.wechatSessionData setTitle:shareTitle];
    [[UMSocialData defaultData].extConfig.wechatSessionData setShareImage:image];
    [[UMSocialData defaultData].extConfig.wechatSessionData setUrl:url];
    
    //QQ
    [[UMSocialData defaultData].extConfig.qqData setTitle:shareTitle];
    [[UMSocialData defaultData].extConfig.qqData setShareImage:image];
    [[UMSocialData defaultData].extConfig.qqData setUrl:url];
    
    //QQ空间
    [[UMSocialData defaultData].extConfig.qzoneData setTitle:shareTitle];
    [[UMSocialData defaultData].extConfig.qzoneData setShareImage:image];
    [[UMSocialData defaultData].extConfig.qzoneData setUrl:url];
    
    //短信平台
    [[UMSocialData defaultData].extConfig.smsData setShareText:[NSString stringWithFormat:@"【九天音乐】%@ %@",shareText,url]];
    
    //新浪
    [[UMSocialData defaultData].extConfig.sinaData setShareImage:image];
    [[UMSocialData defaultData].extConfig.sinaData setShareText:[NSString stringWithFormat:@"%@ %@",shareText,url]];
    
    [UMSocialSnsService presentSnsIconSheetView:[[RIVNavigationManager shared] getCurrentVC]
                                         appKey:APPKEY_UMENG
                                      shareText:shareText
                                     shareImage:nil
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToWechatTimeline,UMShareToWechatSession,UMShareToQQ,UMShareToQzone,UMShareToSina,UMShareToSms,nil]
                                       delegate:nil];
}


+ (void)registerSocialUmeng {
    [UMSocialData setAppKey:APPKEY_UMENG];
    [UMSocialWechatHandler setWXAppId:@"AppId" appSecret:@"Secret" url:UMENG_URL];
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"AppKey" secret:@"secret" RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    [UMSocialQQHandler setQQWithAppId:@"AppId" appKey:@"appKey" url:UMENG_URL];
    [UMSocialQQHandler setSupportWebView:YES];
    
}
@end
