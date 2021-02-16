//
//  PKMoviesListItemViewModel.m
//  MoviesTestApp
//
//  Created by Eran Israel on 15/02/2021.
//

#import "PKMoviesListItemViewModel.h"
#import "PKMoviesListItem.h"
#import "PKMoviesAPIService.h"

@interface PKMoviesListItemViewModel ()
@property (nonatomic, strong) PKMoviesListItem *item;
@property (nonatomic, strong) PKMoviesAPIService* service;
@end

@implementation PKMoviesListItemViewModel

#pragma mark - Initialization

- (instancetype)initWithService:(PKMoviesAPIService*)service  andItem:(PKMoviesListItem *)item {
    self = [super init];
    if (self) {
        _item = item;
        _service = service;
    }
    return self;
}

#pragma map - Public methods

- (UIImage *)banner {
    return self.item.banner;
}

- (NSString *)title {
    return self.item.title;
}

- (NSString *)popularity {
    return [self.item.popularity stringValue];
}

- (void)loadBannerWithToken:(NSInteger)token andCompletion:(PKMoviesListItemViewModelImageLoadingCompletion)completion {
    if (self.item.banner) {
        completion(token, self.item.banner, nil);
        return;
    }
    
    __weak PKMoviesListItemViewModel *weakSelf = self;
    [self.service loadMovieBannerByPath:self.item.posterPath withCompletion:
     ^(UIImage * _Nullable image, NSError * _Nullable error) {
        weakSelf.item.banner = image;
        if (completion){
            completion(token, image, error);
        }
    }];
}

@end
