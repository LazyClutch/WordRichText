//
//  WordRichTextView.m
//  WordRichText
//
//  Created by lazy on 13-10-17.
//  Copyright (c) 2013年 lazy. All rights reserved.
//

#import "WordRichTextView.h"

@implementation WordRichTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setFont:[UIFont fontWithName:@"Heiti SC" size:12]];
    }
    return self;
}

@end
