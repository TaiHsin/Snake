//
//  Snake.m
//  Snake
//
//  Created by Tsihsin Lee on 2019/1/22.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//
#import "Snake.h"

@implementation Snake

int coorHeight;
int coorWidth;

-(id)initWithHeight: (int)height withWidth: (int)width {
    self = [super init];
    self.arrayOfPoints = [[NSMutableArray alloc] init];
    self.direction = LEFT;
    coorWidth = width;
    coorHeight = height;
    
    int x = width;
    int y = height / 2;
    [self addSnakePointWithX: x - 1 withY: y];
    [self addSnakePointWithX: x withY: y];
    [self generateFruit];
    
    return self;
}

-(void)generateFruit {
    int x = arc4random_uniform(coorWidth);
    int y = arc4random_uniform(coorHeight);
    self.fruit = [self newPointWtihX: x withY: y];
}

-(NSValue *)newPointWtihX: (int)x
                    withY: (int)y {
    SnakePoint point;
    point.x = x;
    point.y = y;
    
    NSValue * value = [NSValue valueWithBytes: &point objCType: @encode(SnakePoint)];
    return value;
}

-(void)addSnakePointWithX: (int)x
                    withY: (int)y {
    NSValue * value = [self newPointWtihX: x withY: y];
    [self.arrayOfPoints addObject: value];
}

-(BOOL)moveSnakeToX: (int)x
                toY: (int)y {
    NSValue * value = [self.arrayOfPoints firstObject];
    SnakePoint point;
    [value getValue: &point];
    int newX = point.x + x;
    int newY = point.y + y;
 
    NSValue * newValue = [self checkTouchedWallWithX: newX withY: newY];
    bool isTouched = [self isTouchedBody: newValue];
    
    if (!isTouched) {
        [self.arrayOfPoints insertObject: newValue atIndex: 0];
        [self.arrayOfPoints removeLastObject];
        return true;
    }
    return false;
}

-(NSValue *)checkTouchedWallWithX: (int)x withY: (int)y {
    if (x < 0) {
        x = x + coorWidth;
        
    } else if (x > coorWidth - 1) {
        x = x - coorWidth;
        
    } else if (y < 0) {
        y = y + coorHeight;
        
    } else if (y > coorHeight - 1) {
        y = y - coorHeight;
    }
    return [self newPointWtihX: x withY: y];
}

-(BOOL)isTouchedBody: (NSValue *)value {
    NSInteger index = [self.arrayOfPoints indexOfObject: value];

    if (index != NSNotFound) {
        return true;
    }
    return false;
}

-(void)changeDirection: (Direction)input {
    switch (input) {
        case UP:
            if (self.direction == DOWN) {
                return;
            }
            self.direction = UP;
            [self moveSnakeToX: 0 toY: 1];
            break;
            
        case DOWN:
            if (self.direction == UP) {
                return;
            }
            self.direction = DOWN;
            [self moveSnakeToX: 0 toY: -1];
            break;
            
        case LEFT:
            if (self.direction == RIGHT) {
                return;
            }
            self.direction = LEFT;
            [self moveSnakeToX: -1 toY: 0];
            break;
            
        case RIGHT:
            if (self.direction == LEFT) {
                return;
            }
            self.direction = RIGHT;
            [self moveSnakeToX: 1 toY: 0];
            break;
    }
}

@end
