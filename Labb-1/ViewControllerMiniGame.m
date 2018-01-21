//
//  miniGame.m
//  Labb-1
//
//  Created by Victoria Grönqvist on 2018-01-16.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

#import "ViewControllerMiniGame.h"
#import "ViewControllerSettings.h"

UIViewController *backgroundSavedColorGame;
UIViewController *textSavedColorGame;

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
    //[self refreshNumber];
    //[self randomNumber:secretNr];
    //[self randomNumber];
    //[self changeText:@"Gissa numret"];
    //self.numberSlider.value = 50;
    [self initialize];
    NSLog(@"viewDidLoad: secretNr is %i", secretNr);
    //self.numberSlider.value = 50;
    //self.numberShown.text = @"50";
    //ViewControllerSettings *colorSettings = [[ViewControllerSettings alloc] init];
    [super viewDidLoad];
    //[colorSettings setBackgroundColor];
    //[colorSettings setTextColor];
    [ViewControllerSettings sendBackgroundColor: self.redBackgroundValueMG andGreen:self.greenBackgroundValueMG andBlue:self.blueBackgroundValueMG
                                  andBackground:self.view];
}

//If guessing correct
-(void)initialize {
    self.numberSlider.value = 50;
    [self randomNumber];
    //[self currentNumber];
    [self refreshNumber];
    guessButtonPressed = 0;
    [self refreshNoOfGuesses];
    [self changeText:@"Gissa numret!"];
    //[self changeText:@"Gissa numret"];
}

//Creates random number
- (void)randomNumber/*:(int)randomNr*/{
    secretNr = arc4random_uniform(100)+1;
    NSLog(@"randomNumber: guess is %i", secretNr);
    //NSLog(@"inside method random number the secret nr is %i", randomNr);
    //return randomNr;
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
        //[self initialize];
    }
}

- (IBAction)playAgainButton:(id)sender {
    [self initialize];
}

//Change text when guessing
- (void)changeText:(NSString*)text {
    self.textShown.text = [NSString stringWithFormat:@"%@", text];
}

- (void) refreshNoOfGuesses {
    self.guessesShown.text = [NSString stringWithFormat:@"Antal gissningar: %i", guessButtonPressed];
    NSLog(@"refreshNoOfGuesses: guessButtonPressed is %i", guessButtonPressed);
}

//Shows hos many guesses you've made
/*- (int) currentNrOfGuesses {
    return
}*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    ViewControllerSettings *colorSetting = [[ViewControllerSettings alloc] init];
    backgroundSavedColorGame = [segue destinationViewController];
    backgroundSavedColorGame.view.backgroundColor = [colorSetting currentColor];
    textSavedColorGame = [segue destinationViewController];
    textSavedColorGame.view.tintColor = [colorSetting currentTextColor];
}


@end
