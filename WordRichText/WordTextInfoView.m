//
//  WordTextInfoView.m
//  WordRichText
//
//  Created by lazy on 13-10-17.
//  Copyright (c) 2013年 lazy. All rights reserved.
//

#import "WordTextInfoView.h"
#define DEFAULT_HEIGHT 35

@implementation WordTextInfoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.indexView = [[WordRichTextView alloc] initWithFrame:CGRectMake(0, 0, 72, DEFAULT_HEIGHT)];
        self.meaningView = [[WordRichTextView alloc] initWithFrame:CGRectMake(72, 0, 248, DEFAULT_HEIGHT)];
        [self addSubview:self.indexView];
        [self addSubview:self.meaningView];
        
        //attribute setting
        self.indexView.editable = NO;
        self.meaningView.editable = NO;
        self.indexView.textAlignment = NSTextAlignmentRight;
        self.meaningView.textAlignment = NSTextAlignmentLeft;
        self.indexView.scrollEnabled = NO;
        self.meaningView.scrollEnabled = NO;
        
        //test code
        self.indexView.text = @"fad";
        self.meaningView.text = @"fsf";
    }
    return self;
}

- (void)setIndex:(NSInteger)index{
    self.indexView.text = [NSString stringWithFormat:@"考法%ld",index];
}

- (void)setMeaning:(NSString *)meaning{
    self.meaningView.text = meaning;
}

- (CGFloat)adjustHeight{
    CGRect oldFrame = self.meaningView.frame;
    NSLog(@"%@",self.meaningView.text);
    oldFrame.size.height = self.meaningView.contentSize.height;
    self.meaningView.frame = oldFrame;
    return self.meaningView.frame.size.height;
}



@end
