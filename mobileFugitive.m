//
//  mobileFugitive.m
//
//  Created by Luciano Colosio 07/19/2013
//
//  Copyright (c) 2013 Luciano Colosio. All rights reserved.
//

#import "mobileFugitive.h"

@interface MobileFugitive()
@property (strong, nonatomic, readonly) NSArray *cydiaPaths;
@property (strong, nonatomic, readonly) NSArray *mobileSubstratePaths;
@property (strong, nonatomic, readonly) NSArray *evasi0nPaths;
@property (strong, nonatomic, readonly) NSArray *appSyncPaths;
@property (strong, nonatomic, readonly) NSArray *missingSystemPaths;
@end

@implementation MobileFugitive
    BOOL didScan = NO;
    BOOL isJialbroken = NO;
    BOOL isCracked = NO;

- (id)init {
    self = [super init];
    if (self) {
        _cydiaPaths = @[@"/Applications/Cydia.app",
                        @"/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist",
                        @"/private/etc/apt", @"/usr/libexec/cydia",
                        @"/private/var/tmp/cydia.log",
                        @"/private/var/lib/cydia",
                        @"/bin/bash"
                    ];

        _mobileSubstratePaths = @[@"/Library/MobileSubstrate",
                                  @"/Library/Frameworks/CydiaSubstrate.framework/",
                                  @"/usr/bin/cycc",
                                  @"/usr/bin/cynject",
                                  @"/usr/bin/include/substrate.h",
                                  @"/usr/bin/lib/libsubstrate.0.dylib",
                                  @"/usr/bin/lib/libsubstrate.dylib",
                                ];

        _evasi0nPaths = @[@"/usr/libexec/dirhelper",
                          @"/private/var/evasi0n/"
                        ];

        _appSyncPaths = @[@"/Library/MobileSubstrate/DynamicLibraries/AppSync.dylib",
                          @"/Library/MobileSubstrate/DynamicLibraries/AppSync.plist",
                          @"/user/bin/patchsync"
                        ];

        _missingSystemPaths = @[@"/System/Library/Frameworks/Foundation.framework/Foundation"];
        
    }
    return self;
}

- (BOOL)isJailbroken {
    [self scanForItems];
    return isJialbroken;
}

- (BOOL)isCracked {
    [self scanForItems];
    return isCracked;
}


- (void) scanForItems {
    if (!didScan) {
        [self scanCidia];
        [self scanMobileSubstrate];
        [self scanEvasi0n];
        [self scanAppSync];
        didScan = YES;
    }
}

- (void) scanCidia {
    [_cydiaPaths enumerateObjectsUsingBlock:^(id filePath, NSUInteger idx, BOOL *stop) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
            isJialbroken = YES;
            *stop = YES;
        }
    }];
}

- (void) scanMobileSubstrate {
    [_mobileSubstratePaths enumerateObjectsUsingBlock:^(id filePath, NSUInteger idx, BOOL *stop) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
            isJialbroken = YES;
            *stop = YES;
        }
    }];
}

- (void) scanEvasi0n {
    [_evasi0nPaths enumerateObjectsUsingBlock:^(id filePath, NSUInteger idx, BOOL *stop) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
            isJialbroken = YES;
            *stop = YES;
        }
    }];
}

- (void) scanAppSync {
    [_appSyncPaths enumerateObjectsUsingBlock:^(id filePath, NSUInteger idx, BOOL *stop) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
            isCracked = YES;
            *stop = YES;
        }
    }];
}

- (void) lookForMissingSystemPaths {
    [_missingSystemPaths enumerateObjectsUsingBlock:^(id filePath, NSUInteger idx, BOOL *stop) {
        if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
            isJialbroken = YES;
            *stop = YES;
        }
    }];
}

@end
