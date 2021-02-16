//
//  PKMoviesListItemViewModel.h
//  MoviesTestApp
//
//  Created by Eran Israel on 15/02/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class PKMoviesAPIService;
@class PKMoviesListItem;
@class UIImage;

typedef void (^PKMoviesListItemViewModelImageLoadingCompletion)(NSInteger token,UIImage * _Nullable banner, NSError* _Nullable error);

@interface PKMoviesListItemViewModel : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *popularity;
@property (nonatomic, strong, readonly, nullable) UIImage *banner;

- (instancetype)initWithService:(PKMoviesAPIService*)service  andItem:(PKMoviesListItem *)item;

- (void)loadBannerWithToken:(NSInteger)token andCompletion:(PKMoviesListItemViewModelImageLoadingCompletion)completion;

@end

NS_ASSUME_NONNULL_END
