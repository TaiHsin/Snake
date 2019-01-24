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

-(id)initWithHeight: (int)height withWidth: (int)width;
-(NSValue *)newPointWtihX: (int)x
                    withY: (int)y;
-(void)addSnakePointWithX: (int)x
                    withY: (int)y;
-(BOOL)moveSnakeToX: (int)x
                toY: (int)y;
-(NSValue *)checkTouchedWallWithX: (int)x withY: (int)y;
-(BOOL)isTouchedBody: (NSValue *)value;
-(void)changeDirection: (Direction)input;
    
@end

