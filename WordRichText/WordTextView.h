//
//  WordTextView.h
//  WordRichText
//
//  Created by lazy on 13-10-17.
//  Copyright (c) 2013年 lazy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WordTextDetailView.h"
#import "WordTextInfoView.h"

@interface WordTextView : UIView

@property (nonatomic, strong) WordTextInfoView *textInfoView;
@property (nonatomic, strong) WordTextDetailView *textDetailView;

- (void)setIndex:(NSInteger)index;
- (void)setMeaning:(NSString *)meaning;
- (void)setTitle:(NSString *)title;
- (void)setDetail:(NSString *)detail;

- (CGFloat)adjustHeight;

@end
