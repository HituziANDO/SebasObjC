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

@interface UIView (SebasUtility)
/**
 * Returns left value of the frame.
 */
@property (nonatomic, readonly) CGFloat util_left;
/**
 * Returns top value of the frame.
 */
@property (nonatomic, readonly) CGFloat util_top;
/**
 * Returns right value of the frame.
 */
@property (nonatomic, readonly) CGFloat util_right;
/**
 * Returns bottom value of the frame.
 */
@property (nonatomic, readonly) CGFloat util_bottom;
/**
 * Converts to the UIImage object.
 */
@property (nonatomic, readonly) UIImage *util_toImage;
/**
 * Returns the ancestor view of this view.
 */
@property (nonatomic, readonly) UIView *util_rootView;

/**
 * Removes all subviews.
 */
- (void)util_removeAllSubviews;
/**
 * Brings a subview from `fromIndex` to `toIndex`.
 */
- (void)util_bringSubviewFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex;
/**
 * Runs fade-in animation.
 *
 * @param show Fade in if YES, otherwise hides this view.
 */
- (void)util_fadeIn:(BOOL)show;
/**
 * Runs fade-out animation.
 *
 * @param hide Fade out if YES, otherwise shows this view.
 */
- (void)util_fadeOut:(BOOL)hide;
/**
 * Resizes and moves the receiver view by the center point so it just encloses its subviews.
 */
- (void)util_sizeToFitByCenter;
/**
 * Resizes the receiver view with given scale by the center point.
 *
 * @param scale A scale
 */
- (void)util_scaleByCenter:(CGFloat)scale;
/**
 * Takes a screenshot of the receiver view.
 */
- (UIImage *)util_takeScreenshotWithScale:(CGFloat)scale;

/**
 * Creates the instance from the class name nib file.
 */
+ (nullable instancetype)util_fromNib;
/**
 * Creates the instance from given nib file.
 */
+ (nullable instancetype)util_fromNibName:(NSString *)nibName;
/**
 * Animation utility.
 */
+ (void)util_animate:(void (^)(void))animations
        withDuration:(NSTimeInterval)duration
          completion:(nullable void (^)(BOOL finished))completion DEPRECATED_ATTRIBUTE;

@end

NS_ASSUME_NONNULL_END
