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
        
        
        //test code
        self.titleView.text = @"fsf";
        self.detailView.text = @"dfsf";
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
    CGSize size = [self.detailView.text boundingRectWithSize:(CGSize) options:<#(NSStringDrawingOptions)#> attributes:<#(NSDictionary *)#> context:<#(NSStringDrawingContext *)#>];
    
    CGRect oldFrame = self.detailView.frame;
    oldFrame.size.height = self.detailView.contentSize.height;
    self.detailView.frame = oldFrame;
    return self.detailView.frame.size.height;
}

@end
