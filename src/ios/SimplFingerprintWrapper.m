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
    NSString* merchantId = [command.arguments objectAtIndex:0];
    NSString* phoneNumber = [command.arguments objectAtIndex:1];
    NSString* email = [command.arguments objectAtIndex:2];
    @try {
        if(![self validParams:merchantId phoneNumber:phoneNumber email:email]) {
            CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            return;
        }
        
        [self generateFingerprintWithSDK:merchantId phoneNumber:phoneNumber email:email callback:^(NSString *payload) {
            CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:payload];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }];
    } @catch (NSException *exception) {
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:[exception reason]];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
}

- (void) generateFingerprintWithSDK:(NSString*) merchantId phoneNumber:(NSString*) phoneNumber email:(NSString*) email callback:(void (^)(NSString*)) callback{
    GSUser* user = [[GSUser alloc] initWithPhoneNumber:phoneNumber email:email];
    GSFingerPrint *fp = [[GSFingerPrint alloc] initWithMerchantId:merchantId andUser:user];
    [fp generateEncryptedPayloadWithCallback:callback];
}

- (BOOL) validParams:(NSString*) merchantId phoneNumber:(NSString*) phoneNumber email:(NSString*) email {
    return [self isNotEmpty:merchantId] && [self isNotEmpty:phoneNumber] && [self isNotEmpty:email];
}

- (BOOL) isNotEmpty:(NSString*) text {
    return !(text == nil || [text isEqualToString:@""]);
}

@end
