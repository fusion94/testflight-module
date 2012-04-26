/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "TiTestflightModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "TestFlight.h"

@implementation TiTestflightModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"4946b1e8-362c-46a8-a6fc-bbe40e892ecc";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"ti.testflight";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
    [TestFlight setOptions:[NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:@"sendLogOnlyOnCrash"]];
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup 

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma Public APIs

-(void)token:(id)args
{
    ENSURE_UI_THREAD(token, args);
    NSString *value = [TiUtils stringValue:[args objectAtIndex:0]];
    BOOL testing = FALSE;
    
    if ([args count] > 1) {
        testing = [TiUtils boolValue: [args objectAtIndex:1]];
        if (testing == TRUE) {
            [TestFlight setDeviceIdentifier: [[UIDevice currentDevice] uniqueIdentifier]];
        }
    }
    
    [TestFlight takeOff:value];
}

-(void)checkpoint:(id)args
{    
    ENSURE_UI_THREAD_1_ARG(args);
    
    NSString *value = [TiUtils stringValue:[args objectAtIndex:0]];
    [TestFlight passCheckpoint:value];
}

-(void)feedback:(id)args
{
    ENSURE_UI_THREAD_1_ARG(args);
    [TestFlight openFeedbackView];
}

-(void)submitFeedback:(id)args
{
    ENSURE_UI_THREAD_1_ARG(args);
    
    NSString *value = [TiUtils stringValue:[args objectAtIndex:0]];
    [TestFlight submitFeedback:value];

}

-(void)customInfo:(id)args
{
    NSString *key = [TiUtils stringValue:[args objectAtIndex:0]];
    NSString *value = [TiUtils stringValue:[args objectAtIndex:1]];
    [TestFlight addCustomEnvironmentInformation: value forKey:key];
}

-(void)remoteLog:(id)args
{
    ENSURE_UI_THREAD_1_ARG(args);
    NSString *value = [TiUtils stringValue:[args objectAtIndex:0]];
    TFLog(@"[INFO] %@",value);
}

@end
