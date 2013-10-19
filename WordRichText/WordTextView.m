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
#define IS_CHINESE_SHOWN 1

@implementation WordTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.textInfoView = [[WordTextInfoView alloc] initWithFrame:CGRectMake(0, 0, 320, DEFAULT_INFO_HEIGHT)];
        self.textEnglishDetailView = [[WordTextDetailView alloc] initWithFrame:CGRectMake(0, DEFAULT_INFO_HEIGHT, 320, DEFAULT_DETAIL_HEIGHT)];
        [self addSubview:self.textInfoView];
        [self addSubview:self.textEnglishDetailView];
        
        //test code
        if (IS_CHINESE_SHOWN) {
            self.textChineseDetailView = [[WordTextDetailView alloc] initWithFrame:CGRectMake(0, DEFAULT_DETAIL_HEIGHT + DEFAULT_INFO_HEIGHT, 320, DEFAULT_DETAIL_HEIGHT)];
            [self addSubview:self.textChineseDetailView];
        }
        
    }
    return self;
}

- (void)setWordDetail:(NSDictionary *)dict atIndex:(NSInteger)index{
    NSString *meaning = [dict objectForKey:@"usage"];
    NSString *detailMeaning = [dict objectForKey:@"example"];
    NSString *chineseMeaning = [dict objectForKey:@"chinese"];
    
    [self.textInfoView setIndex:index];
    [self.textInfoView setMeaning:meaning];
    [self.textEnglishDetailView setTitle:@"英"];
    [self.textEnglishDetailView setDetail:detailMeaning];

    if (IS_CHINESE_SHOWN) {
        [self.textChineseDetailView setTitle:@"中"];
        [self.textChineseDetailView setDetail:chineseMeaning];
    }
}


- (CGFloat)adjustHeight{
    CGFloat upperHeight = [self.textInfoView adjustHeight];
    CGFloat lowerHeight = [self.textEnglishDetailView adjustHeight];
    CGFloat lowerChineseHeight = [self.textChineseDetailView adjustHeight];
    if (IS_CHINESE_SHOWN) {
        self.textEnglishDetailView.frame = CGRectMake(0, upperHeight, 320, lowerHeight);
        self.textChineseDetailView.frame = CGRectMake(0, upperHeight + lowerHeight, 320, lowerChineseHeight);
        return (upperHeight + lowerChineseHeight + lowerHeight);
    } else {
        self.textEnglishDetailView.frame = CGRectMake(0, upperHeight, 320, lowerHeight);
        return (upperHeight + lowerHeight);
    }
}

@end
