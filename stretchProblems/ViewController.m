//
//  ViewController.m
//  stretchProblems
//
//  Created by Taylor Mott on 11.2.15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//


#import "ViewController.h"
#include <stdlib.h>

@interface ViewController ()

//For displaying returns
@property (strong, nonatomic) UILabel *answerLabel;
//

//For timerWithMinutes
@property (assign, nonatomic) int minutes;
@property (assign, nonatomic) int seconds;
//

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.answerLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
    self.answerLabel.textAlignment = NSTextAlignmentCenter;
    self.answerLabel.font = [UIFont systemFontOfSize:32];
    [self.view addSubview:self.answerLabel];    
    
//    [self randomDictionary];
    
//    [self multiplesOf3and5BelowNumber:10];
//    [self multiplesOf3and5BelowNumber:30];
//    [self multiplesOf3and5BelowNumber:100];
//    [self multiplesOf3and5BelowNumber:999];
//    [self multiplesOf3and5BelowNumber:1000];
//    [self multiplesOf3and5BelowNumber:2000];
    
//    int noOfVowels = [self numberOfVowelsInString:@"Today is a good day! and I like to run a lot!"];
   
//    answerLabel.text = [NSString stringWithFormat:@"%i", noOfVowels];
    
    
//    [self timerWithMinutes:25 andSeconds:25];
    
//    self.answerLabel.text = [self longestWordInString:@"Create a method that will find, return the longest word in a stringsc."];
    
//    if ([self isInFibonacci:0])
//    {
//        self.answerLabel.text = @"YES";
//    }
//    else
//    {
//        self.answerLabel.text = @"NO";
//    }
}


/**
 create a function that will act like a timer and set a label that looks like a countdown timer
 
 @param minutes int of number of minutes to set timer at
 
 @param seconds int of number of seconds to set timer at
 */

- (void)timerWithMinutes:(int)minutes andSeconds:(int)seconds
{
    if (!minutes && !seconds)
    {
        if (self.seconds > 0)
        {
            self.seconds--;
            self.answerLabel.text = [NSString stringWithFormat:@"%i:%i", self.minutes, self.seconds];
            [self performSelector:@selector(timerWithMinutes:andSeconds:) withObject:nil afterDelay:1.0];
        }
        else if (self.seconds == 0 && self.minutes > 0)
        {
            self.minutes--;
            self.seconds = 59;
            self.answerLabel.text = [NSString stringWithFormat:@"%i:%i", self.minutes, self.seconds];
            [self performSelector:@selector(timerWithMinutes:andSeconds:) withObject:nil afterDelay:1.0];
        }
        else
        {
            self.answerLabel.text = @"Timer Complete";
        }
        
    }
    else
    {
        if (seconds > 0)
        {
            seconds--;
            self.seconds = seconds;
            self.minutes = minutes;
            self.answerLabel.text = [NSString stringWithFormat:@"%i:%i", minutes, seconds];
            [self performSelector:@selector(timerWithMinutes:andSeconds:) withObject:nil afterDelay:1.0];
        }
        else if (seconds == 0 && minutes > 0)
        {
            minutes--;
            seconds = 59;
            self.seconds = seconds;
            self.minutes = minutes;
            self.answerLabel.text = [NSString stringWithFormat:@"%i:%i", minutes, seconds];
            [self performSelector:@selector(timerWithMinutes:andSeconds:) withObject:nil afterDelay:1.0];
        }
        else
        {
            self.answerLabel.text = @"Timer Complete";
        }
    }
    
}

/**
 create a function that returns a random fact about a country from an NSDictionary:
    EXAMPLE:
        @{@"name" : @"England",
          @"population" : @"53012456",
          @"continent" : @"Europe",
          @"major export" : @"pharmaceuticals"}
 */

- (void)randomDictionary
{
    NSDictionary *englandDictionary = @{@"name" : @"England",
                                        @"population" : @"53012456",
                                        @"continent" : @"Europe",
                                        @"major export" : @"pharmaceuticals"};

    NSArray *keysArray = [englandDictionary allKeys];
    NSUInteger numberOfKeys = keysArray.count;

    int randomNumber = arc4random_uniform((int)numberOfKeys);

    NSString *randomKey = keysArray[randomNumber];

    NSLog(@"%@", englandDictionary[randomKey]);

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, self.view.frame.size.width, 100)];
    label.text = englandDictionary[randomKey];
    [self.view addSubview:label];
}

/**
 create a method that returns the sum of multiples of 3 and 5 below 1000 and below the number passed in
 
 @param max int that is the highest number to check (if less than 1000)
 */

- (void)multiplesOf3and5BelowNumber:(int)max
{
    int sum = 0;
    int iterateMax = 0;

    if(max >= 1000)
    {
        iterateMax = 1000;
    }
    else
    {
        iterateMax = max;
    }

    for(int i = 1; i < iterateMax; i++)
    {
        if (i % 3 == 0 && i < 1000)
        {
            sum += i;
        }
        else if (i % 5 == 0 && i < 1000)
        {
            sum += i;
        }
    }

    NSLog(@"%i", sum);
}


/**
 Write a method that will return the number of vowels in a string
 
 @param string NSString that will be checked for number of vowels
 
 @return int of number of vowels in string
 */

- (int)numberOfVowelsInString:(NSString *)string
{
    int numberOfVowels = 0;
    
    NSArray *arrayOfVowels = @[@"A", @"a", @"E", @"e", @"I", @"i", @"O", @"o", @"U", @"u"];
    
    for (int i = 0; i < [string length]; i++)
    {
        unichar character = [string characterAtIndex:i];
        NSString *charString = [NSString stringWithCharacters:&character length:1];
        
        for (int j = 0; j < arrayOfVowels.count; j++)
        {
            if ([charString isEqualToString:arrayOfVowels[j]])
            {
                numberOfVowels++;
            }
        }
    }
    
    return numberOfVowels;
}


/**
 Create a method that will find and return the longest word in a string.
 
 @param string NSString that will be parsed to find the longest word
 
 @return returns longest word in string as an NSSting
 */

- (NSString *)longestWordInString:(NSString *)string
{
    NSString *returnString = @"";
    NSInteger longestStringLength = 0;
    
    NSMutableCharacterSet *characterSet = [NSMutableCharacterSet whitespaceAndNewlineCharacterSet];
    [characterSet formUnionWithCharacterSet:[NSCharacterSet punctuationCharacterSet]];
    
    NSArray *wordsArray = [string componentsSeparatedByCharactersInSet:characterSet];
    
    returnString = wordsArray[0];
    longestStringLength = returnString.length;
    
    for (NSString *substring in wordsArray)
    {
    
        if (substring.length > longestStringLength)
        {
            returnString = substring;
            longestStringLength = substring.length;
        }
    }
    
    return returnString;
}

/**
 create a function that returns a BOOL representing whether or not a parameter is in the Fibonacci Sequence
  
 @param number NSInteger that will be checked if it is in the Fibonacci Sequence
 
 @return YES if number is in Fibonacci Sequence, NO otherwise
  */

- (BOOL)isInFibonacci:(NSInteger)number
{
    BOOL isInFib = YES;
    NSInteger n0 = 0;
    NSInteger n1 = 1;
    NSInteger answer = 0;
    
    while (answer <= number)
    {
        if (answer == number)
        {
            return isInFib;
        }
        else
        {
            answer = n0 + n1;
            n0 = n1;
            n1 = answer;
            
        }
    }
    
    return !isInFib;
}

@end