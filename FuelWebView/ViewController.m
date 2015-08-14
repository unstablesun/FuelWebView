//
//  ViewController.m
//  FuelWebView
//
//  Created by Dave Hards on 2015-08-13.
//  Copyright (c) 2015 Dave Hards. All rights reserved.
//

#import "ViewController.h"
#import "PropellerWebViewProvider.h"
#import "PropellerUIWebView.h"
#import "PropellerWKWebView.h"


#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@interface ViewController ()

@property (weak, readwrite) UIView <PropellerWebViewProvider> *_myWebView;

@end

@implementation ViewController

@synthesize _myWebView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (IBAction)LaunchWebView:(id)sender {
    
    [self initWebView];
    
    [self loadWebViewBasic];

}


- (void)initWebView
{
    CGRect webFrame;
    webFrame.origin.x = 0;
    webFrame.origin.y = 0;
    
    webFrame.size.width = SCREEN_WIDTH;
    webFrame.size.height = SCREEN_HEIGHT;

    if (NSClassFromString(@"WKWebView") && SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0"))
    {
        WKWebViewConfiguration *theConfiguration = [[WKWebViewConfiguration alloc] init];
        [theConfiguration.userContentController addScriptMessageHandler:self name:@"message"];
        
        WKWebView *newWebView = [[WKWebView alloc] initWithFrame:webFrame configuration:theConfiguration];
        [self.view addSubview:newWebView];
        _myWebView = newWebView;
        newWebView = nil;
    }
    else
    {
        UIWebView *newWebView = [[UIWebView alloc] initWithFrame:webFrame];
        [self.view addSubview:newWebView];
        _myWebView = newWebView;
        newWebView = nil;
    }
    
    [_myWebView setDelegateViews: self ];
    [_myWebView setOpaque:NO];
    [_myWebView setBackgroundColor:[UIColor grayColor]];
    [_myWebView setScrollViewBounces:NO];
    [_myWebView setDataDetectorTypeNone];
    
}


- (void)loadWebViewBasic
{
    //你是從哪裡來的
    
#if 1
    
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"web_message" ofType:@"html"];
    
    NSString *html = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    //[_myWebView stringByEvaluatingJavaScriptFromString: @"document.body.style.fontFamily = 'GothamRounded-Bold'"];
    [_myWebView loadHTMLString:html baseURL:nil];
    
#else
    
    NSString *myDescriptionHTML = [NSString stringWithFormat:@"<html> \n"
                                   "<head> \n"
                                   "<style type=\"text/css\"> \n"
                                   "body {font-family: \"%@\"; font-size: %@;}\n"
                                   "</style> \n"
                                   "</head> \n"
                                   "<body><br/><br/>%@<br/><br/>%@</body> \n"
                                   "</html>", @"STHeitiSC-Medium", [NSNumber numberWithInt:18], @"Chinese Font Test", @"你是從哪裡來的"];
    
    [_myWebView loadHTMLString:myDescriptionHTML baseURL:nil];
    
#endif
}



- (void)webViewDidFinishLoad:(UIWebView*)webView
{
    
}
- (void)webView:(UIWebView*)webView didFailLoadWithError:(NSError*)error
{
    
}






- (void)webView:(WKWebView *)webView didFinishNavigation: (WKNavigation *)navigation
{
    
}
-(void)webView:(WKWebView *)webView didFailNavigation: (WKNavigation *)navigation withError:(NSError *)error
{
   
}

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message
{
    
    NSString *messageString = (NSString *)message.body;
    if(messageString != nil)
    {
        [self removeWebView];
    }

    
}

- (void)removeWebView
{
    [_myWebView stopLoading];
    [_myWebView setDelegateViews: nil];
    [_myWebView removeFromSuperview];
    _myWebView = nil;

}

@end
