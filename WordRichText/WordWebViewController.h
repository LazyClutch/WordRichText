//
//  WordWebViewController.h
//  WordRichText
//
//  Created by lazy on 13-10-18.
//  Copyright (c) 2013年 lazy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WordWebViewController : UIViewController

@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *navigationBarItem;

- (void)loadWebView:(NSString *)word;
- (IBAction)returnPressed:(id)sender;
@end
