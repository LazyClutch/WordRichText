//
//  WordTextDetailView.m
//  WordRichText
//
//  Created by lazy on 13-10-17.
//  Copyright (c) 2013年 lazy. All rights reserved.
//

#import "WordTextDetailView.h"
#define DEFAULT_HEIGHT 83

@implementation WordTextDetailView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleView = [[WordRichTextView alloc] initWithFrame:CGRectMake(0, 0, 72, DEFAULT_HEIGHT)];
        self.meaningView = [[WordRichTextView alloc] initWithFrame:CGRectMake(72, 0, 248, DEFAULT_HEIGHT)];
        [self addSubview:self.titleView];
        [self addSubview:self.meaningView];
        
        //attribute setting
        self.titleView.editable = NO;
        self.meaningView.editable = NO;
        
        //test code
        self.titleView.text = @"fsf";
        self.meaningView.text = @"dfsf";
    }
    return self;
}

- (void)setTitle:(NSString *)title{
    
}

- (void)setMeaning:(NSString *)meaning{
    
}

@end
