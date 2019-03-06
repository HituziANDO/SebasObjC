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

#import "NSDate+SebasUtility.h"

@implementation NSDate (SebasUtility)

+ (nullable instancetype)util_dateWithFormat:(NSString *)format string:(NSString *)string {
    return [self util_dateWithFormat:format string:string ofTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
}

+ (nullable instancetype)util_dateWithFormat:(NSString *)format
                                      string:(NSString *)string
                                  ofTimeZone:(NSTimeZone *)timeZone {

    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = format;
    formatter.timeZone = timeZone;

    return [formatter dateFromString:string];
}

+ (nullable instancetype)util_dateWithComponents:(NSDateComponents *)dateComponents {
    return [[[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]
                         dateFromComponents:dateComponents];
}

- (NSDateComponents *)util_toDateComponents {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];

    return [calendar components:NSCalendarUnitYear |
                NSCalendarUnitMonth |
                NSCalendarUnitDay |
                NSCalendarUnitHour |
                NSCalendarUnitMinute |
                NSCalendarUnitSecond
                       fromDate:self];
}

- (nullable NSDate *)util_beginningOfDay {
    return [[[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian] startOfDayForDate:self];
}

- (nullable NSDate *)util_endOfDay {
    NSDateComponents *comps = [NSDateComponents new];
    comps.day = 1;
    comps.second = -1;

    return [[[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]
                         dateByAddingComponents:comps
                                         toDate:self.util_beginningOfDay
                                        options:0];
}

- (nullable NSDate *)util_beginningOfMonth {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth fromDate:self];

    return [calendar dateFromComponents:comps];
}

- (nullable NSDate *)util_endOfMonth {
    NSDateComponents *comps = [NSDateComponents new];
    comps.month = 1;
    comps.second = -1;

    return [[[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]
                         dateByAddingComponents:comps
                                         toDate:self.util_beginningOfMonth
                                        options:0];
}

- (nullable NSDate *)util_dateByAddingComponents:(NSDateComponents *)comps {
    if (!comps) {
        comps = [NSDateComponents new];
    }

    return [[[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian]
                         dateByAddingComponents:comps
                                         toDate:self
                                        options:0];
}

- (nullable NSDate *)util_dateByAddingSecond:(NSInteger)second {
    NSDateComponents *comps = [NSDateComponents new];
    comps.second = second;

    return [self util_dateByAddingComponents:comps];
}

- (nullable NSDate *)util_dateByAddingMinute:(NSInteger)minute {
    NSDateComponents *comps = [NSDateComponents new];
    comps.minute = minute;

    return [self util_dateByAddingComponents:comps];
}

- (nullable NSDate *)util_dateByAddingHour:(NSInteger)hour {
    NSDateComponents *comps = [NSDateComponents new];
    comps.hour = hour;

    return [self util_dateByAddingComponents:comps];
}

- (nullable NSDate *)util_dateByAddingDay:(NSInteger)day {
    NSDateComponents *comps = [NSDateComponents new];
    comps.day = day;

    return [self util_dateByAddingComponents:comps];
}

- (nullable NSDate *)util_dateByAddingMonth:(NSInteger)month {
    NSDateComponents *comps = [NSDateComponents new];
    comps.month = month;

    return [self util_dateByAddingComponents:comps];
}

- (nullable NSDate *)util_dateByAddingYear:(NSInteger)year {
    NSDateComponents *comps = [NSDateComponents new];
    comps.year = year;

    return [self util_dateByAddingComponents:comps];
}

@end
