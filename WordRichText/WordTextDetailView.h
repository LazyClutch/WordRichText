//
//  WordTextDetailView.h
//  WordRichText
//
//  Created by lazy on 13-10-17.
//  Copyright (c) 2013年 lazy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WordRichTextView.h"

@interface WordTextDetailView : UIView<UIGestureRecognizerDelegate>

@property (nonatomic, strong) WordRichTextView *titleView;
@property (nonatomic, strong) WordRichTextView *detailView;

- (void)setTitle:(NSString *)title;
- (void)setDetail:(NSString *)detail;

- (CGFloat)adjustHeight;

@end
