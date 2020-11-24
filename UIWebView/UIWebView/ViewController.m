//
//  ViewController.m
//  UIWebView
//
//  Created by hhb on 2020/11/9.
//  Copyright © 2020 edz. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()<WKNavigationDelegate>
//WKWebView用来加载网页的链接
@property(nonatomic,strong)WKWebView *webview;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.webview = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    self.webview.backgroundColor = [UIColor redColor];
    //滚动
    self.webview.scrollView.backgroundColor = [UIColor yellowColor];
    
    self.webview.navigationDelegate = self;
    
    [self.view addSubview:self.webview];
    //创建一个请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    
    [self.webview loadRequest:request];
}

//回调
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"加载完成");
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"加载失败");
}

@end
