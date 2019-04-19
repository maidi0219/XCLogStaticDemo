//
//  LXLHttpHelper.m
//  Kiwi
//
//  Created by Jacy Lee on 2019/4/18.
//

#import "LXLHttpHelper.h"
#import <MJExtension/MJExtension.h>

static NSString *const SCMBaseURLString = @"http://vip5.youshang.com/api";

@implementation LXLHttpHelper
+ (void)postWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    NSDictionary *params = [param keyValues];
    // 1.获得请求管理者
    AFHTTPSessionManager *client = [AFHTTPSessionManager manager];
    [client.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    client.requestSerializer.timeoutInterval = 30.0f;
    // 2.发送POST请求
    [client POST:url parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        id result = [resultClass objectWithKeyValues:responseObject];
        if (success) {
            success(result);
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
