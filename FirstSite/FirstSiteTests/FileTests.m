//
//  FileTests.m
//  FirstSite
//
//  Created by Daren taylor on 05/03/2014.
//  Copyright (c) 2014 Sparx. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FileScanner.h"
#import "Paths.h"

@interface FileTests : XCTestCase

@end

@implementation FileTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testScanner
{
    FileScanner *scanner = [[FileScanner alloc] init];
    
    NSArray *array = [scanner scanWithPath:[Paths applicationDocumentsDirectory].path];
    
    
    NSLog(@"directoryContents ====== %@",array);
    
}

@end
