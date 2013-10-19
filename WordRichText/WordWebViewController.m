//
//  WordWebViewController.m
//  WordRichText
//
//  Created by lazy on 13-10-18.
//  Copyright (c) 2013年 lazy. All rights reserved.
//

#import "WordWebViewController.h"
#define REQUEST_URL @"http://i.word.com/idictionary/"

@interface WordWebViewController ()

@end

@implementation WordWebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)returnPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)loadWebView:(NSString *)word{
    [self.navigationBarItem setTitle:word];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",REQUEST_URL,word]];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [self.webView loadRequest:request];
}

#pragma mark-
#pragma mark UIWebView Delegate Methods
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"错误" message:@"连接失败，请检查网络" delegate:self cancelButtonTitle:@"好" otherButtonTitles: nil];
    [alert show];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
