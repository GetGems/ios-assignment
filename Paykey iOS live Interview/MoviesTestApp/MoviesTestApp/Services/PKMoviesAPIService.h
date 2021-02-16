//
//  PKMoviesAPIService.h
//  MoviesTestApp
//
//  Created by Eran Israel on 14/02/2021.
//

@import Foundation;
@class UIImage;
@class PKMoviesListItem;
@class PKMovieDetails;
@class PKMoviesServiceRequestBuilder;
@protocol PKNetworkRequests;

NS_ASSUME_NONNULL_BEGIN


typedef void (^PKMoviesServiceImageLoadingCompletion)(UIImage * _Nullable, NSError* _Nullable error);
typedef void (^PKMoviesServiceLoadMoviesCompletion)(NSArray<PKMoviesListItem *> * _Nullable movies, NSError* _Nullable error);
typedef void (^PKMoviesServiceLoadDetailsCompletion)(PKMovieDetails * _Nullable movieDetails, NSError* _Nullable error);
typedef void (^PKMoviesServiceSearchMoviesCompletion)(NSArray<PKMoviesListItem *> * _Nullable movies, NSError* _Nullable error);

@interface PKMoviesAPIService : NSObject

- (instancetype)initWithNetworkRequestor:(id<PKNetworkRequests>)requestor
                              andBuilder:(PKMoviesServiceRequestBuilder*)builder;


- (void)loadMovieBannerByPath:(NSString *)path withCompletion:(PKMoviesServiceImageLoadingCompletion)completion;
- (void)loadMoviesFromPage:(NSInteger)page withCompletion:(PKMoviesServiceLoadMoviesCompletion)completion;
- (void)loadMovieDetailsForIdentifier:(NSInteger)identifier withCompletion:(PKMoviesServiceLoadDetailsCompletion)completion;
- (void)searchMoviesByText:(NSString *)text onPage:(NSInteger)page withCompletion:(PKMoviesServiceSearchMoviesCompletion)completion;

@end

NS_ASSUME_NONNULL_END
