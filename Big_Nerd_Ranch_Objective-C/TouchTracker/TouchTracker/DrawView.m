//
//  DrawView.m
//  TouchTracker
//
//  Created by USER on 2017. 12. 29..
//  Copyright © 2017년 USER. All rights reserved.
//

#import "DrawView.h"
#import "Line.h"

@interface DrawView ()

#pragma mark - Private Properties

@property (strong, nonatomic) NSMutableDictionary *linesInProgress;
@property (strong, nonatomic) NSMutableArray *finishedLines;

@end

#pragma mark -

@implementation DrawView

#pragma mark - Initialization

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        self.linesInProgress = [[NSMutableDictionary alloc] init];
        self.finishedLines = [[NSMutableArray alloc] init];
        
        [self setBackgroundColor:[UIColor grayColor]];
        [self setMultipleTouchEnabled:YES];
    }
    
    return self;
}

#pragma mark - Drawing View

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    [[UIColor blackColor] set];
    for (Line *line in self.finishedLines) {
        [self strokeLine:line];
    }
    
    [[UIColor redColor] set];
    for (NSValue *key in self.linesInProgress) {
        [self strokeLine:[self.linesInProgress objectForKey:key]];
    }
}

#pragma mark - Touch Events

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInView:self];
        
        Line *line = [[Line alloc] init];
        [line setBegin:location];
        [line setEnd:location];
        
        NSValue *key = [NSValue valueWithNonretainedObject:touch];
        [self.linesInProgress setObject:line forKey:key];
    }
    
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    for (UITouch *touch in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:touch];
        Line *line = [self.linesInProgress objectForKey:key];
        
        line.end = [touch locationInView:self];
    }
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    for (UITouch *touch in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:touch];
        Line *line = self.linesInProgress[key];
        
        [self.finishedLines addObject:line];
        [self.linesInProgress removeObjectForKey:key];
    }
    
    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    for (UITouch *touch in touches) {
        NSValue *key = [NSValue valueWithNonretainedObject:touch];
        [self.linesInProgress removeObjectForKey:key];
    }
    
    [self setNeedsDisplay];
}

#pragma mark - Private Methods

- (void)strokeLine:(Line *)line {
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path setLineWidth:10.0];
    [path setLineCapStyle:kCGLineCapRound];
    
    [path moveToPoint:line.begin];
    [path addLineToPoint:line.end];
    [path stroke];
}

@end
