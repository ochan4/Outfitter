//
//  ViewController.m
//  换衣服动画
//
//  Created by AierChen on 3/6/16.
//  Copyright © 2016年 Canterbury Tale Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIView *clipUIView;

@property (weak, nonatomic) IBOutlet UIButton *lineButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.clipUIView.clipsToBounds = YES;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    [self.lineButton addGestureRecognizer:pan];
    
}

-(void)panAction:(UIPanGestureRecognizer*)pan{
    UIView *line = pan.view;
    //locationInView: 在主页面的位置
    CGPoint p = [pan locationInView:self.view];
    
    //用switchcase来控制：stateBegan,StateChanged,stateEnded
    //statechage:image跟随 locationinview
    //stateended:超过下半部分删掉图片
    switch ((int)pan.state) {
        case UIGestureRecognizerStateBegan:
            
            break;
            
        case UIGestureRecognizerStateChanged:
            line.center = CGPointMake(line.center.x, p.y);
            self.clipUIView.frame = CGRectMake(self.clipUIView.bounds.origin.x, self.clipUIView.bounds.origin.y, self.clipUIView.bounds.size.width, p.y);
            NSLog(@"长宽：%f,%f",self.clipUIView.bounds.size.width,self.clipUIView.bounds.size.height);
            NSLog(@"点：%f,%f",p.x,p.y);
            break;
            
        case UIGestureRecognizerStateEnded:
            break;
            
        case UIGestureRecognizerStateCancelled:
            break;
            
    }
}


@end
