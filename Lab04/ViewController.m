//
//  ViewController.m
//  Lab04
//
//  Created by Rui Geng on 2016-09-29.
//  Copyright © 2016 Rui GengGengRui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Define user default preference
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    //Load water count value from preference
    _waterIndex = [userDefaults floatForKey:@"waterCount"];
    
    //Set images to an array
    _imageArray = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"Image1"],
                   [UIImage imageNamed:@"Image2"],
                   [UIImage imageNamed:@"Image3"],
                   [UIImage imageNamed:@"Image4"],
                   [UIImage imageNamed:@"Image5"],
                   nil];
    
    //change image
    [self changeImage: _waterIndex ];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)waterButton:(id)sender {
    _waterIndex++;
    
    // if the waterIndex is bundel
    if(_waterIndex > 4){
        _waterIndex = 0;
    }
    
    //change image
    [self changeImage: _waterIndex ];
}


- (IBAction)saveButton:(id)sender {
    
    //save the value to the user preference
    [self saveUserPreference];
    
}

- (void)saveUserPreference {
    
    //define a user preference
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    //Save the waterIndex to the preferences
    [userDefaults setInteger: _waterIndex forKey: @"waterCount"];
}

- (IBAction)resetButton:(id)sender {
    
    _waterIndex = 0;
    
    //Change Image by using waterIndex
    [self changeImage:_waterIndex];
    
    //save the value to the user preference
    [self saveUserPreference];
}

- (void) changeImage:(NSInteger)index{
    
    UIImage *btnImage = [_imageArray objectAtIndex:index];
    
    [_waterButton setImage:btnImage forState:UIControlStateNormal];
}

@end
