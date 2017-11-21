//
//  ViewController.m
//  Relic-Recovery-iOS-Scoring
//
//  Created by Neal Soni on 11/20/17.
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    seconds=[[NSUserDefaults standardUserDefaults] integerForKey:@"seconds"];
    [self resetTime];
    timer = nil;

    
    self.navigationController.navigationBar.barStyle=UIBarStyleBlack;
    UIFont *font = [UIFont boldSystemFontOfSize:22];
    NSDictionary *attributes = @{NSFontAttributeName: font};
    [timerLabel setTitleTextAttributes:attributes forState:UIControlStateNormal];
    [self.tableView setBackgroundColor:[UIColor blackColor]];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getOptions{
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:@"Game Types" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"No Autonomous",
                            @"Just Endgame",
                            @"Normal",
                            nil];
    popup.tag = 1;
    [popup showInView:[UIApplication sharedApplication].keyWindow];
}

- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (popup.tag) {
        case 1: {
            switch (buttonIndex) {
                case 0:
                    [[NSUserDefaults standardUserDefaults] setInteger:120 forKey:@"seconds"];
                    
                    [timer invalidate];
                    timer = nil;


                    break;
                case 1:
[[NSUserDefaults standardUserDefaults] setInteger:30 forKey:@"seconds"];
                    [timer invalidate];
                    timer = nil;

break;
                case 2:
[[NSUserDefaults standardUserDefaults] setInteger:150 forKey:@"seconds"];
                    [timer invalidate];
                    timer = nil;

break;
                
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
    seconds=[[NSUserDefaults standardUserDefaults] integerForKey:@"seconds"];
    [self resetTime];
    timer = nil;

}

//Implementing our method
- (IBAction)startTimer{
    [self setupGame];
    
    if(seconds == 120){
        self.navigationController.toolbar.barTintColor =  self.navigationController.toolbar.tintColor;
        self.navigationController.toolbar.tintColor = [UIColor whiteColor];
        gameMode.image=[UIImage imageNamed:@"joystick"];
    }
    if(seconds == 30){
        self.navigationController.toolbar.barTintColor = [UIColor redColor];
        self.navigationController.toolbar.tintColor = [UIColor whiteColor];
        gameMode.image=[UIImage imageNamed:@"stopwatch"];
    }
    
    if(seconds < 1){
        self.navigationController.toolbar.barTintColor = nil;
        self.navigationController.toolbar.tintColor = nil;
        [timer invalidate];
        timer = nil;

    }
        
    }
    



- (IBAction)resetTimer{
    [timer invalidate];
    seconds=[[NSUserDefaults standardUserDefaults] integerForKey:@"seconds"];
    gameMode.image=[UIImage imageNamed:@"brain"];
    [self resetTime];
    timer = nil;

}

- (IBAction)pauseTimer{
    [timer invalidate];
    timer = nil;

}



- (void)setupGame{
    minutes = seconds / 60;
    subseconds = seconds % 60;
    count = 0;
    self.navigationController.toolbar.barTintColor = [UIColor colorWithRed:20.0/255.0 green:199.0/255.0 blue:49.0/255.0 alpha:1.0];
    self.navigationController.toolbar.tintColor = [UIColor whiteColor];
    timerLabel.title = [NSString stringWithFormat:@"%i:%02d",minutes,subseconds];
    
    if(!timer)
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(subtractTime) userInfo:nil repeats:YES];

}

-(void)resetTime{
    minutes = seconds / 60;
    subseconds = seconds % 60;
    timerLabel.title = [NSString stringWithFormat:@"%i:%02d",minutes,subseconds];
}

- (void)subtractTime{
    seconds--;
    minutes = seconds / 60;
    subseconds = seconds % 60;
    timerLabel.title = [NSString stringWithFormat:@"%i:%02d",minutes,subseconds];
    
    if(seconds == 120){
        self.navigationController.toolbar.tintColor =  nil;
        self.navigationController.toolbar.barTintColor =  self.navigationController.toolbar.tintColor;
        self.navigationController.toolbar.tintColor = [UIColor whiteColor];
        gameMode.image=[UIImage imageNamed:@"joystick"];
    }
    if(seconds == 30){
        self.navigationController.toolbar.barTintColor = [UIColor redColor];
        self.navigationController.toolbar.tintColor = [UIColor whiteColor];
        gameMode.image=[UIImage imageNamed:@"stopwatch"];
    }
    
    if(seconds < 1){
        self.navigationController.toolbar.barTintColor = nil;
        self.navigationController.toolbar.tintColor = nil;
        [timer invalidate];
        timer = nil;


    }
}

-(IBAction)score{
    
    //Autonomous
    int score = 0;
    score   +=  30 * JewelA.selectedSegmentIndex;
    score   +=  [GliphsA.text intValue]*15;
    score   +=  10 * SafeZoneA.selectedSegmentIndex;
    score   +=  30 * VuforiaA.selectedSegmentIndex;
    
    
//    if (parked1A.selectedSegmentIndex==1){
//        score+=5;
//    }
   

    //Tele-Op
//    score   +=  10*Crypto.selectedSegmentIndex;
//    score   +=  20*ziplineT.selectedSegmentIndex;

    
    
    if (Crypto.selectedSegmentIndex == 0){
        
        score += Columns1.selectedSegmentIndex * 20;
        score += Rows1.selectedSegmentIndex * 10;
        score += Extra1.selectedSegmentIndex * 2;

    }
    else if (Crypto.selectedSegmentIndex == 1){
        score += 20;
        Columns1.selectedSegmentIndex   =   0;
        Rows1.selectedSegmentIndex      =   0;
        Extra1.selectedSegmentIndex     =   0;
    }
    else if (Crypto.selectedSegmentIndex == 2){
        score += 30;
        Columns1.selectedSegmentIndex   =   0;
        Rows1.selectedSegmentIndex      =   0;
        Extra1.selectedSegmentIndex     =   0;
    }
    
    
    if (Crypto2.selectedSegmentIndex == 0){
        
        score += Columns2.selectedSegmentIndex * 20;
        score += Rows2.selectedSegmentIndex * 10;
        score += Extra2.selectedSegmentIndex * 2;
        
    }
    else if (Crypto2.selectedSegmentIndex == 1){
        score += 20;
        Columns2.selectedSegmentIndex   =   0;
        Rows2.selectedSegmentIndex      =   0;
        Extra2.selectedSegmentIndex     =   0;
    }
    else if (Crypto2.selectedSegmentIndex == 2){
        score += 30;
        Columns2.selectedSegmentIndex   =   0;
        Rows2.selectedSegmentIndex      =   0;
        Extra2.selectedSegmentIndex     =   0;
    }
    

    //End Game
    if (Zone1.selectedSegmentIndex == 0){
        upRightBonus1.selectedSegmentIndex   =   0;
    }else if (Zone1.selectedSegmentIndex == 1){
        score += 10;
    }else if (Zone1.selectedSegmentIndex == 2){
        score += 20;
    }else if (Zone1.selectedSegmentIndex == 3){
        score += 40;
    }
    score += upRightBonus1.selectedSegmentIndex*15;
    
    if (Zone2.selectedSegmentIndex == 0){
        upRightBonus2.selectedSegmentIndex   =   0;
    }else if (Zone2.selectedSegmentIndex == 1){
        score += 10;
    }else if (Zone2.selectedSegmentIndex == 2){
        score += 20;
    }else if (Zone2.selectedSegmentIndex == 3){
        score += 40;
    }
    score += upRightBonus2.selectedSegmentIndex*15;

    score += Balanced1.selectedSegmentIndex * 20;
    score += Balanced2.selectedSegmentIndex * 20;

    
    
    int height = self.navigationController.navigationBar.frame.size.height;
    int width = self.navigationController.navigationBar.frame.size.width;
    
    
    UILabel *navLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width , 40)];
    navLabel.backgroundColor = [UIColor clearColor];
    navLabel.textColor = [UIColor whiteColor];
    navLabel.font = [UIFont fontWithName:@"Helvetica Bold" size:30];
    navLabel.textAlignment = UITextAlignmentCenter;
    self.navigationItem.titleView = navLabel;
    ((UILabel *)self.navigationItem.titleView).text =[NSString stringWithFormat:@"%d",score];


}
-(IBAction)reset{
    int score = 0;
    JewelA.selectedSegmentIndex     =   0;
    GliphsA.text                    =   nil;
    SafeZoneA.selectedSegmentIndex  =   0;
    VuforiaA.selectedSegmentIndex   =   0;
    
    Crypto.selectedSegmentIndex     =   0;
    Columns1.selectedSegmentIndex   =   0;
    Rows1.selectedSegmentIndex      =   0;
    Extra1.selectedSegmentIndex     =   0;
    
    Crypto2.selectedSegmentIndex     =   0;
    Columns2.selectedSegmentIndex   =   0;
    Rows2.selectedSegmentIndex      =   0;
    Extra2.selectedSegmentIndex     =   0;
    
    Zone1.selectedSegmentIndex      =   0;
    upRightBonus1.selectedSegmentIndex = 0;
    Zone2.selectedSegmentIndex      =   0;
    upRightBonus2.selectedSegmentIndex = 0;
    
    Balanced1.selectedSegmentIndex = 0;
    Balanced2.selectedSegmentIndex = 0;

    
    
    
    UILabel *navLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0 , 40)];
    navLabel.backgroundColor = [UIColor clearColor];
    navLabel.textColor = [UIColor whiteColor];
    navLabel.font = [UIFont fontWithName:@"Helvetica Bold" size:30];
    navLabel.textAlignment = UITextAlignmentCenter;
    self.navigationItem.titleView = navLabel;
    ((UILabel *)self.navigationItem.titleView).text =@"";


}


-(IBAction)goSite{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.i2robotics.org"]];
}

-(IBAction)goFB{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.facebook.com/i2robotics"]];
}


@end
