//
//  LXLHttpHelper.h
//  Kiwi
//
//  Created by Jacy Lee on 2019/4/18.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

@interface LXLHttpHelper : NSObject
+ (void)postWithUrl:(NSString *)url param:(id)param resultClass:(Class)resultClass success:(void (^)(id))success failure:(void (^)(NSError *))failure;
@end

NS_ASSUME_NONNULL_END
