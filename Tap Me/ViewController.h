//
//  ViewController.h
//  Tap Me
//
//  Created by Mike Jaoudi on 10/17/12.
//
//

#import <UIKit/UIKit.h>


@interface ViewController : UITableViewController{
    IBOutlet UIBarButtonItem *timerLabel;
    IBOutlet UIBarButtonItem *gameMode;
    NSInteger count;
    NSInteger seconds;
    NSInteger minutes;
    NSInteger subseconds;
    
    //Auto
    IBOutlet UISegmentedControl *JewelA;
    IBOutlet UITextField *GliphsA;
    IBOutlet UISegmentedControl *SafeZoneA;
    IBOutlet UISegmentedControl *VuforiaA;
    
    //Tele
    IBOutlet UISegmentedControl *Crypto;
    IBOutlet UISegmentedControl *Columns1;
    IBOutlet UISegmentedControl *Rows1;
    IBOutlet UITextField *totalGlyphs;
    
    
    IBOutlet UISegmentedControl *Crypto2;
    IBOutlet UISegmentedControl *Columns2;
    IBOutlet UISegmentedControl *Rows2;
    IBOutlet UITextField *totalGlyphs2;
    
    //Endgame
    IBOutlet UISegmentedControl *Zone1;
    IBOutlet UISegmentedControl *upRightBonus1;
    IBOutlet UISegmentedControl *Zone2;
    IBOutlet UISegmentedControl *upRightBonus2;
    
    
    IBOutlet UISegmentedControl *Balanced1;
    IBOutlet UISegmentedControl *Balanced2;
    
    IBOutlet UIBarButtonItem *startButton;
    
    
    NSTimer *timer; //ADD THIS!!
}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *pausePlay;

- (IBAction) startTimer;
- (IBAction) resetTimer;
- (IBAction) pauseTimer;
- (IBAction) getOptions;
- (IBAction)reset;

- (IBAction) goSite;
-(IBAction)goFB;
- (void)setupGame;
- (void)subtractTime;

@end

