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
    int x = arc4random_uniform(coorWidth - 2);
    int y = arc4random_uniform(coorHeight - 2);
    NSValue * value = [self pointToValueWtihX: x withY: y];

    BOOL isSnakeBody = [self isTouchedBody: value];
    if (isSnakeBody) {
        [self generateFruit];
        
    } else {
        self.fruit = value;
    }
}

-(NSValue *)pointToValueWtihX: (int)x
                    withY: (int)y {
    SnakePoint point;
    point.x = x;
    point.y = y;
    
    NSValue * value = [NSValue valueWithBytes: &point objCType: @encode(SnakePoint)];
    return value;
}

-(void)addSnakePointWithX: (int)x
                    withY: (int)y {
    NSValue * value = [self pointToValueWtihX: x withY: y];
    [self.arrayOfPoints addObject: value];
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
    return [self pointToValueWtihX: x withY: y];
}

-(NSValue *)getNextPoint {
    NSValue * value = [self.arrayOfPoints firstObject];
    SnakePoint point;
    [value getValue: &point];
    int x = point.x;
    int y = point.y;
    
    switch (self.direction) {
        case UP:
            y --;
            break;
            
        case DOWN:
            y ++;
            break;
            
        case LEFT:
            x --;
            break;
            
        case RIGHT:
            x ++;
            break;
    }
    
    return [self checkTouchedWallWithX: x withY: y];
}

-(void)isGetFruit:(NSValue *)value {
    BOOL isGetFruit = [value isEqualToValue: self.fruit];
    
    if (isGetFruit) {
        [self.arrayOfPoints insertObject: value atIndex: 0];
        NSValue * secondValue = [self getNextPoint];
        [self.arrayOfPoints insertObject: secondValue atIndex: 0];
        [self generateFruit];
    }
//    BOOL isGetFruit = [value isEqualToValue: self.fruit];
//    if (!isGetFruit) {
//        return;
//    }
//
//    int newSecondLastX = 0;
//    int newSecondLastY = 0;
//    int newlastX = 0;
//    int newlastY = 0;
//
//    int count = (int)[self.arrayOfPoints count];
//    NSValue * lastValue = [self.arrayOfPoints lastObject];
//    NSValue * secondlastValue = [self.arrayOfPoints objectAtIndex: count-2];
//    SnakePoint last;
//    SnakePoint secondLast;
//    [lastValue getValue: &lastValue];
//    [secondlastValue getValue: &secondlastValue];
//
//    if (last.x == secondLast.x) {
//        if (self.direction == LEFT) {
//            newSecondLastX = last.x + 1;
//            newSecondLastY = last.y;
//            newlastX = last.x + 2;
//            newlastY = last.y;
//
//        } else if (self.direction == RIGHT) {
//            newSecondLastX = last.x - 1;
//            newSecondLastY = last.y;
//            newlastX = last.x - 2;
//            newlastY = last.y;
//        }
//    } else if (last.y == secondLast.y) {
//        if (self.direction == UP) {
//            newSecondLastX = last.x;
//            newSecondLastY = last.y + 1;
//            newlastX = last.x;
//            newlastY = last.y + 2;
//
//        } else if (self.direction == DOWN) {
//            newSecondLastX = last.x;
//            newSecondLastY = last.y - 1;
//            newlastX = last.x;
//            newlastY = last.y - 2;
//        }
//    }
//    NSValue * newSecondLast = [self pointToValueWtihX: newSecondLastX withY: newSecondLastY];
//    NSValue * newLast = [self pointToValueWtihX: newlastX withY: newlastY];
//    [self.arrayOfPoints addObject: newSecondLast];
//    [self.arrayOfPoints addObject: newLast];
}

-(BOOL)moveSnake {
    NSValue * value = [self getNextPoint];
    [self isGetFruit: value];
    
    bool isTouched = [self isTouchedBody: value];
    if (!isTouched) {
        [self.arrayOfPoints insertObject: value atIndex: 0];
        [self.arrayOfPoints removeLastObject];
        return true;
    }
    return false;
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
            break;
            
        case DOWN:
            if (self.direction == UP) {
                return;
            }
            self.direction = DOWN;
            break;
            
        case LEFT:
            if (self.direction == RIGHT) {
                return;
            }
            self.direction = LEFT;
            break;
            
        case RIGHT:
            if (self.direction == LEFT) {
                return;
            }
            self.direction = RIGHT;
            break;
    }
}

@end
