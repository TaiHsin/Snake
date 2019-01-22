//
//  Snake.m
//  Snake
//
//  Created by Tsihsin Lee on 2019/1/22.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef struct SnakePoint {
    int x;
    int y;
} SnakePoint;

@interface Snake: NSObject

@property NSMutableArray * arrayOfPoints;
@property NSString * direction;

@end

@implementation Snake

-(instancetype)init {
    self = [super init];

//    [self setupStartPoint];
//    NSLog(self.arrayOfPoints);
    return self;
}

// Arguments?
-(void)setupStartPoint {
    [self addSnakePointWith:0 with:0];
    [self addSnakePointWith:1 with:0];
    
//    Location location1 = [self addLocationWtihX:0 withY:0];
//    Location location2 = [self addLocationWtihX:1 withY:0];
//
//    NSValue * point1 = [NSValue valueWithBytes: &location1 objCType:@encode(Location)];
//    NSValue * point2 = [NSValue valueWithBytes: &location2 objCType:@encode(Location)];
//
//    [self.arrayOfPoints addObject:point1];
//    [self.arrayOfPoints addObject:point2];
}

-(struct SnakePoint)newPointWtihX: (int)inputX withY: (int)inputY {
    SnakePoint point;
    point.x = inputX;
    point.y = inputY;
    
    return point;
}

-(void)addSnakePointWith: (int)inputX with: (int)inputY {
    SnakePoint point = [self newPointWtihX:inputX withY:inputY];
    NSValue * pointValue = [NSValue valueWithBytes: &point objCType:@encode(SnakePoint)];
    [self.arrayOfPoints addObject: pointValue];
}

-(void)moveSnakeWith: (int)inputX with: (int)inputY {
    SnakePoint point = [self newPointWtihX:inputX withY:inputY];
    NSValue * pointValue = [NSValue valueWithBytes: &point objCType:@encode(SnakePoint)];
    [self.arrayOfPoints insertObject:pointValue atIndex:0];
    [self.arrayOfPoints removeLastObject];
}

@end
