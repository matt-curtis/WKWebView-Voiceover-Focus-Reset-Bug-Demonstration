_Tested on an iPhone 6, iOS 12.1.4._

Demonstrates a Voiceover focus bug in `WKWebView` where it resets the currently voiceover focus whenever it loads a page. My suspicion is that behind the scenes `WKWebView` is posting a `UIAccessibilityScreenChangedNotification` notification (or something functionally equivalent), which resets the focus to the "first" element in the accessibility  tree.

Note in this demo that I've completely excluded `WKWebView` from the accessibility tree by setting `isAccessibilityElement` to `false` and `accessibilityElementsHidden` to `true`. Neither seems to have any effect on preventing `WKWebView` from resetting the focus.

To see the aforementioned bug in action:

1. Open the demonstration app
2. Move the focus to the second of the two labels
3. Wait for WKWebView to load
4. Once WKWebView loads, observe as focus is reset to the first label (which is the first "accessibility element")