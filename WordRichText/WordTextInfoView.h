//
//  WordTextInfoView.h
//  WordRichText
//
//  Created by lazy on 13-10-17.
//  Copyright (c) 2013年 lazy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WordRichTextView.h"

@interface WordTextInfoView : UIView

@property (nonatomic, strong) WordRichTextView *indexView;
@property (nonatomic, strong) WordRichTextView *meaningView;

- (void)setIndex:(NSInteger)index;
- (void)setMeaning:(NSString *)meaning;

- (CGFloat)adjustHeight;

@end
