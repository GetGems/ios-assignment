//
//  PKMoviesListViewModel.m
//  MoviesTestApp
//
//  Created by Eran Israel on 15/02/2021.
//

#import "PKMoviesListViewModel.h"
#import "PKMoviesListItemViewModel.h"
#import "PKMoviesListItem.h"
#import "PKMoviesListViewProtocol.h"
#import "PKMoviesAPIService.h"


@interface PKMoviesListViewModel ()
@property (nonatomic, assign) NSUInteger currentPage;
@property (nonatomic, weak) id<PKMoviesListViewProtocol> view;
@property (nonatomic, strong) NSMutableArray<PKMoviesListItem *> *movies;
@property (nonatomic, strong) PKMoviesAPIService* service;
@end

@implementation PKMoviesListViewModel

#pragma mark - Initialization

- (instancetype)initWithService:(PKMoviesAPIService*)service andView:(id<PKMoviesListViewProtocol>)view {
    self = [super init];
    if (self) {
        _view = view;
        _currentPage = 0;
        _movies = [NSMutableArray array];
        _service = service;
    }
    return self;
}

#pragma mark - Public methods

- (void)loadUpData {
    __weak PKMoviesListViewModel *weakSelf = self;
    [self loadNextPageWithCompletion:^{
        [weakSelf.view updateView];
    }];
}

- (void)viewDidLoad {
    [self loadUpData];
}

- (void)selectedRow:(NSInteger)row {
    PKMoviesListItem *item = self.movies[row];
    [self.view showDetailsForIdentifier:item.identifier];
}

#pragma mark - Data Source

- (NSInteger)numberOfMovies {
    return [self.movies count];
}

- (PKMoviesListItemViewModel *)itemViewModelForRow:(NSInteger)row {
    PKMoviesListItem *item = self.movies[row];
    return [[PKMoviesListItemViewModel alloc] initWithService:self.service andItem:item];
}

#pragma mark - Private methods

- (void)loadNextPageWithCompletion:(void (^)(void))completion {
    __weak PKMoviesListViewModel *weakSelf = self;
    [self.service loadMoviesFromPage:++self.currentPage withCompletion:
     ^(NSArray<PKMoviesListItem *> * _Nullable movies, NSError * _Nullable error) {
        if (error){
            // TODO: Handle error
        } else {
            [weakSelf.movies addObjectsFromArray:movies];
        }
        if (completion){
            completion();
        }
    }];
}

@end
