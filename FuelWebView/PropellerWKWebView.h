//
//  PropellerWKWebView.h
//

#import <WebKit/WebKit.h>
#import "PropellerWebViewProvider.h"

@interface WKWebView (PropellerWKWebView) <PropellerWebViewProvider>

- (void) setDelegateViews: (id <WKNavigationDelegate>) delegateView;

@end