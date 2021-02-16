//
//  PKMoviesListViewModel.h
//  MoviesTestApp
//
//  Created by Eran Israel on 15/02/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PKMoviesListViewProtocol;
@class PKMoviesListItemViewModel;
@class PKMoviesAPIService;

@interface PKMoviesListViewModel : NSObject

- (instancetype)initWithService:(PKMoviesAPIService*)service andView:(id<PKMoviesListViewProtocol>)view;

- (void)loadUpData;
- (void)viewDidLoad;
- (void)selectedRow:(NSInteger)row;
- (NSInteger)numberOfMovies;
- (PKMoviesListItemViewModel *)itemViewModelForRow:(NSInteger)row;


@end

NS_ASSUME_NONNULL_END
