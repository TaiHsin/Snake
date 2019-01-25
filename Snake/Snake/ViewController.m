//
//  ViewController.m
//  Snake
//
//  Created by Tsihsin Lee on 2019/1/22.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int heigth = [[UIScreen mainScreen] bounds].size.height / 10;
    int width = [[UIScreen mainScreen] bounds].size.width / 10;
    
    self.snake = [[Snake alloc] initWithHeight: heigth withWidth: width];
    [self initSnakeView];
    [self registerGesture];
    [NSTimer scheduledTimerWithTimeInterval: 0.2 target: self selector: @selector(refresh:) userInfo: nil repeats: YES];
}

-(void)initSnakeView {
    CGRect rect = [[UIScreen mainScreen] bounds];
    self.snakeView = [[SnakeView alloc] initWithFrame: rect];
    [self.view addSubview: self.snakeView];
    [self.snakeView setNeedsDisplay];
    self.snakeView.delegate = self;
}

-(void)refresh: (NSTimer *)timer {
    [self.snake moveSnake];
    [self.snakeView setNeedsDisplay];
}

-(void)registerGesture {
    UISwipeGestureRecognizer * up = [[UISwipeGestureRecognizer alloc] initWithTarget: self action: @selector(swipeGesture:)];
    up.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer: up];
    
    UISwipeGestureRecognizer * down = [[UISwipeGestureRecognizer alloc] initWithTarget: self action: @selector(swipeGesture:)];
    down.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer: down];
    
    UISwipeGestureRecognizer * left = [[UISwipeGestureRecognizer alloc] initWithTarget: self action: @selector(swipeGesture:)];
    left.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer: left];
    
    UISwipeGestureRecognizer * right = [[UISwipeGestureRecognizer alloc] initWithTarget: self action: @selector(swipeGesture:)];
    right.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer: right];
}

-(void)swipeGesture: (UISwipeGestureRecognizer *)gesture {
    
    switch (gesture.direction) {
        case UISwipeGestureRecognizerDirectionUp:
            [self.snake changeDirection: UP];
            break;
            
        case UISwipeGestureRecognizerDirectionDown:
            [self.snake changeDirection: DOWN];
            break;

        case UISwipeGestureRecognizerDirectionLeft:
            [self.snake changeDirection: LEFT];
            break;
            
        case UISwipeGestureRecognizerDirectionRight:
            [self.snake changeDirection: RIGHT];
            break;
    }
}

#pragma SnakeViewDelegate

- (NSValue *)getFruit:(SnakeView *)snakeView {
    return self.snake.fruit;
}

- (NSMutableArray *)getSnake:(SnakeView *)snakeView {
    return self.snake.arrayOfPoints;
}

@end
