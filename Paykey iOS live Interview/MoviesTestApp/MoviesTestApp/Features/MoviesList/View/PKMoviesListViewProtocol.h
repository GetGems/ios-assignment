//
//  PKMoviesListViewProtocol.h
//  MoviesTestApp
//
//  Created by Eran Israel on 15/02/2021.
//

#ifndef PKMoviesListViewProtocol_h
#define PKMoviesListViewProtocol_h

@protocol PKMoviesListViewProtocol <NSObject>

- (void)updateView;
- (void)showDetailsForIdentifier:(NSInteger)identifier;

@end

#endif /* PKMoviesListViewProtocol_h */
