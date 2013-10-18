//
//  ViewController.m
//  WordRichText
//
//  Created by lazy on 13-10-17.
//  Copyright (c) 2013年 lazy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //test code
    NSString *path = [[NSBundle mainBundle] pathForResource:@"words" ofType:@"plist"];
    NSDictionary *dict = [[[NSArray alloc] initWithContentsOfFile:path] objectAtIndex:0];
    NSArray *detail = [dict objectForKey:@"detail"];
    NSInteger heightCounter = 0;
    NSInteger exPointCount = 1;
    for (NSDictionary *dictDetail in detail) {
        WordTextView *textView = [[WordTextView alloc] initWithFrame:CGRectMake(0, 0, 320, 117)];
        
        NSString *meaning = [dictDetail objectForKey:@"usage"];
        NSString *detailMeaning = [dictDetail objectForKey:@"example"];
        
        [textView setIndex:exPointCount];
        [textView setMeaning:meaning];
        [textView setTitle:@"中"];
        [textView setDetail:detailMeaning];
        
        CGFloat height = [textView adjustHeight];
        textView.frame = CGRectMake(0, heightCounter, 320, height);
        heightCounter += height;
        exPointCount++;

        [self.scrollView addSubview:textView];

    }
    
    self.scrollView.contentSize = CGSizeMake(320,heightCounter);

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
}

@end
