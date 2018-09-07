/********* SimplFingerprintWrapper.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>
#import <SimplFingerPrint/SimplFingerPrint.h>

@interface SimplFingerprintWrapper : CDVPlugin {
  // Member variables go here.
}

- (void)generateFingerprint:(CDVInvokedUrlCommand*)command;
@end

@implementation SimplFingerprintWrapper

- (void)generateFingerprint:(CDVInvokedUrlCommand*)command {
    CDVPluginResult* pluginResult = nil;
    NSString* merchantId = [command.arguments objectAtIndex:0];
    NSString* phoneNumber = [command.arguments objectAtIndex:1];
    NSString* email = [command.arguments objectAtIndex:2];

    if(![self validParams:merchantId phoneNumber:phoneNumber email:email]) {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        return;
    }

    NSString* fingerprint = [self generateFingerprintWithSDK:merchantId phoneNumber:phoneNumber email:email];
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:fingerprint];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (NSString*) generateFingerprintWithSDK:(NSString*) merchantId phoneNumber:(NSString*) phoneNumber email:(NSString*) email {
    GSUser* user = [[GSUser alloc] initWithPhoneNumber:phoneNumber email:email];
    GSFingerPrint *fp = [[GSFingerPrint alloc] initWithMerchantId:phoneNumber andUser:user];
    return [fp generateEncryptedPayload];
}

- (BOOL) validParams:(NSString*) merchantId phoneNumber:(NSString*) phoneNumber email:(NSString*) email {
    return [self isNotEmpty:merchantId] && [self isNotEmpty:phoneNumber] && [self isNotEmpty:email];
}

- (BOOL) isNotEmpty:(NSString*) text {
    return !(text == nil || [text isEqualToString:@""]);
}

@end
