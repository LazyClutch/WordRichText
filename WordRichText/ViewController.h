//
//  ViewController.h
//  WordRichText
//
//  Created by lazy on 13-10-17.
//  Copyright (c) 2013年 lazy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WordTextView.h"

@interface ViewController : UIViewController<UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end
