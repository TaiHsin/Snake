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
    [NSTimer scheduledTimerWithTimeInterval: 0.5 target: self selector: @selector(refresh:) userInfo: nil repeats: YES];
}

-(void)initSnakeView {
    CGRect rect = [[UIScreen mainScreen] bounds];
    self.snakeView = [[SnakeView alloc] initWithFrame: rect];
    [self.view addSubview: self.snakeView];
    [self.snakeView setNeedsDisplay];
    self.snakeView.delegate = self;
}

-(void)refresh: (NSTimer *)timer {
    [self.snake changeDirection:LEFT];
    [self.snakeView setNeedsDisplay];
}

#pragma SnakeViewDelegate

- (NSValue *)getFruit:(SnakeView *)snakeView {
    return self.snake.fruit;
}

- (NSMutableArray *)getSnake:(SnakeView *)snakeView {
    return self.snake.arrayOfPoints;
}

@end
