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

#import "UIImage+SebasUtility.h"

@implementation UIImage (SebasUtility)

+ (UIImage *)util_imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = (CGRect) { CGPointZero, size };
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

- (NSData *)util_toPNG {
    return UIImagePNGRepresentation(self);
}

- (NSData *)util_toJPEG {
    return UIImageJPEGRepresentation(self, 1.0);
}

- (NSData *)util_toJPEGWithQuality:(CGFloat)quality {
    return UIImageJPEGRepresentation(self, quality);
}

- (UIImage *)util_resizedWithRect:(CGRect)rect maintainingAspectRatio:(BOOL)maintainingAspectRatio {
    return [self util_resizedWithWidth:rect.size.width
                                height:rect.size.height
                maintainingAspectRatio:maintainingAspectRatio];
}

- (UIImage *)util_resizedWithWidth:(CGFloat)width
                            height:(CGFloat)height
            maintainingAspectRatio:(BOOL)maintainingAspectRatio {
    // The scale factor to apply to the bitmap.
    // If you specify a value of 0.0, the scale factor is set to the scale factor of the device’s main screen.
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(width, height), NO, 0.0);

    if (maintainingAspectRatio) {
        CGFloat scale = self.size.width > self.size.height ? width / self.size.width : height / self.size.height;
        [self drawInRect:CGRectMake(0, 0, self.size.width * scale, self.size.height * scale)];
    }
    else {
        [self drawInRect:CGRectMake(0, 0, width, height)];
    }

    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return resizedImage;
}

- (UIImage *)util_croppedInRect:(CGRect)rect {
    CGImageRef src = self.CGImage;
    CGFloat scale = self.scale;
    CGImageRef dst = CGImageCreateWithImageInRect(src, CGRectMake(rect.origin.x * scale,
                                                                  rect.origin.y * scale,
                                                                  rect.size.width * scale,
                                                                  rect.size.height * scale));

    // Takes over the scale and direction information of the original image.
    UIImage *croppedImage = [UIImage imageWithCGImage:dst scale:scale orientation:self.imageOrientation];
    CGImageRelease(dst);

    return croppedImage;
}

- (UIImage *)util_maskedWithMaskImage:(UIImage *)maskImage {
    CGImageRef src = maskImage.CGImage;
    CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(src),
                                        CGImageGetHeight(src),
                                        CGImageGetBitsPerComponent(src),
                                        CGImageGetBitsPerPixel(src),
                                        CGImageGetBytesPerRow(src),
                                        CGImageGetDataProvider(src),
                                        NULL, NO);

    CGImageRef dst = CGImageCreateWithMask(self.CGImage, mask);
    // Sets the scale and the orientation of the original image.
    UIImage *maskedImage = [UIImage imageWithCGImage:dst scale:self.scale orientation:self.imageOrientation];

    CGImageRelease(mask);
    CGImageRelease(dst);

    return maskedImage;
}

@end
