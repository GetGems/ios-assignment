//
//  PKMoviesAPIService.m
//  MoviesTestApp
//
//  Created by Eran Israel on 14/02/2021.
//

#import "PKMoviesAPIService.h"
#import "PKNetworkRequestor.h"
#import "PKMoviesServiceRequestBuilder.h"
#import "PKMoviesListItem.h"
#import "PKMovieDetails.h"


@import UIKit;

@interface PKMoviesAPIService ()
@property (nonatomic, strong) NSMutableDictionary *bannersCache;
@property (nonatomic, strong) id<PKNetworkRequests> requestor;
@property (nonatomic, strong) PKMoviesServiceRequestBuilder *requestBuilder;
@end

@implementation PKMoviesAPIService

#pragma mark - Initialization

- (instancetype)initWithNetworkRequestor:(id<PKNetworkRequests>)requestor
                              andBuilder:(PKMoviesServiceRequestBuilder*)builder {
    self = [super init];
    if (self) {
        _requestor = requestor;
        _requestBuilder = builder;
        _bannersCache = [NSMutableDictionary new];
    }
    return self;
}

#pragma mark - Public methods

- (void)loadMoviesFromPage:(NSInteger)page withCompletion:(PKMoviesServiceLoadMoviesCompletion)completion {
    NSURLRequest *request = [self.requestBuilder moviesFromPage:page];
    [self.requestor loadRequest:request withCompletion:^(NSDictionary * _Nullable json, NSError * _Nullable error) {
        NSMutableArray *movies = [NSMutableArray<PKMoviesListItem*> new];
        NSArray *results = json[@"results"];
        if (results) {
            for (NSDictionary *result in results) {
                PKMoviesListItem *item = [[PKMoviesListItem alloc] initWithDictionary:result];
                [movies addObject:item];
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion([movies copy], error);
        });
    }];
}

- (void)loadMovieBannerByPath:(NSString *)path withCompletion:(PKMoviesServiceImageLoadingCompletion)completion {
    UIImage *banner = self.bannersCache[path];
    if (banner) {
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(banner, nil);
        });
        return;
    }
    
    __weak PKMoviesAPIService *weakSelf = self;
    NSURLRequest *request = [self.requestBuilder movieBannerByPath:path];
    [self.requestor loadRequest:request withDataCompletion:^(NSData * _Nullable data, NSError * _Nullable error) {
        UIImage *banner = [UIImage imageWithData:data];
        weakSelf.bannersCache[path] = banner;
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(banner, nil);
        });
    }];
}

- (void)loadMovieDetailsForIdentifier:(NSInteger)identifier withCompletion:(PKMoviesServiceLoadDetailsCompletion)completion {
    NSURLRequest *request = [self.requestBuilder movieDetailsForIdentifier:identifier];
    [self.requestor loadRequest:request withCompletion:^(NSDictionary * _Nullable json, NSError * _Nullable error) {
        PKMovieDetails *movieDetails = [[PKMovieDetails alloc] initWithDictionary:json];
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(movieDetails, error);
        });
    }];
}

- (void)searchMoviesByText:(NSString *)text onPage:(NSInteger)page withCompletion:(PKMoviesServiceSearchMoviesCompletion)completion {
    NSURLRequest *request = [self.requestBuilder searchByText:text onPage:page];
    [self.requestor loadRequest:request withCompletion:
     ^(NSDictionary * _Nullable json, NSError * _Nullable error) {
        NSMutableArray *movies = [NSMutableArray<PKMoviesListItem*> new];
        NSArray *results = json[@"results"];
        if (results) {
            for (NSDictionary *result in results){
                PKMoviesListItem *item = [[PKMoviesListItem alloc] initWithDictionary:result];
                [movies addObject:item];
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion([movies copy], error);
        });
    }];
}

@end
