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

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (SebasUtility)
/**
 * Tells whether the receiver is empty string or nil.
 */
@property (nonatomic, readonly) BOOL util_isEmpty;
/**
 * Returns UTF8 encoded data.
 */
@property (nonatomic, readonly) NSData *util_toUTF8Data;
/**
 * Returns UTF16 encoded data.
 */
@property (nonatomic, readonly) NSData *util_toUTF16Data;
/**
 * Returns ASCII encoded data.
 */
@property (nonatomic, readonly) NSData *util_toASCIIData;
/**
 * Converts the receiver to a QR code image.
 */
@property (nonatomic, readonly) UIImage *util_toQRCodeImage;
/**
 * Converts the receiver hexadecimal character string to hexadecimal positive number.
 */
@property (nonatomic, readonly) unsigned int util_toHexInt;
/**
 * Returns MD5 hash value. If the number of characters is 0, the receiver returns nil.
 */
@property (nonatomic, readonly, nullable) NSString *util_toMD5;
/**
 * Returns SHA1 hash value. If the number of characters is 0, the receiver returns nil.
 */
@property (nonatomic, readonly, nullable) NSString *util_toSHA1;

/**
 * Converts NSData to hexadecimal character string.
 */
+ (instancetype)util_hexStringWithData:(NSData *)data;

/**
 * Appends the receiver to given file.
 *
 * @param path The file to which to append the receiver.
 * @param encoding The encoding to use for the output.
 * @return YES if the file is appended successfully, otherwise NO (if the file doesn't exist).
 */
- (BOOL)util_appendToFile:(NSString *)path encoding:(NSStringEncoding)encoding;
/**
 * Appends the receiver to given file if the file exists, otherwise writes to new file.
 *
 * @param path The file to which to write or append the receiver.
 * @param atomically If YES, the receiver is written to an auxiliary file, and then the auxiliary file is renamed to path.
 * If NO, the receiver is written directly to path. The YES option guarantees that path, if it exists at all,
 * won’t be corrupted even if the system should crash during writing.
 * @param encoding The encoding to use for the output.
 * @param error If there is an error, upon return contains an NSError object that describes the problem.
 * If you are not interested in details of errors, you may pass in NULL.
 * @return YES if the file is written or appended successfully, otherwise NO.
 */
- (BOOL)util_appendOrWriteToFile:(NSString *)path
                      atomically:(BOOL)atomically
                        encoding:(NSStringEncoding)encoding
                           error:(NSError *_Nullable *)error;
/**
 * Returns new string entirely replaced `aString` with `bString`.
 */
- (NSString *)util_replacedString:(NSString *)aString withString:(NSString *)bString;
/**
 * Returns the size of the receiver when specified font is applied.
 */
- (CGSize)util_sizeWithFont:(UIFont *)font;

/**
 * Returns the height when specified font is applied.
 */
+ (CGFloat)util_heightWithFont:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END
