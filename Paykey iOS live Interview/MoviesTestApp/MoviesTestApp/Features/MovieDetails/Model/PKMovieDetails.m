//
//  PKMovieDetails.m
//  MoviesTestApp
//
//  Created by Eran Israel on 14/02/2021.
//

#import "PKMovieDetails.h"

@interface PKMovieDetails ()
@property (nonatomic, strong) NSString *posterPath;
@property (nonatomic, strong) NSString *details;
@end

@implementation PKMovieDetails

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        NSData *data =[NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:nil];
        NSString *prettyJSONString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        _details = prettyJSONString;
        _posterPath = dictionary[@"poster_path"];
    }
    return self;
}


@end
