//
//  SnakeView.h
//  Snake
//
//  Created by Tsihsin Lee on 2019/1/24.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Model/Snake.h"

@class SnakeView;

@protocol SnakeViewDelegate <NSObject>

-(NSMutableArray *)getSnake: (SnakeView *) snakeView;

-(NSValue *)getFruit: (SnakeView *) snakeView;

-(void)didChangeDirection: (SnakeView *) snakeView with: (Direction) direction;

@end

@interface SnakeView: UIView

@property (weak, nonatomic) id <SnakeViewDelegate> delegate;

@end
