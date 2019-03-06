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

#import "UIAlertController+SebasUtility.h"

@interface SebasPromptController : UIAlertController <UITextFieldDelegate>

@property (nonatomic, copy) NSString *inputText;

@end

@implementation SebasPromptController

- (instancetype)initWithTitle:(nullable NSString *)title
                      message:(nullable NSString *)message
                 commitButton:(nullable NSString *)commitButton
                 cancelButton:(nullable NSString *)cancelButton
                         text:(nullable NSString *)text
                  placeholder:(nullable NSString *)placeholder
                commitHandler:(nullable void (^)(NSString *))commitHandler
                cancelHandler:(nullable void (^)(void))cancelHandler {

    if (commitButton.length <= 0) {
        commitButton = @"OK";
    }

    if (cancelButton.length <= 0) {
        cancelButton = @"CANCEL";
    }

    self = [SebasPromptController alertControllerWithTitle:title
                                                   message:message
                                            preferredStyle:UIAlertControllerStyleAlert];

    [self addAction:[UIAlertAction actionWithTitle:commitButton
                                             style:UIAlertActionStyleDefault
                                           handler:^(UIAlertAction *_Nonnull action) {
                                               if (commitHandler) {
                                                   commitHandler(self.inputText);
                                               }
                                           }]];

    [self addAction:[UIAlertAction actionWithTitle:cancelButton
                                             style:UIAlertActionStyleCancel
                                           handler:^(UIAlertAction *_Nonnull action) {
                                               if (cancelHandler) {
                                                   cancelHandler();
                                               }
                                           }]];

    __weak SebasPromptController *weakSelf = self;
    [self addTextFieldWithConfigurationHandler:^(UITextField *_Nonnull textField) {
        textField.text = text;
        textField.placeholder = placeholder;
        textField.delegate = weakSelf;
        textField.returnKeyType = UIReturnKeyDone;
    }];

    return self;
}

#pragma mark UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.inputText = textField.text;
}

@end

@implementation UIAlertController (SebasUtility)

+ (void)util_showSimpleAlertControllerWithMessage:(NSString *)message
                                         okButton:(NSString *)okButton
                               fromViewController:(UIViewController *)viewController {

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];

    if (okButton.length <= 0) {
        okButton = @"OK";
    }

    [alertController addAction:[UIAlertAction actionWithTitle:okButton
                                                        style:UIAlertActionStyleDefault
                                                      handler:nil]];

    [viewController presentViewController:alertController animated:YES completion:nil];
}

+ (void)util_showPromptControllerWithTitle:(NSString *)title
                                   message:(NSString *)message
                              commitButton:(NSString *)commitButton
                              cancelButton:(NSString *)cancelButton
                                      text:(NSString *)text
                               placeholder:(NSString *)placeholder
                             commitHandler:(void (^)(NSString *text))commitHandler
                             cancelHandler:(void (^)(void))cancelHandler
                        fromViewController:(UIViewController *)viewController {

    SebasPromptController *promptController = [[SebasPromptController alloc] initWithTitle:title
                                                                                   message:message
                                                                              commitButton:commitButton
                                                                              cancelButton:cancelButton
                                                                                      text:text
                                                                               placeholder:placeholder
                                                                             commitHandler:commitHandler
                                                                             cancelHandler:cancelHandler];

    [viewController presentViewController:promptController animated:YES completion:nil];
}

@end
