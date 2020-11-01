//
//  NetworkManager.m
//  ObjectiveCApp
//
//  Created by Javra Software on 10/31/20.
//

#import "NetworkManager.h"

@implementation NetworkManager

+ (NetworkManager *) sharedManager {
    static NetworkManager *_sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
    
}
@end
