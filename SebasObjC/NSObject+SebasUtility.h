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

@interface NSObject (SebasUtility)
/**
 * Returns the property names of this class.
 */
@property (class, nonatomic, copy, readonly) NSArray<NSString *> *util_propertyNames;
/**
 * Returns the property list of this class. The representation of the property list is {property name, property type}.
 */
@property (class, nonatomic, copy, readonly) NSDictionary<NSString *, NSString *> *util_properties;

/**
 * Tells whether given `propertyName` is primitive type.
 *
 * @param propertyName A property name.
 * @param propertyType Outputs a type of given property. The symbol of primitive type is following:
 *
 *  int = i
 *  unsigned int = I
 *  NSInteger = q
 *  long = q
 *  long long int = q
 *  unsigned long long int = Q
 *  float = f
 *  double = d
 *  CGFloat = d
 *
 * @return YES if given property is primitive type, otherwise NO.
 */
+ (BOOL)util_isPrimitiveType:(NSString *)propertyName type:(NSString *_Nullable *_Nullable)propertyType;

@end

NS_ASSUME_NONNULL_END
