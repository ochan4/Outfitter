//
//  ViewController.m
//  换衣服动画
//
//  Created by AierChen on 3/6/16.
//  Copyright © 2016年 Canterbury Tale Inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//UIImageView
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView3;

//UIView
@property (weak, nonatomic) IBOutlet UIView *clipUIView;
@property (weak, nonatomic) IBOutlet UIView *clipShoeUIView;

//ScrollView
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView1;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView2;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView3;

//Button
@property (weak, nonatomic) IBOutlet UIButton *lineShirtButton;
@property (weak, nonatomic) IBOutlet UIButton *lineShoeButton;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.clipUIView.clipsToBounds = YES;
    self.clipShoeUIView.clipsToBounds = YES;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panShirtAction:)];
    [self.lineShirtButton addGestureRecognizer:pan];
    
    UIPanGestureRecognizer *panShoe = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panShoeAction:)];
    [self.lineShoeButton addGestureRecognizer:panShoe];
    
    
    
    
    /*Testing1*/
    self.scrollView1.contentSize = CGSizeMake(375*2, 667);
    
    UIImageView *imageView12 = [[UIImageView alloc]initWithFrame:CGRectMake(375, 0, 375, 667)];
    imageView12.image = [UIImage imageNamed:@"outfitter3.jpg"];
    [self.scrollView1 addSubview:imageView12];
    
    /*Testing2*/
    self.scrollView2.contentSize = CGSizeMake(375*2, 667);
    
    UIImageView *imageView22 = [[UIImageView alloc]initWithFrame:CGRectMake(375, 0, 375, 667)];
    imageView22.image = [UIImage imageNamed:@"outfitter4.jpg"];
    [self.scrollView2 addSubview:imageView22];
    
    /*Testing3*/
    self.scrollView3.contentSize = CGSizeMake(375*2, 667);
    
    UIImageView *imageView32 = [[UIImageView alloc]initWithFrame:CGRectMake(375, -480, 375, 667)];
    imageView32.image = [UIImage imageNamed:@"outfitter3.jpg"];
    [self.scrollView3 addSubview:imageView32];
    
}

-(void)panShirtAction:(UIPanGestureRecognizer*)pan{
    UIView *line = pan.view;
    CGPoint p = [pan locationInView:self.view];
    
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

-(void)panShoeAction:(UIPanGestureRecognizer*)pan{
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
            
            self.clipShoeUIView.center = line.center;
            
            //self.clipShoeUIView.frame = CGRectMake(self.clipShoeUIView.bounds.origin.x, p.y, self.clipShoeUIView.bounds.size.width, self.clipShoeUIView.bounds.size.height+2);
            
            //self.clipShoeUIView.transform = CGAffineTransformScale(self.clipShoeUIView.transform, 0, 2);
            
            NSLog(@"长宽：%f,%f",self.clipShoeUIView.bounds.origin.x,self.clipShoeUIView.bounds.origin.y);
            NSLog(@"长宽：%f,%f",self.clipShoeUIView.bounds.size.width,self.clipShoeUIView.bounds.size.height);
            NSLog(@"点：%f,%f",p.x,p.y);
            
            break;
            
        case UIGestureRecognizerStateEnded:
            break;
            
        case UIGestureRecognizerStateCancelled:
            break;
            
    }
}


@end
