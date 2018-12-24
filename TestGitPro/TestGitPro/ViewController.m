//
//  ViewController.m
//  TestGitPro
//
//  Created by 包强 on 2018/12/7.
//  Copyright © 2018 包强. All rights reserved.
//

#import "ViewController.h"
#import "AViewController.h"
#import "MyView.h"
@interface ViewController ()
@property (nonatomic, strong) MyView *myview;
@property (nonatomic, strong) AViewController *avc;
@end

@implementation ViewController

- (MyView*)myview
{
    if (!_myview) {
        _myview = [MyView new];
    }
    return _myview;
}

- (AViewController*)avc
{
    if (!_avc) {
        _avc = [AViewController new];
    }
    return _avc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     [self.myview addObserver:self.avc forKeyPath:@"str" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    [self.myview addObserver:self forKeyPath:@"str" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
   
 
}



-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"vc NewKey  %@",change[NSKeyValueChangeNewKey]);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.myview.str = @"bbq";
}


@end
