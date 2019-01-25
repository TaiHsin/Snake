//
//  ViewController.h
//  Snake
//
//  Created by Tsihsin Lee on 2019/1/22.
//  Copyright © 2019 Tsihsin Lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model/Snake.h"
#import "SnakeView.h"

@interface ViewController : UIViewController <SnakeViewDelegate>

@property Snake * snake;

@property SnakeView * snakeView;

@property UIView * startView;

@end

