//
//  PKMoviesServiceRequestBuilder.m
//  MoviesTestApp
//
//  Created by Eran Israel on 14/02/2021.
//

#import "PKMoviesServiceRequestBuilder.h"
#import "NSString+URLEncoding.h"

static NSString * const kOHMoviesServiceAPIBase = @"https://api.themoviedb.org/3";
static NSString * const kOHMoviesServiceAPIKey = @"f6416201b1ff19caeb19a3432c423e33";
static NSString * const kOHMoviesServiceAPIImageBase = @"https://image.tmdb.org/t/p/original";

@implementation PKMoviesServiceRequestBuilder

- (NSURLRequest *)moviesFromPage:(NSInteger)page {
    NSString *stringURL = [NSString stringWithFormat:@"%@/movie/popular?api_key=%@&language=en-US&page=%ld",
                           kOHMoviesServiceAPIBase,
                           kOHMoviesServiceAPIKey,
                           page];
    
    NSURL *url = [NSURL URLWithString:stringURL];
    return [NSURLRequest requestWithURL:url];
}

- (NSURLRequest *)movieBannerByPath:(NSString *)path {
    NSString *stringURL = [NSString stringWithFormat:@"%@%@",
                           kOHMoviesServiceAPIImageBase,
                           path];
    
    NSURL *url = [NSURL URLWithString:stringURL];
    return [NSURLRequest requestWithURL:url];
}

- (NSURLRequest *)movieDetailsForIdentifier:(NSInteger)identifier {
    NSString *stringURL = [NSString stringWithFormat:@"%@/movie/%ld?api_key=%@&language=en-US",
                           kOHMoviesServiceAPIBase,
                           identifier,
                           kOHMoviesServiceAPIKey];
    
    NSURL *url = [NSURL URLWithString:stringURL];
    return [NSURLRequest requestWithURL:url];
}

- (NSURLRequest *)searchByText:(NSString *)text onPage:(NSInteger)page {
    NSString *stringURL = [NSString stringWithFormat:@"%@/search/movie?api_key=%@&language=en-US&query=%@&page=%ld&include_adult=false",
                           kOHMoviesServiceAPIBase,
                           kOHMoviesServiceAPIKey,
                           [text urlEncodedString],
                           page];
    
    NSURL *url = [NSURL URLWithString:stringURL];
    return [NSURLRequest requestWithURL:url];
}

@end
