//
//  CustomView.m
//  TestDrawLine
//
//  Created by liujing on 17/5/22.
//  Copyright © 2017年 jean. All rights reserved.
//

#import "CustomView.h"
const NSInteger tag_padding = 1000;

@interface CustomView(){
    NSInteger selectTag;
}

@end

@implementation CustomView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        for (int i = 0; i < 3; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            btn.tag= i + tag_padding;
            [btn setFrame:CGRectMake(i * frame.size.width/3, 0, frame.size.width/3, 30)];
            [btn setTitle:[NSString stringWithFormat:@"btn%@",@(i)] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(btnTaped:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
        }
        selectTag = tag_padding;
    }
    return self;
}

//上面的方法return之后会自动执行此方法
- (void)drawRect:(CGRect)rect {
    // Drawing code
        CGFloat width = self.bounds.size.width;
        UIButton * btn = [self viewWithTag:selectTag];
    
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGColorRef color = [UIColor redColor].CGColor;
        CGContextSetStrokeColorWithColor(context, color);
    
        CGPoint aPoints[5];
        aPoints[0] =CGPointMake(0, 30+6);
        aPoints[1] =CGPointMake(btn.center.x - 5, 30+6);
        aPoints[2] = CGPointMake(btn.center.x , 30);
        aPoints[3] = CGPointMake(btn.center.x + 5 , 30+6);
        aPoints[4] = CGPointMake(width, 30+6);
    
        CGContextSetLineWidth(context, 1);
        CGContextAddLines(context, aPoints, 5);
        CGContextDrawPath(context, kCGPathStroke);
}


-(void)btnTaped:(id)sender{
    UIButton * btn = (UIButton *)sender;
    selectTag = btn.tag;
    [self setNeedsDisplay];//手动调用drawRect
}

@end
