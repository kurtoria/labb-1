//
//  miniGame.m
//  Labb-1
//
//  Created by Victoria Grönqvist on 2018-01-16.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

#import "ViewControllerMiniGame.h"
#import "ViewControllerSettings.h"

//UIViewController *backgroundSavedColorGame;
//UIViewController *textSavedColorGame;

@interface ViewControllerMiniGame ()
@property (weak, nonatomic) IBOutlet UISlider *numberSlider;
@property (weak, nonatomic) IBOutlet UILabel *numberShown;
@property (weak, nonatomic) IBOutlet UILabel *textShown;
@property (weak, nonatomic) IBOutlet UILabel *guessesShown;
@property (weak, nonatomic) IBOutlet UIButton *correctButton;


@end

@implementation ViewControllerMiniGame
int guess;
int secretNr;
NSString *text = @"";
int guessButtonPressed;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialize];
    NSLog(@"viewDidLoad: secretNr is %i", secretNr);
    [super viewDidLoad];
    [ViewControllerSettings sendBackgroundColor: self.redBackgroundValueMG andGreen:self.greenBackgroundValueMG andBlue:self.blueBackgroundValueMG
                                  andBackground:self.view];
}

//Initializes the game, with generating random nr, refresh slider, refresh number of guesses and changing the text
-(void)initialize {
    self.numberSlider.value = 50;
    guessButtonPressed = 0;
    [self randomNumber];
    [self refreshNumber];
    [self refreshNoOfGuesses];
    [self changeText:@"Gissa numret!"];
}

//Generates random number
- (void)randomNumber/*:(int)randomNr*/{
    secretNr = arc4random_uniform(100)+1;
    NSLog(@"randomNumber: guess is %i", secretNr);
}

//Refreshes number in text field
- (void) refreshNumber {
    guess = [self currentNumber];
    self.numberShown.text = [NSString stringWithFormat:@"%i", guess];
    NSLog(@"refreshNumber: guess is %i", guess);
}

//Takes the number from the slides
- (int) currentNumber {
    return self.numberSlider.value;
}

//Shows number of guesses
- (void) refreshNoOfGuesses {
    self.guessesShown.text = [NSString stringWithFormat:@"Antal gissningar: %i", guessButtonPressed];
    NSLog(@"refreshNoOfGuesses: guessButtonPressed is %i", guessButtonPressed);
}

//When changing the slider, the shown number changes as well
- (IBAction)sliderChanged:(id)sender {
    [self refreshNumber];
}

//When pressing guess button
- (IBAction)guessButton:(id)sender {
    guessButtonPressed++;
    [self refreshNoOfGuesses];
    NSLog(@"guessButton: Antal gissningar: %i", guessButtonPressed);
    if (guess > secretNr) {
        [self changeText:@"För högt"];
        NSLog(@"guessButton: guess är %i", guess);
    } else if (guess < secretNr) {
        [self changeText:@"För lågt"];
        NSLog(@"guessButton: guess är %i", guess);
    } else {
        [self changeText:@"Korrekt!!"];
        NSLog(@"guessButton: guess är %i", guess);
    }
}

//Initializes the game again if pressing reset button
- (IBAction)playAgainButton:(id)sender {
    [self initialize];
}

//Method for changing the text
- (void)changeText:(NSString*)text {
    self.textShown.text = [NSString stringWithFormat:@"%@", text];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
