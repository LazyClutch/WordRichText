//
//  WordTextDetailView.m
//  WordRichText
//
//  Created by lazy on 13-10-17.
//  Copyright (c) 2013年 lazy. All rights reserved.
//

#import "WordTextDetailView.h"
#define DEFAULT_HEIGHT          35
#define NOTIFICATION_WORD_TAP   @"WordTapped"
#define IS_CH_SYMBOL(chr) ((int)(chr)>127)

@implementation WordTextDetailView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

    if (self) {
        self.titleView = [[WordRichTextView alloc] initWithFrame:CGRectMake(0, 0, 72, DEFAULT_HEIGHT)];
        self.detailView = [[WordRichTextView alloc] initWithFrame:CGRectMake(72, 0, 248, DEFAULT_HEIGHT)];
        [self addSubview:self.titleView];
        [self addSubview:self.detailView];

        // attribute setting
        self.titleView.editable = NO;
        self.detailView.editable = NO;
        self.titleView.textAlignment = NSTextAlignmentRight;
        self.detailView.textAlignment = NSTextAlignmentLeft;
        self.titleView.scrollEnabled = NO;
        self.detailView.scrollEnabled = NO;
        self.titleView.selectable = NO;
        self.titleView.userInteractionEnabled = NO;

        // add gesture
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(wordTapped:)];
        [self.detailView addGestureRecognizer:tap];
    }

    return self;
}

- (void)setTitle:(NSString *)title
{
    self.titleView.text = title;
}

- (void)setDetail:(NSString *)detail
{
    self.detailView.text = detail;
    [self adjustTextAttribute];
}

- (CGFloat)adjustHeight
{
    CGRect oldFrame = self.detailView.frame;
    oldFrame.size.height = [self textViewHeightForAttributedText:[[NSAttributedString alloc] initWithAttributedString:self.detailView.attributedText] andWidth:248];
    self.detailView.frame = oldFrame;
    
    CGRect oldLeftFrame = self.titleView.frame;
    oldLeftFrame.size.height = oldFrame.size.height;
    self.titleView.frame = oldLeftFrame;
    
    return self.detailView.frame.size.height;
}

- (void)adjustTextAttribute
{
    NSString    *keyWord = @"<B>[0-9A-Za-z]+</B>";
    NSRange     keyWordRange = [self.detailView.text rangeOfString:keyWord options:(NSCaseInsensitiveSearch | NSRegularExpressionSearch) range:NSMakeRange(0, self.detailView.text.length - 1)];

    while (keyWordRange.location != NSNotFound) {
        // replace highlighted word
        NSString *wildWord = [self.detailView.text substringWithRange:keyWordRange];
        NSString *highlightWord = [wildWord substringWithRange:NSMakeRange(3, keyWordRange.length - 7)];
        UITextPosition  *beginning = self.detailView.beginningOfDocument;
        UITextPosition  *start = [self.detailView positionFromPosition:beginning offset:keyWordRange.location];
        UITextPosition  *end = [self.detailView positionFromPosition:start offset:keyWordRange.length];
        [self.detailView replaceRange:[self.detailView textRangeFromPosition:start toPosition:end] withText:highlightWord];
        keyWordRange = NSMakeRange(keyWordRange.location, keyWordRange.length - 7);

        // extract text
        NSMutableAttributedString *attributeString = [self.detailView.attributedText mutableCopy];

        // set attribute
        [attributeString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"GurmukhiMN-Bold" size:14] range:keyWordRange];  // bold
        self.detailView.attributedText = attributeString;
        keyWordRange = [self.detailView.text rangeOfString:keyWord options:(NSCaseInsensitiveSearch | NSRegularExpressionSearch) range:NSMakeRange(keyWordRange.location + keyWord.length, self.detailView.text.length - keyWordRange.location - keyWord.length)];
    }
}

- (CGFloat)textViewHeightForAttributedText:(NSAttributedString *)text andWidth:(CGFloat)width
{
    UITextView *calculationView = [[UITextView alloc] init];
    [calculationView setAttributedText:text];
    CGSize size = [calculationView sizeThatFits:CGSizeMake(width, FLT_MAX)];
    return size.height;
}

#pragma mark-
#pragma mark Gesture Recognizer Methods
- (void)wordTapped:(UITapGestureRecognizer *)tap
{
    
    //retrieve word
    CGPoint pos = [tap locationInView:self.detailView];
    pos.y += self.detailView.contentOffset.y;
    UITextPosition      *tapPos = [self.detailView closestPositionToPoint:pos];
    UITextRange         *wr = [self.detailView.tokenizer rangeEnclosingPosition:tapPos withGranularity:UITextGranularityWord inDirection:UITextLayoutDirectionRight];
    NSString            *word = [self.detailView textInRange:wr];
    
    //deprecate Chinese
    for (NSInteger i = 0; i < word.length; i++) {
        unichar ch = [word characterAtIndex:i];
        if (IS_CH_SYMBOL(ch)) {
            return;
        }
    }
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:word forKey:@"word"];
    [[NSNotificationCenter defaultCenter] postNotificationName:NOTIFICATION_WORD_TAP object:self userInfo:dict];
}

@end