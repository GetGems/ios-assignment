//
//  PKMoviesListViewController.m
//  MoviesTestApp
//
//  Created by Eran Israel on 15/02/2021.
//

#import "PKMoviesListViewController.h"
#import "PKMoviesListViewProtocol.h"
#import "PKMoviesListViewModel.h"
#import "PKMoviesAPIService.h"
#import "PKNetworkRequestor.h"
#import "PKMoviesServiceRequestBuilder.h"
#import "PKMoviesListItemTableViewCell.h"

@interface PKMoviesListViewController ()  <UITableViewDataSource, UITableViewDelegate, PKMoviesListViewProtocol>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) PKMoviesListViewModel *viewModel;
@property (nonatomic, strong) PKMoviesAPIService* service;
@end

@implementation PKMoviesListViewController

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupController];
    [self.viewModel viewDidLoad];
}

#pragma mark - Private methods

- (void)setupController {
    self.viewModel = [[PKMoviesListViewModel alloc] initWithService:self.service andView:self];
    UINib *nib = [UINib nibWithNibName:kPKMoviesListItemTableViewCellIdentifier bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:kPKMoviesListItemTableViewCellIdentifier];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (PKMoviesAPIService*)service {
    if(_service == nil) {
        _service = [[PKMoviesAPIService alloc] initWithNetworkRequestor:[PKNetworkRequestor new]
                                                                            andBuilder:[PKMoviesServiceRequestBuilder new]];
    }
    
    return _service;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfMovies];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PKMoviesListItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPKMoviesListItemTableViewCellIdentifier forIndexPath:indexPath];
    
    PKMoviesListItemViewModel *itemViewModel = [self.viewModel itemViewModelForRow:indexPath.row];
    [cell populateCellWithViewModel:itemViewModel];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.viewModel selectedRow:indexPath.row];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == [self.viewModel numberOfMovies] - 2) {
        [self.viewModel loadUpData];
    }
}

#pragma mark - OHMoviesListViewProtocol

- (void)updateView {
    [self.tableView reloadData];
}

- (void)showDetailsForIdentifier:(NSInteger)identifier {
}

@end
