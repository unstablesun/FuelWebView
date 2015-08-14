//
//  PropellerUIWebView.m
//

#import "PropellerUIWebView.h"


@implementation UIWebView (PropellerUIWebView)

- (void) setDelegateViews: (id <UIWebViewDelegate>) delegateView
{
    [self setDelegate: delegateView];
}

- (void) loadRequestFromString: (NSString *) urlNameAsString
{
    [self loadRequest: [NSURLRequest requestWithURL:[NSURL URLWithString: urlNameAsString]]];
}


- (void) setScalesPageToFit: (BOOL) setPages
{
    self.scalesPageToFit = setPages;
}

- (void) setScrollViewBounces:(BOOL) bounce
{
    self.scrollView.bounces = bounce;
}

- (void) setDataDetectorTypeNone
{
    self.dataDetectorTypes = UIDataDetectorTypeNone;
}

- (void) removeMessageHandlers
{
    return; //not supported on UIWebView
}


- (void) evaluateJavaScript: (NSString *) javaScriptString completionHandler: (void (^)(id, NSError *)) completionHandler
{
    NSString *string = [self stringByEvaluatingJavaScriptFromString: javaScriptString];
    
    if (completionHandler) {
        completionHandler(string, nil);
    }
}

@end