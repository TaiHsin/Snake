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
    Snake * snake =[[Snake alloc] init];
    XCTAssert([snake.arrayOfPoints count] == 2);
}

-(void)testAddSnakePoint {
    Snake * snake =[[Snake alloc] init];
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

-(void)testSnakeMoveTouchBody {
    Snake * snake =[[Snake alloc] init];
    SnakePoint newPoint = [snake newPointWtihX: 0 withY: 0];
    NSValue * newValue = [NSValue valueWithBytes: &newPoint objCType: @encode(SnakePoint)];
    
    [snake moveSnakeWithX: 0 withY: 0];
    NSValue * firstValue = [snake.arrayOfPoints firstObject];
    XCTAssert([newValue isEqualToValue: firstValue]);
}

-(void)testSnakeMoveNotTouchBody {
    Snake * snake =[[Snake alloc] init];
    SnakePoint newPoint = [snake newPointWtihX: 0 withY: 0];
    NSValue * newValue = [NSValue valueWithBytes: &newPoint objCType: @encode(SnakePoint)];
    
    [snake moveSnakeWithX: 0 withY: 1];
    NSValue * firstValue = [snake.arrayOfPoints firstObject];
    XCTAssert(![newValue isEqualToValue: firstValue]);
}

@end
