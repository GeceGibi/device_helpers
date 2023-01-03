#import "HelpersPlugin.h"
#if __has_include(<helpers/helpers-Swift.h>)
#import <helpers/helpers-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "helpers-Swift.h"
#endif

@implementation HelpersPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftHelpersPlugin registerWithRegistrar:registrar];
}
@end
