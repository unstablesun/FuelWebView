//
//  PropellerWKWebView.m
//

#import "PropellerWKWebView.h"

@implementation WKWebView (PropellerWKWebView)

- (void) setDelegateViews: (id <WKNavigationDelegate, WKScriptMessageHandler>) delegateView
{
    [self setNavigationDelegate: delegateView];
}

- (void) loadRequestFromString: (NSString *) urlNameAsString
{
    [self loadRequest: [NSURLRequest requestWithURL:[NSURL URLWithString: urlNameAsString]]];
}

- (void) setScalesPagesToFit: (BOOL) setPages
{
    return; // not supported in WKWebView
}

- (void) setScrollViewBounces:(BOOL) bounce
{
    self.scrollView.bounces = bounce;
}

- (void) setDataDetectorTypeNone
{
    return; // not supported in WKWebView
}

- (void) removeMessageHandlers
{
    [self.configuration.userContentController removeScriptMessageHandlerForName:@"message"];
}

@end