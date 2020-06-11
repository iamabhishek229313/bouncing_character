#import "BouncingCharacterPlugin.h"
#if __has_include(<bouncing_character/bouncing_character-Swift.h>)
#import <bouncing_character/bouncing_character-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "bouncing_character-Swift.h"
#endif

@implementation BouncingCharacterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBouncingCharacterPlugin registerWithRegistrar:registrar];
}
@end
