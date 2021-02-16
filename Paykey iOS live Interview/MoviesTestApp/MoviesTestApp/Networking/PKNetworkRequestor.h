//
//  NetworkRequestor.h
//  MoviesTestApp
//
//  Created by Eran Israel on 14/02/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^PaykeyNetworkRequestorLoadCompletion)(NSDictionary* _Nullable json, NSError* _Nullable error);
typedef void (^PaykeyNetworkRequestorLoadDataCompletion)(NSData* _Nullable data, NSError* _Nullable error);

@protocol PKNetworkRequests <NSObject>
- (void)loadRequest:(NSURLRequest*)request withCompletion:(PaykeyNetworkRequestorLoadCompletion)completion;
- (void)loadRequest:(NSURLRequest*)request withDataCompletion:(PaykeyNetworkRequestorLoadDataCompletion)completion;
@end

@interface PKNetworkRequestor : NSObject <PKNetworkRequests>
@end

NS_ASSUME_NONNULL_END
