//
//  PropellerUIWebView.h
//

#import <UIKit/UIKit.h>
#import "PropellerWebViewProvider.h"

@interface UIWebView (PropellerUIWebView) <PropellerWebViewProvider>

- (void) setDelegateViews: (id <UIWebViewDelegate>) delegateView;

@end