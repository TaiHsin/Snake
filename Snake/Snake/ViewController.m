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

int screenHeight;
int screenWidth;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    screenHeight = [[UIScreen mainScreen] bounds].size.height;
    
    screenWidth = [[UIScreen mainScreen] bounds].size.width;
    
    self.snake = [[Snake alloc] initWithHeight: screenHeight / 10 withWidth: screenWidth / 10];
    
    [self initSnakeView];
    
    [self initStartView];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.2 target: self selector: @selector(refresh:) userInfo: nil repeats: YES];
}

-(void)initStartView {
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    
    self.startView = [[UIView alloc] initWithFrame: rect];
    
    [self.startView setBackgroundColor: UIColor.blackColor];
    
    [self addButtonOnView: self.startView];
    
    [self.view addSubview: self.startView];
}

-(void)addButtonOnView: (UIView *)view {
    
    UIButton * button = [UIButton buttonWithType: UIButtonTypeCustom];
    
    [button addTarget: self action: @selector(startGame:) forControlEvents: UIControlEventTouchUpInside];
    
    [button setTitle: @"START" forState: UIControlStateNormal];
    
    [button sizeToFit];
    
    button.center = CGPointMake(screenWidth / 2, screenHeight / 2);
    
    [view addSubview: button];
}

-(void)initSnakeView {
    
    CGRect rect = [[UIScreen mainScreen] bounds];
    
    self.snakeView = [[SnakeView alloc] initWithFrame: rect];
    
    [self.view addSubview: self.snakeView];
    
    [self.snakeView setNeedsDisplay];
    
    self.snakeView.delegate = self;
}

-(void)refresh: (NSTimer *)timer {
    
    if ([self.snake moveSnake]) {
    
        [self.snakeView setNeedsDisplay];
    
    } else {
        
        self.startView.hidden = false;
    }
}

-(void)startGame: (UIButton *)sendor {
    
    sendor.superview.hidden = true;
}

#pragma SnakeViewDelegate

- (NSValue *)getFruit:(SnakeView *)snakeView {
    
    return self.snake.fruit;
}

- (NSMutableArray *)getSnake:(SnakeView *)snakeView {
   
    return self.snake.arrayOfPoints;
}

- (void)didChangeDirection:(SnakeView *)snakeView with:(Direction)direction {
    
    [self.snake changeDirection: direction];
}

@end
