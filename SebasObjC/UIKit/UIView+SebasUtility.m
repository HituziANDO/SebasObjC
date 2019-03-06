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

#import "UIView+SebasUtility.h"

@implementation UIView (SebasUtility)

#pragma mark - property

- (CGFloat)util_left {
    return self.frame.origin.x;
}

- (CGFloat)util_top {
    return self.frame.origin.y;
}

- (CGFloat)util_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (CGFloat)util_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (UIImage *)util_toImage {
    return [self util_takeScreenshotWithScale:0];
}

- (UIView *)util_rootView {
    UIView *superview = self.superview;

    if (!superview) {
        return self;
    }

    return superview.util_rootView;
}

#pragma mark - public

- (void)util_removeAllSubviews {
    for (UIView *v in self.subviews) {
        [v removeFromSuperview];
    }
}

- (void)util_bringSubviewFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    UIView *v = self.subviews[fromIndex];
    [v removeFromSuperview];
    [self insertSubview:v atIndex:toIndex];
}

- (void)util_fadeIn:(BOOL)show {
    if (show) {
        [UIView animateWithDuration:.2 animations:^{
            self.alpha = 1.f;
        }];
    }
    else {
        self.alpha = 0;
    }
}

- (void)util_fadeOut:(BOOL)hide {
    if (hide) {
        [UIView animateWithDuration:.2 animations:^{
            self.alpha = 0;
        }];
    }
    else {
        self.alpha = 1.f;
    }
}

- (void)util_sizeToFitByCenter {
    CGPoint center = self.center;
    [self sizeToFit];
    self.center = center;
}

- (void)util_scaleByCenter:(CGFloat)scale {
    CGPoint center = self.center;
    self.bounds = CGRectMake(0, 0, self.bounds.size.width * scale, self.bounds.size.height * scale);
    self.center = center;
}

- (UIImage *)util_takeScreenshotWithScale:(CGFloat)scale {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, scale);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    UIImage *screenshot = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return screenshot;
}

#pragma mark - static public

+ (instancetype)util_fromNib {
    return [self util_fromNibName:NSStringFromClass([self class])];
}

+ (instancetype)util_fromNibName:(NSString *)nibName {
    return [[NSBundle mainBundle] loadNibNamed:nibName owner:nil options:nil].firstObject;
}

+ (void)util_animate:(void (^)())animations
        withDuration:(NSTimeInterval)duration
          completion:(nullable void (^)(BOOL finished))completion {

    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionAllowUserInteraction
                     animations:animations
                     completion:completion];
}

@end
