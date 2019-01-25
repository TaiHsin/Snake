//
//  SnakeView.m
//  Snake
//
//  Created by Tsihsin Lee on 2019/1/24.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import "SnakeView.h"

@implementation SnakeView

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame: frame];
    [self registerGestureOnView: self];
    
    return self;
}

-(void)drawRect:(CGRect)rect {
    [super drawRect: rect];

    NSMutableArray * snakeArray = [self.delegate getSnake: self];
    NSValue * fruitValue = [self.delegate getFruit: self];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor * black = [UIColor colorWithRed: 0.0 green: 0.0 blue: 0.0 alpha: 1];
    CGContextSetFillColorWithColor(context, black.CGColor);
    CGContextFillRect(context, self.bounds);
    
    int num = (int)[snakeArray count];
    for (int index = 0; index < num; index++) {

        SnakePoint point;
        [snakeArray[index] getValue: &point];
        CGFloat x = point.x * 10;
        CGFloat y = point.y * 10;

        CGRect rectangle = CGRectMake(x, y, 10, 10);
        UIColor * white = [UIColor colorWithRed: 1.0 green: 1.0 blue: 1.0 alpha: 1];
        CGContextSetFillColorWithColor(context, white.CGColor);
        CGContextFillRect(context, rectangle);
    }
    
    SnakePoint fruitPoint;
    [fruitValue getValue: &fruitPoint];
    CGFloat x = fruitPoint.x * 10;
    CGFloat y = fruitPoint.y * 10;
    CGRect fruitRec = CGRectMake(x, y, 10, 10);
    UIColor * blue = [UIColor colorWithRed: 0.0 green: 0.0 blue: 1.0 alpha: 1];
    CGContextSetFillColorWithColor(context, blue.CGColor);
    CGContextFillRect(context, fruitRec);
}

#pragma Swipe Gesture

-(void)registerGestureOnView: (UIView *)view {
    UISwipeGestureRecognizer * up = [[UISwipeGestureRecognizer alloc] initWithTarget: self action: @selector(swipeGesture:)];
    up.direction = UISwipeGestureRecognizerDirectionUp;
    [view addGestureRecognizer: up];
    
    UISwipeGestureRecognizer * down = [[UISwipeGestureRecognizer alloc] initWithTarget: self action: @selector(swipeGesture:)];
    down.direction = UISwipeGestureRecognizerDirectionDown;
    [view addGestureRecognizer: down];
    
    UISwipeGestureRecognizer * left = [[UISwipeGestureRecognizer alloc] initWithTarget: self action: @selector(swipeGesture:)];
    left.direction = UISwipeGestureRecognizerDirectionLeft;
    [view addGestureRecognizer: left];
    
    UISwipeGestureRecognizer * right = [[UISwipeGestureRecognizer alloc] initWithTarget: self action: @selector(swipeGesture:)];
    right.direction = UISwipeGestureRecognizerDirectionRight;
    [view addGestureRecognizer: right];
}

-(void)swipeGesture: (UISwipeGestureRecognizer *)gesture {
    
    switch (gesture.direction) {
        case UISwipeGestureRecognizerDirectionUp:
            [self.delegate didChangeDirection: self with: UP];
            break;
            
        case UISwipeGestureRecognizerDirectionDown:
            [self.delegate didChangeDirection: self with: DOWN];
            break;
            
        case UISwipeGestureRecognizerDirectionLeft:
            [self.delegate didChangeDirection: self with: LEFT];
            break;
            
        case UISwipeGestureRecognizerDirectionRight:
            [self.delegate didChangeDirection: self with: RIGHT];
            break;
    }
}

@end
