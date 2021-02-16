//
//  PKNetworkRequestor.m
//  MoviesTestApp
//
//  Created by Eran Israel on 14/02/2021.
//

#import "PKNetworkRequestor.h"

@interface PKNetworkRequestor ()
@property (nonatomic, strong) NSURLSession *session;
@end

@implementation PKNetworkRequestor

- (instancetype)init {
    self = [super init];
    if (self) {
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        _session = [NSURLSession sessionWithConfiguration:configuration];
    }
    return self;
}

- (void)loadRequest:(NSURLRequest*)request withCompletion:(PaykeyNetworkRequestorLoadCompletion)completion {
    [[self.session dataTaskWithRequest:request completionHandler:
      ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
         if (error)
         {
             completion(nil, error);
         }
         
         NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
         return completion(json, error);
    }] resume];
}

- (void)loadRequest:(NSURLRequest *)request withDataCompletion:(PaykeyNetworkRequestorLoadDataCompletion)completion {
    [[self.session dataTaskWithRequest:request completionHandler:
      ^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        return completion(data, error);
    }] resume];
}

@end
