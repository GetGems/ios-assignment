//
//  PKMoviesListItem.m
//  MoviesTestApp
//
//  Created by Eran Israel on 14/02/2021.
//

#import "PKMoviesListItem.h"

@interface PKMoviesListItem ()
@property (nonatomic, assign) NSInteger identifier;
@end

@implementation PKMoviesListItem


- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _title = dictionary[@"title"];
        _popularity = dictionary[@"popularity"];
        _posterPath = dictionary[@"poster_path"];
        _identifier = [dictionary[@"id"] integerValue];
    }
    return self;
}

@end
