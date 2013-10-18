//
//  WordTextDetailView.m
//  WordRichText
//
//  Created by lazy on 13-10-17.
//  Copyright (c) 2013年 lazy. All rights reserved.
//

#import "WordTextDetailView.h"
#define DEFAULT_HEIGHT 35

@implementation WordTextDetailView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleView = [[WordRichTextView alloc] initWithFrame:CGRectMake(0, 0, 72, DEFAULT_HEIGHT)];
        self.detailView = [[WordRichTextView alloc] initWithFrame:CGRectMake(72, 0, 248, DEFAULT_HEIGHT)];
        [self addSubview:self.titleView];
        [self addSubview:self.detailView];
        
        //attribute setting
        self.titleView.editable = NO;
        self.detailView.editable = NO;
        self.titleView.textAlignment = NSTextAlignmentRight;
        self.detailView.textAlignment = NSTextAlignmentLeft;
        self.titleView.scrollEnabled = NO;
        self.detailView.scrollEnabled = NO;

    }
    return self;
}

- (void)setTitle:(NSString *)title{
    self.titleView.text = title;
}

- (void)setDetail:(NSString *)detail{
    self.detailView.text = detail;
}

- (CGFloat)adjustHeight{
    CGRect oldFrame = self.detailView.frame;
    oldFrame.size.height = [self textViewHeightForAttributedText:[[NSAttributedString alloc] initWithString:self.detailView.text] andWidth:248];
    self.detailView.frame = oldFrame;
    return self.detailView.frame.size.height;
}

- (CGFloat)textViewHeightForAttributedText:(NSAttributedString*)text andWidth:(CGFloat)width
{
    UITextView *calculationView = [[UITextView alloc] init];
    [calculationView setAttributedText:text];
    CGSize size = [calculationView sizeThatFits:CGSizeMake(width, FLT_MAX)];
    NSLog(@"%f",size.height);
    return size.height;
}

@end
