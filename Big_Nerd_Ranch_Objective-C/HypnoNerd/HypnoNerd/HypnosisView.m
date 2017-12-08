//
//  HypnosisView.m
//  HypnoNerd
//
//  Created by USER on 2017. 12. 8..
//  Copyright © 2017년 USER. All rights reserved.
//

#import "HypnosisView.h"

@interface HypnosisView()

@property (nonatomic, strong) UIColor *circleColor;

@end

@implementation HypnosisView

#pragma mark - Initialization

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.backgroundColor = UIColor.clearColor;
        self.circleColor = UIColor.lightGrayColor;
    }
    
    return self;
}

#pragma mark - Setter Method

- (void)setCircleColor:(UIColor *)circleColor {
    _circleColor = circleColor;
    [self setNeedsDisplay];
}

#pragma mark - View Drawing

- (void)drawRect:(CGRect)rect {
    CGRect bounds = self.bounds;
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    CGFloat maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    [path setLineWidth:10.0];
    
    for (CGFloat currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
        [self.circleColor setStroke];
    }
    
    [path stroke];
}

#pragma mark - Touch Event

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@ was touched", self);
    
    CGFloat red = (arc4random() % 100) / 100.0;
    CGFloat green = (arc4random() % 100) / 100.0;
    CGFloat blue = (arc4random() % 100) / 100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red
                                           green:green
                                            blue:blue
                                           alpha:1.0];
    
    [self setCircleColor:randomColor];
}

@end
