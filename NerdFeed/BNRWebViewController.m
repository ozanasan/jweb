//
//  BNRWebViewController.m
//  NerdFeed
//
//  Created by Ozan Asan on 28/07/14.
//  Copyright (c) 2014 Ozan Asan. All rights reserved.
//

#import "BNRWebViewController.h"

@interface BNRWebViewController()<UIWebViewDelegate>

@property (nonatomic, strong) UIToolbar *toolBar;
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) UIBarButtonItem *back;
@property (nonatomic, strong) UIBarButtonItem *forward;

@end

@implementation BNRWebViewController

- (void)loadView
{
    self.webView = [[UIWebView alloc] init];
    self.webView.scalesPageToFit = YES;
    self.webView.delegate = self;
    self.view = self.webView;
    
    
}

- (void)setURL:(NSURL *)URL
{
    _URL = URL;
    if(_URL){
        NSURLRequest *req = [NSURLRequest requestWithURL:_URL];
        [(UIWebView *)self.view loadRequest:req];
    }
}


- (void)viewWillAppear:(BOOL)animated
{
    CGRect frame = CGRectMake(0, self.view.bounds.size.height - 44, self.view.bounds.size.width, 44);
    
    self.back = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self.view action:@selector(goBack)];
    self.forward = [[UIBarButtonItem alloc] initWithTitle:@"Forward" style:UIBarButtonItemStylePlain target:self.view action:@selector(goForward)];
    
    [self.back setWidth:150]; [self.forward setWidth:150];
    
    UIBarButtonItem *empty = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    empty.width = 468;
    
    NSLog(@"self.view.width is %f", self.view.bounds.size.width);
    
    NSArray *barItems = @[self.back, empty, self.forward];
    
    self.toolBar = [[UIToolbar alloc] initWithFrame:frame];
    [self.toolBar setItems:barItems];
    [self.toolBar sizeToFit];
    [self.view addSubview:self.toolBar];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.back.enabled = webView.canGoBack;
    self.forward.enabled = webView.canGoForward;
}

- (void)goBack
{
    [(UIWebView *)self.view goBack];
}

- (void)goForward
{
    [(UIWebView *)self.view goForward];
}


@end
