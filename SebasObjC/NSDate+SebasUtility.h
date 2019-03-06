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

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (SebasUtility)
/**
 * Converts the receiver to NSDateComponents.
 */
@property (nonatomic, readonly) NSDateComponents *util_toDateComponents;
/**
 * Returns the beginning of the receiver's day.
 */
@property (nonatomic, readonly, nullable) NSDate *util_beginningOfDay;
/**
 * Returns the end of the receiver's day.
 */
@property (nonatomic, readonly, nullable) NSDate *util_endOfDay;
/**
 * Returns the beginning of the receiver's month.
 */
@property (nonatomic, readonly, nullable) NSDate *util_beginningOfMonth;
/**
 * Returns the end of the receiver's month.
 */
@property (nonatomic, readonly, nullable) NSDate *util_endOfMonth;

/**
 * Creates a NSDate instance in GMT representation with a date-format and a date-string.
 *
 * @param format A date format(e.g. yyyy-MM-dd HH:mm:ss)
 * @param string A date string(e.g. 2019-02-14 10:23:12)
 */
+ (nullable instancetype)util_dateWithFormat:(NSString *)format string:(NSString *)string;
/**
 * Creates a NSDate instance in GMT representation with a date-format and a date-string of given `timeZone` representation.
 *
 * @param format A date format(e.g. yyyy-MM-dd HH:mm:ss)
 * @param string A date string(e.g. 2019-02-14 10:23:12)
 * @param timeZone A time zone of given date string
 */
+ (nullable instancetype)util_dateWithFormat:(NSString *)format
                                      string:(NSString *)string
                                  ofTimeZone:(NSTimeZone *)timeZone;
/**
 * Creates a NSDate instance in GMT representation with given date components.
 *
 * @param dateComponents A date components
 */
+ (nullable instancetype)util_dateWithComponents:(NSDateComponents *)dateComponents;

/**
 * Creates new NSDate instance by adding given date components.
 *
 * @param comps A date components
 */
- (nullable NSDate *)util_dateByAddingComponents:(NSDateComponents *)comps;
/**
 * Creates new NSDate instance by adding given second(s).
 *
 * @param second
 */
- (nullable NSDate *)util_dateByAddingSecond:(NSInteger)second;
/**
 * Creates new NSDate instance by adding given minute(s).
 *
 * @param minute
 */
- (nullable NSDate *)util_dateByAddingMinute:(NSInteger)minute;
/**
 * Creates new NSDate instance by adding given hour(s).
 *
 * @param hour
 */
- (nullable NSDate *)util_dateByAddingHour:(NSInteger)hour;
/**
 * Creates new NSDate instance by adding given day(s).
 *
 * @param day
 */
- (nullable NSDate *)util_dateByAddingDay:(NSInteger)day;
/**
 * Creates new NSDate instance by adding given month(s).
 *
 * @param month
 */
- (nullable NSDate *)util_dateByAddingMonth:(NSInteger)month;
/**
 * Creates new NSDate instance by adding given year(s).
 *
 * @param year
 */
- (nullable NSDate *)util_dateByAddingYear:(NSInteger)year;

@end

NS_ASSUME_NONNULL_END
