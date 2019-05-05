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

#import <CommonCrypto/CommonCrypto.h>

#import "NSString+SebasUtility.h"

@implementation NSString (SebasUtility)

- (BOOL)util_isNotEmpty {
    return self.length > 0;
}

- (NSData *)util_toUTF8Data {
    return [self dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSData *)util_toUTF16Data {
    return [self dataUsingEncoding:NSUTF16StringEncoding];
}

- (NSData *)util_toASCIIData {
    return [self dataUsingEncoding:NSASCIIStringEncoding];
}

#ifdef TARGET_OS_IPHONE

- (UIImage *)util_toQRCodeImage {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];

    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    [filter setValue:data forKey:@"inputMessage"];

    CIImage *outputImage = [filter.outputImage imageByApplyingTransform:CGAffineTransformMakeScale(10.0, 10.0)];
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgImage = [context createCGImage:outputImage fromRect:outputImage.extent];
    UIImage *image = [UIImage imageWithCGImage:cgImage scale:2.f orientation:UIImageOrientationUp];

    CFRelease(cgImage);

    return image;
}

#endif

- (unsigned int)util_toHexInt {
    unsigned int x;
    [[NSScanner scannerWithString:self] scanHexInt:&x];

    return x;
}

- (nullable NSString *)util_toMD5 {
    if (self.length == 0) {
        return nil;
    }

    const char *data = [self UTF8String];
    CC_LONG len = (CC_LONG) self.length;
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(data, len, result);

    NSMutableString *string = @"".mutableCopy;

    for (int i = 0; i < 16; i++) {
        [string appendFormat:@"%02X", result[i]];
    }

    return string;
}

- (nullable NSString *)util_toSHA1 {
    if (self.length == 0) {
        return nil;
    }

    NSData *data = [self dataUsingEncoding:NSASCIIStringEncoding];
    CC_LONG len = (CC_LONG) data.length;
    unsigned char result[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, len, result);

    NSMutableString *string = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];

    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [string appendFormat:@"%02x", result[i]];
    }

    return string;
}

+ (instancetype)util_hexStringWithData:(NSData *)data {
    const unsigned char *buff = (const unsigned char *) data.bytes;

    if (!buff) {
        return [NSString string];
    }

    const NSUInteger len = data.length;
    NSMutableString *hexStr = [NSMutableString stringWithCapacity:len * 2];

    for (NSInteger i = 0; i < len; i++) {
        [hexStr appendString:[NSString stringWithFormat:@"%02lx", (unsigned long) buff[i]]];
    }

    return [NSString stringWithString:hexStr];
}

- (BOOL)util_appendToFile:(NSString *)path encoding:(NSStringEncoding)encoding {
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        // Append
        NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:path];
        [fileHandle seekToEndOfFile];
        [fileHandle writeData:[self dataUsingEncoding:encoding]];

        return YES;
    }

    return NO;
}

- (BOOL)util_appendOrWriteToFile:(NSString *)path
                      atomically:(BOOL)atomically
                        encoding:(NSStringEncoding)encoding
                           error:(NSError *_Nullable *)error {

    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        // Append
        NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:path];
        [fileHandle seekToEndOfFile];
        [fileHandle writeData:[self dataUsingEncoding:encoding]];

        return YES;
    }
    else {
        // Create
        return [self writeToFile:path atomically:atomically encoding:encoding error:error];
    }
}

- (NSString *)util_replacedString:(NSString *)aString withString:(NSString *)bString {
    return [[self componentsSeparatedByString:aString] componentsJoinedByString:bString];
}

#ifdef TARGET_OS_IPHONE

- (CGSize)util_sizeWithFont:(UIFont *)font {
    return [self sizeWithAttributes:@{ NSFontAttributeName: font }];
}

+ (CGFloat)util_heightWithFont:(UIFont *)font {
    return [[NSString string] sizeWithAttributes:@{ NSFontAttributeName: font }].height;
}

#endif

@end
