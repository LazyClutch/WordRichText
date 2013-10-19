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
@property (nonatomic, strong) WordTextDetailView *textEnglishDetailView;
@property (nonatomic, strong) WordTextDetailView *textChineseDetailView;

- (void)setWordDetail:(NSDictionary *)dict atIndex:(NSInteger)index;

- (CGFloat)adjustHeight;

@end
