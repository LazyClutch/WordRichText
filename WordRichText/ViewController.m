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
    self.scrollView.contentSize = CGSizeMake(320,702);
    int a = 5;
    while (a--) {
        WordTextView *textView = [[WordTextView alloc] initWithFrame:CGRectMake(0, (5 - a) * 117, 320, 117)];
        [self.scrollView addSubview:textView];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
}

@end
