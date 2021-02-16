//
//  PKMoviesServiceRequestBuilder.h
//  MoviesTestApp
//
//  Created by Eran Israel on 14/02/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PKMoviesServiceRequestBuilder : NSObject

- (NSURLRequest *)moviesFromPage:(NSInteger)page;
- (NSURLRequest *)movieBannerByPath:(NSString *)path;
- (NSURLRequest *)movieDetailsForIdentifier:(NSInteger)identifier;
- (NSURLRequest *)searchByText:(NSString *)text onPage:(NSInteger)page;

@end

NS_ASSUME_NONNULL_END
