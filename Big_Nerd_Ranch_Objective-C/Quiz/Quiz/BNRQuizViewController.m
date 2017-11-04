//
//  BNRQuizViewController.m
//  Quiz
//
//  Created by Jaeho on 2017. 11. 5..
//  Copyright © 2017년 yeon. All rights reserved.
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()

#pragma mark - Property

@property (nonatomic) int currentQuestionIndex;

@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;

#pragma mark - Outlets

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;

@end

#pragma mark -

@implementation BNRQuizViewController

#pragma mark - Initialization

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.questions = @[@"From what is cognac made?",
                           @"What is 7+7?",
                           @"What is the capital of Vermont?"];
        
        self.answers = @[@"Grapes",
                         @"14",
                         @"Montpelier"];
    }
    
    return self;
}

#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - Memory Management

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)showQuestion:(id)sender {
    _currentQuestionIndex++;
    
    if (_currentQuestionIndex == [self.questions count]) {
        _currentQuestionIndex = 0;
    }
    
    NSString *question = [self.questions objectAtIndex:self.currentQuestionIndex];
    
    [self.questionLabel setText:question];
    
    [self.answerLabel setText:@"???"];
}

- (IBAction)showAnswer:(id)sender {
    NSString *answer = [self.answers objectAtIndex:self.currentQuestionIndex];
    
    [self.answerLabel setText:answer];
}

@end
