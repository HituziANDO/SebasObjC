//
//  SebasObjC
//
//  MIT License
//
//  Copyright (c) 2018-present Hituzi Ando
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

#import "NSArray+SebasUtility.h"

@implementation NSArray (SebasUtility)

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

- (NSArray *)util_filter:(BOOL (^)(id, NSUInteger))block {
    NSMutableArray *arr = [NSMutableArray new];

    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (block(obj, idx)) {
            [arr addObject:obj];
        }
    }];

    return arr;
}

- (NSArray *)util_map:(id (^)(id, NSUInteger))block {
    NSMutableArray *arr = [NSMutableArray new];

    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [arr addObject:block(obj, idx)];
    }];

    return arr;
}

- (NSArray *)util_flatMap:(NSArray *(^)(id obj, NSUInteger idx))block {
    NSMutableArray *arr = [NSMutableArray new];

    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [block(obj, idx) enumerateObjectsUsingBlock:^(id elem, NSUInteger idx, BOOL *stop) {
            [arr addObject:elem];
        }];
    }];

    return arr;
}

- (id)util_reduce:(id)initialValue withBlock:(id (^)(id accumulator, id obj, NSUInteger idx))block {
    __block id accumulator = initialValue;

    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        accumulator = block(accumulator, obj, idx);
    }];

    return accumulator;
}

- (id)util_max:(BOOL (^)(id obj1, id obj2))block {
    __block id max = self.firstObject;

    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (1 <= idx && idx < self.count) {
            max = block(max, obj) ? max : obj;
        }
    }];

    return max;
}

- (id)util_min:(BOOL (^)(id obj1, id obj2))block {
    __block id min = self.firstObject;

    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (1 <= idx && idx < self.count) {
            min = block(min, obj) ? min : obj;
        }
    }];

    return min;
}

- (NSArray *)util_flattened {
    NSMutableArray *arr = [NSMutableArray new];

    [self enumerateObjectsUsingBlock:^(NSArray *a, NSUInteger idx, BOOL *stop) {
        [a enumerateObjectsUsingBlock:^(id elem, NSUInteger idx, BOOL *stop) {
            [arr addObject:elem];
        }];
    }];

    return arr;
}

- (NSArray *)util_sorted {
    return [self sortedArrayUsingComparator:^NSComparisonResult(id _Nonnull obj1, id _Nonnull obj2) {
        return [obj1 compare:obj2 options:NSCaseInsensitiveSearch | NSNumericSearch];
    }];
}

- (NSArray *)util_reversed {
    return self.reverseObjectEnumerator.allObjects;
}

- (NSArray *)util_compact {
    NSMutableArray *arr = [NSMutableArray new];

    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (!(obj == [NSNull null] || ([obj isKindOfClass:[NSString class]] && ((NSString *) obj).length <= 0))) {
            [arr addObject:obj];
        }
    }];

    return arr;
}

- (NSArray *)util_unique {
    return [NSOrderedSet orderedSetWithArray:self].array;
}

- (id)util_sample {
    if (self.count <= 0) {
        return nil;
    }

    return self[arc4random_uniform(self.count)];
}

@end
