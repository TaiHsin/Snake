//
//  Snake.h
//  Snake
//
//  Created by Tsihsin Lee on 2019/1/22.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <stdlib.h>

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
@property NSValue * fruit;

-(id)initWithHeight: (int)height withWidth: (int)width;
-(NSValue *)pointToValueWtihX: (int)x
                    withY: (int)y;
-(void)addSnakePointWithX: (int)x
                    withY: (int)y;
-(BOOL)moveSnake;
-(NSValue *)checkTouchedWallWithX: (int)x withY: (int)y;
-(BOOL)isTouchedBody: (NSValue *)value;
-(void)changeDirection: (Direction)input;
    
@end

