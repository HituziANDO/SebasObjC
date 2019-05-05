//
//  SebasObjC
//
//  MIT License
//
//  Copyright (c) 2019-present Hituzi Ando
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "NSDictionary+SebasUtility.h"

@implementation NSDictionary (SebasUtility)

- (BOOL)util_isNotEmpty {
    return self.count > 0;
}

- (NSData *)util_toJSON {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        return [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
    }
    else {
        return nil;
    }
}

- (NSString *)util_toJSONString {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:self
                                                                              options:0
                                                                                error:nil]
                                     encoding:NSUTF8StringEncoding];
    }
    else {
        return nil;
    }
}

- (NSString *)util_toReadableJSONString {
    if ([NSJSONSerialization isValidJSONObject:self]) {
        return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:self
                                                                              options:NSJSONWritingPrettyPrinted
                                                                                error:nil]
                                     encoding:NSUTF8StringEncoding];
    }
    else {
        return nil;
    }
}

- (NSString *)util_toQueryString {
    NSMutableArray *arr = [NSMutableArray new];

    for (NSString *key in self.allKeys) {
        [arr addObject:[NSString stringWithFormat:@"%@=%@", key, self[key]]];
    }

    return [arr componentsJoinedByString:@"&"];
}

- (NSDictionary *)util_select:(BOOL (^)(id key, id value))block {
    NSMutableDictionary *dict = [NSMutableDictionary new];

    [self.allKeys enumerateObjectsUsingBlock:^(id key, NSUInteger idx, BOOL *stop) {
        if (block(key, self[key])) {
            dict[key] = self[key];
        }
    }];

    return dict;
}

- (NSArray *)util_map:(id (^)(id key, id value))block {
    NSMutableArray *arr = [NSMutableArray new];

    [self.allKeys enumerateObjectsUsingBlock:^(id key, NSUInteger idx, BOOL *stop) {
        [arr addObject:block(key, self[key])];
    }];

    return arr;
}

@end
