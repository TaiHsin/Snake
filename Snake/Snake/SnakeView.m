//
//  SnakeView.m
//  Snake
//
//  Created by Tsihsin Lee on 2019/1/24.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import "SnakeView.h"

@implementation SnakeView

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame: frame];
    
    [self registerGestureOnView: self];
    
//    UIPanGestureRecognizer * panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget: self action: @selector(panGesture:)];
//    [self addGestureRecognizer: panGestureRecognizer];
    
    return self;
}

- (void)drawRect:(CGRect)rect {
  
    [super drawRect: rect];

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor * black = [UIColor colorWithRed: 0.0 green: 0.0 blue: 0.0 alpha: 1];
    
    CGContextSetFillColorWithColor(context, black.CGColor);
   
    CGContextFillRect(context, self.bounds);
    
    NSMutableArray * snakeArray = [self.delegate getSnake: self];

    int num = (int)[snakeArray count];
   
    for (int index = 0; index < num; index++) {

        SnakePoint point;
       
        [snakeArray[index] getValue: &point];
      
        CGFloat x = point.x * 15;

        CGFloat y = point.y * 15;

        CGRect rectangle = CGRectMake(x, y, 15, 15);
       
        CGContextAddEllipseInRect(context, rectangle);
        
        [[UIColor whiteColor] set];
        
        CGContextFillPath(context);
    }
    
    NSValue * fruitValue = [self.delegate getFruit: self];
    
    SnakePoint fruitPoint;
    
    [fruitValue getValue: &fruitPoint];
   
    CGFloat x = fruitPoint.x * 15;
    
    CGFloat y = fruitPoint.y * 15;
   
    CGRect fruitRec = CGRectMake(x, y, 15, 15);
    
    CGContextAddEllipseInRect(context, fruitRec);
    
    [[UIColor greenColor] set];
    
    CGContextFillPath(context);
}

#pragma Swipe Gesture

- (void)registerGestureOnView: (UIView *)view {
    UISwipeGestureRecognizer * up = [[UISwipeGestureRecognizer alloc] initWithTarget: self
                                                                              action: @selector(swipeGesture:)];
    up.direction = UISwipeGestureRecognizerDirectionUp;
    
    [view addGestureRecognizer: up];
    
    UISwipeGestureRecognizer * down = [[UISwipeGestureRecognizer alloc] initWithTarget: self
                                                                                action: @selector(swipeGesture:)];
    down.direction = UISwipeGestureRecognizerDirectionDown;
   
    [view addGestureRecognizer: down];
    
    UISwipeGestureRecognizer * left = [[UISwipeGestureRecognizer alloc] initWithTarget: self
                                                                                action: @selector(swipeGesture:)];
    left.direction = UISwipeGestureRecognizerDirectionLeft;
   
    [view addGestureRecognizer: left];
    
    UISwipeGestureRecognizer * right = [[UISwipeGestureRecognizer alloc] initWithTarget: self
                                                                                 action: @selector(swipeGesture:)];
    right.direction = UISwipeGestureRecognizerDirectionRight;
    
    [view addGestureRecognizer: right];
}

- (void)swipeGesture: (UISwipeGestureRecognizer *)gesture {
    
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
//
//- (void)panGesture: (UIPanGestureRecognizer *)gesture {
//
//    CGPoint velocity = [gesture velocityInView: self];
//
//    if (velocity.x > 0) {
//
//        [self.delegate didChangeDirection: self with: RIGHT];
//
//    } else if (velocity.x < 0) {
//
//        [self.delegate didChangeDirection: self with: LEFT];
//
//    } else if (velocity.y > 0) {
//
//        [self.delegate didChangeDirection: self with: DOWN];
//
//    } else if (velocity.y < 0) {
//
//        [self.delegate didChangeDirection: self with: UP];
//
//    }
//}


@end
