//
//  Snake.h
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

typedef enum Direction {
    UP,
    DOWN,
    LEFT,
    RIGHT
} Direction;

@interface Snake: NSObject

@property NSMutableArray * arrayOfPoints;
@property enum Direction direction;

-(struct SnakePoint)newPointWtihX: (int)inputX withY: (int)inputY;
-(void)addSnakePointWithX: (int)inputX withY: (int)inputY;
-(void)moveSnakeWithX: (int)inputX withY: (int)inputY;
-(void)changeDirection: (Direction)input;
    
@end

