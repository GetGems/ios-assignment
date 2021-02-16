//
//  PKMoviesListItem.h
//  MoviesTestApp
//
//  Created by Eran Israel on 14/02/2021.
//

#import <Foundation/Foundation.h>
@import UIKit;

NS_ASSUME_NONNULL_BEGIN

@interface PKMoviesListItem : NSObject

@property (nonatomic, strong, nullable) UIImage *banner;
@property (nonatomic, assign, readonly) NSInteger identifier;
@property (nonatomic, strong, readonly) NSNumber *popularity;
@property (nonatomic, copy, readonly) NSString *posterPath;
@property (nonatomic, copy, readonly) NSString *title;


- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
@end


NS_ASSUME_NONNULL_END
