#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "FlutterRouter/FlutterInitiativeCalliOS.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];
    [FlutterInitiativeCalliOS registerWithRegistrar:[self registrarForPlugin:NSStringFromClass([FlutterInitiativeCalliOS class])]];

    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}



@end
