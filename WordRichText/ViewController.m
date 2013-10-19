//
//  ViewController.m
//  WordRichText
//
//  Created by lazy on 13-10-17.
//  Copyright (c) 2013年 lazy. All rights reserved.
//

#import "ViewController.h"
#import "WordWebViewController.h"
#define NOTIFICATION_WORD_TAP @"WordTapped"

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
        
        [textView setWordDetail:dictDetail atIndex:exPointCount];

        CGFloat height = [textView adjustHeight];
        textView.frame = CGRectMake(0, heightCounter, 320, height);
        heightCounter += height;
        exPointCount++;

        [self.scrollView addSubview:textView];

    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(wordTapped:) name:NOTIFICATION_WORD_TAP object:nil];
    
    self.scrollView.contentSize = CGSizeMake(320,heightCounter);

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
}

- (void)wordTapped:(NSNotification *)notification{
    NSMutableDictionary *dict = (NSMutableDictionary *)[notification userInfo];
    NSString *word = [dict objectForKey:@"word"];
    WordWebViewController *modalViewController = [[WordWebViewController alloc] init];
    [self presentViewController:modalViewController animated:YES completion:^{
        [modalViewController loadWebView:word];
    }];
    NSLog(@"%@",word);
}

@end
