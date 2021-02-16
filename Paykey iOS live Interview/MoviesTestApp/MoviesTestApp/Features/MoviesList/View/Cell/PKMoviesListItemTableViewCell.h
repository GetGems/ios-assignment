//
//  PKMoviesListItemTableViewCell.h
//  MoviesTestApp
//
//  Created by Eran Israel on 16/02/2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString * _Nonnull const kPKMoviesListItemTableViewCellIdentifier;

@class PKMoviesListItemViewModel;

@interface PKMoviesListItemTableViewCell : UITableViewCell

- (void)populateCellWithViewModel:(PKMoviesListItemViewModel *)viewModel;

@end

NS_ASSUME_NONNULL_END
