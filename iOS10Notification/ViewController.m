//
//  ViewController.m
//  iOS10Notification
//
//  Created by Yanase Yuji on 2016/10/09.
//  Copyright © 2016年 hikaruApp. All rights reserved.
//

#import "ViewController.h"

#import "NotiferController.h"
#import "NotiferiOS9Controller.h"

@interface ViewController ()
- (IBAction)postiOS10Notification:(id)sender;
- (IBAction)postiOS10Notificationwithimage:(id)sender;
- (IBAction)postiOS9Notification:(id)sender;

@property ( nonatomic ) NotiferController     *ios10notifer;
@property ( nonatomic ) NotiferiOS9Controller *ios9notifer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // ios10 notifer
    self.ios10notifer = [NotiferController new];
    
    // ios9 notifer
    self.ios9notifer  = [NotiferiOS9Controller new];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)postiOS10Notification:(id)sender {
    [self.ios10notifer notiferRequestFiveSecond];
}

- (IBAction)postiOS10Notificationwithimage:(id)sender {
    [self.ios10notifer notiferRequestFiveSecondWithImag];
}

- (IBAction)postiOS9Notification:(id)sender {
    [self.ios9notifer notiferRequestFiveSecondiOS9];
}

@end
