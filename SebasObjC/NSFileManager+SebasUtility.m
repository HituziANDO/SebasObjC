//
//  SebasObjC
//
//  MIT License
//
//  Copyright (c) 2020-present Hituzi Ando
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

#import "NSFileManager+SebasUtility.h"

@implementation NSFileManager (SebasUtility)

- (BOOL)util_copyItemAtPath:(NSString *)srcPath
                     toPath:(NSString *)dstPath
                      error:(NSError * _Nullable *)error {
    NSFileManager *fileManager = [NSFileManager defaultManager];

    if ([fileManager fileExistsAtPath:dstPath]) {
        if (![fileManager removeItemAtPath:dstPath error:error]) {
            return NO;
        }
    }
    return [fileManager copyItemAtPath:srcPath toPath:dstPath error:error];
}

- (BOOL)util_copyItemAtURL:(NSURL *)srcURL
                     toURL:(NSURL *)dstURL
                     error:(NSError * _Nullable *)error {
    NSFileManager *fileManager = [NSFileManager defaultManager];

    if ([fileManager fileExistsAtPath:dstURL.path]) {
        if (![fileManager removeItemAtURL:dstURL error:error]) {
            return NO;
        }
    }
    return [fileManager copyItemAtURL:srcURL toURL:dstURL error:error];
}

@end
