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
        
        //test code
        self.textInfoView.backgroundColor = [UIColor blueColor];
        self.textDetailView.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)setIndex:(NSInteger)index{
    self.textInfoView.indexView.text = [NSString stringWithFormat:@"考法%ld",index];
}

- (void)setMeaning:(NSString *)meaning{
    self.textInfoView.meaningView.text = meaning;
}

- (void)setTitle:(NSString *)title{
    self.textDetailView.titleView.text = title;
}

- (void)setDetail:(NSString *)detail{
    self.textDetailView.detailView.text = detail;
}

- (CGFloat)adjustHeight{
    CGFloat upperHeight = [self.textInfoView adjustHeight];
    CGFloat lowerHeight = [self.textDetailView adjustHeight];
    self.textDetailView.frame = CGRectMake(0, upperHeight, 320, lowerHeight);
    return (upperHeight + lowerHeight);
}

@end
