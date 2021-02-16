//
//  PKMoviesListItemTableViewCell.m
//  MoviesTestApp
//
//  Created by Eran Israel on 16/02/2021.
//

#import "PKMoviesListItemTableViewCell.h"
#import "PKMoviesListItemViewModel.h"

@interface PKMoviesListItemTableViewCell ()
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UIImageView *movieImageView;
@end

NSString * const kPKMoviesListItemTableViewCellIdentifier = @"PKMoviesListItemTableViewCell";

@implementation PKMoviesListItemTableViewCell

#pragma mark - LifeCycle

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.movieImageView.image = nil;
}

#pragma mark - Public methods

- (void)populateCellWithViewModel:(PKMoviesListItemViewModel *)viewModel {
    
    self.titleLabel.text = viewModel.title;
    self.movieImageView.image = viewModel.banner;
        
    __weak PKMoviesListItemTableViewCell *weakSelf = self;
    [viewModel loadBannerWithToken:viewModel.hash andCompletion:
     ^(NSInteger token, UIImage * _Nullable banner, NSError * _Nullable error) {
        if (token == viewModel.hash && weakSelf.movieImageView.image == nil){
            weakSelf.movieImageView.image = banner;
        }
    }];
}

@end
