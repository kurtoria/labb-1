//
//  ViewControllerMenu.h
//  Labb-1
//
//  Created by Victoria Grönqvist on 2018-01-20.
//  Copyright © 2018 Victoria Grönqvist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerMenu : UIViewController
+(BOOL)isChangedColor;
@property (nonatomic) float redBackgroundValueM;
@property (nonatomic) float greenBackgroundValueM;
@property (nonatomic) float blueBackgroundValueM;
@property (nonatomic) float redTextValueM;
@property (nonatomic) float greenTextValueM;
@property (nonatomic) float blueTextValueM;

@end
