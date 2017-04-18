//
//  ViewController.m
//  NavController
//
//  Created by iOS-School-1 on 18.04.17.
//  Copyright © 2017 user. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerNext.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:666];
}

-(IBAction)buttonTapped:(id)sender{
    ViewControllerNext *vc = [ViewControllerNext new];
    vc.view.backgroundColor = [UIColor cyanColor];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
