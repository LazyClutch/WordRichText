//
//  WordTextView.m
//  WordRichText
//
//  Created by lazy on 13-10-17.
//  Copyright (c) 2013年 lazy. All rights reserved.
//

#import "WordTextView.h"
#define DEFAULT_INFO_HEIGHT 35
#define DEFAULT_DETAIL_HEIGHT 83

@implementation WordTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.textInfoView = [[WordTextInfoView alloc] initWithFrame:CGRectMake(0, 0, 320, DEFAULT_INFO_HEIGHT)];
        self.textDetailView = [[WordTextDetailView alloc] initWithFrame:CGRectMake(0, DEFAULT_INFO_HEIGHT, 320, DEFAULT_DETAIL_HEIGHT)];
        [self addSubview:self.textInfoView];
        [self addSubview:self.textDetailView];
        
    }
    return self;
}

- (void)setIndex:(NSInteger)index{
    [self.textInfoView setIndex:index];
}

- (void)setMeaning:(NSString *)meaning{
    [self.textInfoView setMeaning:meaning];
}

- (void)setTitle:(NSString *)title{
    [self.textDetailView setTitle:title];
}

- (void)setDetail:(NSString *)detail{
    [self.textDetailView setDetail:detail];
}

- (CGFloat)adjustHeight{
    CGFloat upperHeight = [self.textInfoView adjustHeight];
    CGFloat lowerHeight = [self.textDetailView adjustHeight];
    self.textDetailView.frame = CGRectMake(0, upperHeight, 320, lowerHeight);
    return (upperHeight + lowerHeight);
}

@end
