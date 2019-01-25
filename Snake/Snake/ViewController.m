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

    UIWindow * window = UIApplication.sharedApplication.windows[0];
    
    self.rect = window.safeAreaLayoutGuide.layoutFrame;
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    [self initStartViewWithRect: screenRect];
}

- (void)initStartViewWithRect: (CGRect)rect {
    
    self.startView = [[UIView alloc] initWithFrame: rect];
    
    [self.startView setBackgroundColor: UIColor.blackColor];
    
    [self addButtonOnView: self.startView];
    
    [self.view addSubview: self.startView];
}

- (void)addButtonOnView: (UIView *)view {
    
    UIButton * button = [UIButton buttonWithType: UIButtonTypeCustom];
    
    [button addTarget: self action: @selector(startGame:) forControlEvents: UIControlEventTouchUpInside];
    
    [button setTitle: @"START" forState: UIControlStateNormal];
    
    [button sizeToFit];
    
    button.center = CGPointMake(self.rect.size.width / 2,  self.rect.size.height / 2);
    
    [view addSubview: button];
}

- (void)initSnakeView {
    
    self.snakeView = [[SnakeView alloc] initWithFrame: self.rect];
    
    [self.view addSubview: self.snakeView];
    
    [self.snakeView setNeedsDisplay];
    
    self.snakeView.delegate = self;
}

- (void)refresh: (NSTimer *)timer {
    
    if ([self.snake moveSnake]) {
    
        [self.snakeView setNeedsDisplay];
    
    } else {
        
        self.startView.hidden = false;
        
        [timer invalidate];
        
        self.snakeView = nil;
        
        self.snake = nil;
    }
}

- (void)startGame: (UIButton *)sendor {
    
    self.snake = [[Snake alloc] initWithHeight: self.rect.size.height / 15 withWidth: self.rect.size.width / 15];
    
    [self initSnakeView];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    [self initStartViewWithRect: screenRect];
    
    [NSTimer scheduledTimerWithTimeInterval: 0.2 target: self selector: @selector(refresh:) userInfo: nil repeats: YES];
    
    self.startView.hidden = true;
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
