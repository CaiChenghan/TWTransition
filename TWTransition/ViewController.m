//
//  ViewController.m
//  TWTransition
//
//  Created by 蔡成汉 on 16/9/18.
//  Copyright © 2016年 蔡成汉. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationController+TWTransition.h"
#import "TestViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)myButtonIsTouch:(id)sender {
    TestViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"TestViewController"];
    [self.navigationController tw_pushViewController:viewController transitionType:TransitionTypeMagicMove animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
