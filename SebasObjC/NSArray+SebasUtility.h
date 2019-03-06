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

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (SebasUtility)
/**
 *
 */
- (NSArray *)util_filter:(BOOL (^)(id obj, NSUInteger idx))block;
/**
 *
 */
- (NSArray *)util_map:(id (^)(id obj, NSUInteger idx))block;
/**
 *
 */
- (NSArray *)util_flatMap:(NSArray *(^)(id obj, NSUInteger idx))block;
/**
 *
 */
- (id)util_reduce:(id)initialValue withBlock:(id (^)(id accumulator, id obj, NSUInteger idx))block;
/**
 * Returns a maximum element. The block will return YES if obj1 is greater than obj2, otherwise NO.
 */
- (nullable id)util_max:(BOOL (^)(id obj1, id obj2))block;
/**
 * Returns a minimum element. The block will return YES if obj1 is less than obj2, otherwise NO.
 */
- (nullable id)util_min:(BOOL (^)(id obj1, id obj2))block;
/**
 * Returns new array flattened 1 depth nested array.
 */
- (NSArray *)util_flattened;
/**
 * Returns new array sorted by ascending.
 */
- (NSArray *)util_sorted;
/**
 * Returns new array that the elements is reversed.
 */
- (NSArray *)util_reversed;
/**
 * Returns new array with null and an empty string removed.
 */
- (NSArray *)util_compact;
/**
 * Returns new array with duplicate elements removed.
 */
- (NSArray *)util_unique;
/**
 * Returns an object selected at random. If the array is empty, `util_sample` returns nil.
 */
- (nullable id)util_sample;

@end

NS_ASSUME_NONNULL_END

