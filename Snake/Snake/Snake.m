//
//  Snake.m
//  Snake
//
//  Created by Tsihsin Lee on 2019/1/22.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//
#import "Snake.h"

@implementation Snake

-(instancetype)init {
    self = [super init];
    self.arrayOfPoints = [[NSMutableArray alloc] init];
    
    int height = (int)[[UIScreen mainScreen] bounds].size.height;
    int width = (int)[[UIScreen mainScreen] bounds].size.width;
    
    [self setupStartPositionWitHeight: height width: width];
    self.direction = LEFT;
    return self;
}

// Arguments?
-(void)setupStartPositionWitHeight: (int)height
                             width: (int)width {
    // convert height/ width to x, y point
    
    [self addSnakePointWithX:0 withY:0];
    [self addSnakePointWithX:1 withY:0];
}

-(struct SnakePoint)newPointWtihX: (int)inputX
                            withY: (int)inputY {
    SnakePoint point;
    point.x = inputX;
    point.y = inputY;
    
    return point;
}

// Get fruit
-(void)addSnakePointWithX: (int)inputX
                    withY: (int)inputY {
    SnakePoint point = [self newPointWtihX: inputX withY: inputY];
    NSValue * pointValue = [NSValue valueWithBytes: &point objCType: @encode(SnakePoint)];
    [self.arrayOfPoints addObject: pointValue];
}

-(void)moveSnakeWithX: (int)inputX
                withY: (int)inputY {
 
    // If snake touch any wall, appear at the other wall
    NSValue * value = [self.arrayOfPoints firstObject];
    SnakePoint point;
    [value getValue: &point];
    SnakePoint newPoint = [self newPointWtihX: point.x+inputX withY: point.y+inputY];
    NSValue * newValue = [NSValue valueWithBytes: &newPoint objCType: @encode(SnakePoint)];
    
    NSInteger index = [self.arrayOfPoints indexOfObject: newValue];
    
    // Snake don't touch body
    if (index != NSNotFound) {
        return;
    }

    
    
    
    [self.arrayOfPoints insertObject: newValue atIndex: 0];
    [self.arrayOfPoints removeLastObject];
}

-(void)changeDirection: (Direction)input {
    switch (input) {
        case UP:
            if (self.direction == DOWN) {
                return;
            }
            self.direction = UP;
            [self moveSnakeWithX: 0 withY: 1];
            break;
            
        case DOWN:
            if (self.direction == UP) {
                return;
            }
            self.direction = DOWN;
            [self moveSnakeWithX: 0 withY: -1];
            break;
            
        case LEFT:
            if (self.direction == RIGHT) {
                return;
            }
            self.direction = LEFT;
            [self moveSnakeWithX: -1 withY: 0];
            break;
            
        case RIGHT:
            if (self.direction == LEFT) {
                return;
            }
            self.direction = RIGHT;
            [self moveSnakeWithX: 1 withY: 0];
            break;
    }
}

@end
