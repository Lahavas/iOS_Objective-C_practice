//
//  DrawView.m
//  TouchTracker
//
//  Created by USER on 2017. 12. 29..
//  Copyright © 2017년 USER. All rights reserved.
//

#import "DrawView.h"
#import "Line.h"

@interface DrawView () <UIGestureRecognizerDelegate>

#pragma mark - Private Properties

@property (strong, nonatomic) NSMutableDictionary *linesInProgress;
@property (strong, nonatomic) NSMutableArray *finishedLines;

@property (weak, nonatomic) Line *selectedLine;

#pragma mark - Gesture Recognizer's Properties

@property (strong, nonatomic) UITapGestureRecognizer *tapGestureRecognizer;
@property (strong, nonatomic) UITapGestureRecognizer *doubleTapGestureRecognizer;
@property (strong, nonatomic) UILongPressGestureRecognizer *longPressGestureRecognizer;
@property (strong, nonatomic) UIPanGestureRecognizer *panGestureRecognizer;

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
        
        self.doubleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                  action:@selector(doubleTap:)];
        [self.doubleTapGestureRecognizer setNumberOfTapsRequired:2];
        [self.doubleTapGestureRecognizer setDelaysTouchesBegan:YES];
        
        self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                            action:@selector(tap:)];
        [self.tapGestureRecognizer setDelaysTouchesBegan:YES];
        [self.tapGestureRecognizer requireGestureRecognizerToFail:self.doubleTapGestureRecognizer];
        
        self.longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                                                        action:@selector(longPress:)];
        
        self.panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                            action:@selector(moveLine:)];
        
        [self.panGestureRecognizer setDelegate:self];
        [self.panGestureRecognizer setCancelsTouchesInView:NO];
        
        [self addGestureRecognizer:self.doubleTapGestureRecognizer];
        [self addGestureRecognizer:self.tapGestureRecognizer];
        [self addGestureRecognizer:self.longPressGestureRecognizer];
        [self addGestureRecognizer:self.panGestureRecognizer];
    }
    
    return self;
}

- (void)dealloc {
    [self removeGestureRecognizer:self.doubleTapGestureRecognizer];
    [self removeGestureRecognizer:self.tapGestureRecognizer];
    [self removeGestureRecognizer:self.longPressGestureRecognizer];
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
    
    if (self.selectedLine) {
        [[UIColor greenColor] set];
        [self strokeLine:self.selectedLine];
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

#pragma mark - First Responder

- (BOOL)canBecomeFirstResponder {
    return YES;
}

#pragma mark - Gesture Recognizer's Actions

- (void)doubleTap:(UIGestureRecognizer *)gestureRecognizer {
    NSLog(@"Recognized Double Tap");
    
    [self.linesInProgress removeAllObjects];
    [self.finishedLines removeAllObjects];
    
    [self setNeedsDisplay];
}

- (void)tap:(UIGestureRecognizer *)gestureRecognizer {
    NSLog(@"Recognized Tap");
    
    CGPoint point = [gestureRecognizer locationInView:self];
    self.selectedLine = [self lineAtPoint:point];
    
    if (self.selectedLine) {
        [self becomeFirstResponder];
        
        UIMenuController *menuController = [UIMenuController sharedMenuController];
        
        UIMenuItem *deleteItem = [[UIMenuItem alloc] initWithTitle:@"Delete"
                                                            action:@selector(deleteLine:)];
        [menuController setMenuItems:@[deleteItem]];
        
        [menuController setTargetRect:CGRectMake(point.x, point.y, 2.0, 2.0)
                               inView:self];
        [menuController setMenuVisible:YES
                              animated:YES];
    } else {
        [[UIMenuController sharedMenuController] setMenuVisible:NO
                                                       animated:YES];
    }
    
    [self setNeedsDisplay];
}

- (void)longPress:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        CGPoint point = [gestureRecognizer locationInView:self];
        self.selectedLine = [self lineAtPoint:point];
        
        if (self.selectedLine) {
            [self.linesInProgress removeAllObjects];
        }
    } else if (gestureRecognizer.state == UIGestureRecognizerStateEnded) {
        self.selectedLine = nil;
    }
    
    [self setNeedsDisplay];
}

- (void)moveLine:(UIPanGestureRecognizer *)gestureRecognizer {
    if (!self.selectedLine) {
        return;
    }
    
    if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gestureRecognizer translationInView:self];
        
        CGPoint begin = self.selectedLine.begin;
        CGPoint end = self.selectedLine.end;
        
        begin.x += translation.x;
        begin.y += translation.y;
        end.x += translation.x;
        end.y += translation.y;
        
        self.selectedLine.begin = begin;
        self.selectedLine.end = end;
        
        [self setNeedsDisplay];
        
        [gestureRecognizer setTranslation:CGPointZero
                                   inView:self];
    }
}

#pragma mark - Actions

- (void)deleteLine:(id)sender {
    [self.finishedLines removeObject:self.selectedLine];
    
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

- (Line *)lineAtPoint:(CGPoint)point {
    for (Line *line in self.finishedLines) {
        CGPoint begin = line.begin;
        CGPoint end = line.end;
        
        for (float t = 0.0; t <= 1.0; t += 0.05) {
            float x = begin.x + t * (end.x - begin.x);
            float y = begin.y + t * (end.y - begin.y);
            
            if (hypot(x - point.x, y - point.y) < 20.0) {
                return line;
            }
        }
    }
    
    return nil;
}

#pragma mark - Gesture Recognizer Delegate

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if (gestureRecognizer == self.panGestureRecognizer) {
        return YES;
    }
    return NO;
}

@end
