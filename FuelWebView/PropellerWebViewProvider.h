//
//  PropellerWebViewProvider.h
//

// This class defines methods that PropellerUIWebView and PropellerWKWebView should implement.
@protocol PropellerWebViewProvider <NSObject>

- (void) setDelegateViews: (id) delegateView;

- (void) loadRequest: (NSURLRequest *) request;

- (void) loadRequestFromString: (NSString *) urlNameAsString;

- (void) stopLoading;

- (void) setScrollViewBounces:(BOOL) bounce;

- (void) setDataDetectorTypeNone;

- (void) loadHTMLString:(NSString *)string baseURL:(NSURL *)baseURL;

- (void) removeMessageHandlers;

- (void) evaluateJavaScript: (NSString *) javaScriptString completionHandler: (void (^)(id, NSError *)) completionHandler;

- (NSString *)stringByEvaluatingJavaScriptFromString:(NSString *)script;

@end