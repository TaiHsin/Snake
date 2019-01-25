//
//  SnakeTests.m
//  SnakeTests
//
//  Created by Tsihsin Lee on 2019/1/22.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Snake.h"

@interface SnakeTests : XCTestCase

@end

@implementation SnakeTests

-(void)testSnakeInitLength {
    
    Snake * snake =[[Snake alloc] initWithHeight: 10 withWidth: 10];
   
    XCTAssert([snake.arrayOfPoints count] == 2);
}

-(void)testAddSnakePoint {
    
    Snake * snake =[[Snake alloc] initWithHeight: 10 withWidth: 10];
    
    [snake addSnakePointWithX: 1 withY: 0];
    
    XCTAssert([snake.arrayOfPoints count] == 3);
}

-(void)testChangeDirectionLEFTtoUP {
    
    Snake * snake =[[Snake alloc] init];
    
    snake.direction = LEFT;
    
    [snake changeDirection: UP];
    
    XCTAssert(snake.direction == UP );
}

-(void)testChangeDirectionUPtoUP {
   
    Snake * snake =[[Snake alloc] init];
    
    snake.direction = UP;
    
    [snake changeDirection: UP];
    
    XCTAssert(snake.direction == UP );
}

-(void)testChangeDirectionDOWNtoUP {
    
    Snake * snake =[[Snake alloc] init];
    
    snake.direction = DOWN;
    
    [snake changeDirection: UP];
    
    XCTAssert(snake.direction != UP );
}

-(void)testChangeDirectionDOWNtoRIGHT {
    
    Snake * snake =[[Snake alloc] init];
    
    snake.direction = DOWN;
    
    [snake changeDirection: RIGHT];
    
    XCTAssert(snake.direction == RIGHT );
}

-(void)testChangeDirectionLEFTtoRIGHT {
    
    Snake * snake =[[Snake alloc] init];
    
    snake.direction = LEFT;
    
    [snake changeDirection: RIGHT];
    
    XCTAssert(snake.direction != RIGHT );
}

-(void)testSnakeisTouched {
    
    Snake * snake =[[Snake alloc] initWithHeight: 10 withWidth: 10];
    
    NSValue * value = [snake pointToValueWtihX: 10 withY: 5];
    
    BOOL isTouched = [snake isTouchedBody: value];
    
    XCTAssert(isTouched);
}

-(void)testSnakeisNotTouched {
    
    Snake * snake =[[Snake alloc] initWithHeight: 10 withWidth: 10];
    
    NSValue * value = [snake pointToValueWtihX: 0 withY: 0];
    
    BOOL isTouched = [snake isTouchedBody: value];
    
    XCTAssert(!isTouched);
}

-(void)testSnakeTouchRIGHTWall {
    
    Snake * snake =[[Snake alloc] initWithHeight: 10 withWidth: 10];
    
    NSValue * value = [snake pointToValueWtihX: 0 withY: 0];
    
    NSValue * checkValue = [snake checkTouchedWallWithX: 10 withY: 0];
    
    XCTAssert([value isEqualToValue: checkValue]);
}

-(void)testSnakeTouchLEFTWall {
    
    Snake * snake =[[Snake alloc] initWithHeight: 10 withWidth: 10];
    
    NSValue * value = [snake pointToValueWtihX: 9 withY: 0];
    
    NSValue * checkValue = [snake checkTouchedWallWithX: -1 withY: 0];
    
    XCTAssert([value isEqualToValue: checkValue]);
}

-(void)testSnakeTouchUPWall {
    
    Snake * snake =[[Snake alloc] initWithHeight: 10 withWidth: 10];
    
    NSValue * value = [snake pointToValueWtihX: 0 withY: 9];
    
    NSValue * checkValue = [snake checkTouchedWallWithX: 0 withY: -1];
    
    XCTAssert([value isEqualToValue: checkValue]);
}

-(void)testSnakeTouchBOTTOMWall {
   
    Snake * snake =[[Snake alloc] initWithHeight: 10 withWidth: 10];
    
    NSValue * value = [snake pointToValueWtihX: 0 withY: 0];
    
    NSValue * checkValue = [snake checkTouchedWallWithX: 0 withY: 10];
    
    XCTAssert([value isEqualToValue: checkValue]);
}

@end
