//
//  NSString+URLEncoding.m
//  MoviesTestApp
//
//  Created by Eran Israel on 14/02/2021.
//

#import "NSString+URLEncoding.h"

@implementation NSString (URLEncoding)

- (NSString *)urlEncodedString {
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"!@#$%&*()+'\";:=,/?[] "]];
}


@end
