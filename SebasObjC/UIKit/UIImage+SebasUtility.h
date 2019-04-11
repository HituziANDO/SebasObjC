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

@interface UIImage (SebasUtility)
/**
 * Returns the data converted to PNG representation.
 * (read-only)
 */
@property (nonatomic, readonly) NSData *util_toPNG;
/**
 * Returns the data converted to JPEG representation that is best quality.
 * (read-only)
 */
@property (nonatomic, readonly) NSData *util_toJPEG;
/**
 * Creates new instance filled with given color and size.
 */
+ (instancetype)util_imageWithColor:(UIColor *)color size:(CGSize)size;

/**
 * Returns the data converted to JPEG representation with quality.
 *
 * @param quality The value 0~1.0
 */
- (NSData *)util_toJPEGWithQuality:(CGFloat)quality;
/**
 * Returns resized image with given size of rect.
 *
 * @param rect A rect.
 * @param maintainingAspectRatio If YES, maintains aspect ratio.
 * @return Resized image.
 */
- (UIImage *)util_resizedWithRect:(CGRect)rect maintainingAspectRatio:(BOOL)maintainingAspectRatio;
/**
 * Returns the resized image with given size.
 *
 * @param width A width.
 * @param height A height.
 * @param maintainingAspectRatio If YES, maintains aspect ratio.
 * @return Resized image.
 */
- (UIImage *)util_resizedWithWidth:(CGFloat)width
                            height:(CGFloat)height
            maintainingAspectRatio:(BOOL)maintainingAspectRatio;
/**
 * Returns the cropped image.
 *
 * @param rect A rect.
 * @return Cropped image.
 */
- (UIImage *)util_croppedInRect:(CGRect)rect;
/**
 * Returns the masked image using given mask image.
 *
 * @param maskImage A mask image.
 * @return Masked image.
 */
- (UIImage *)util_maskedWithMaskImage:(UIImage *)maskImage;
@end

NS_ASSUME_NONNULL_END
