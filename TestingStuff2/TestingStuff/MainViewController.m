//
//  MainViewController.m
//  TestingStuff
//
//  Created by MacMiniHome on 07/01/17.
//  Copyright © 2017 MacMiniHome. All rights reserved.
//

#import "MainViewController.h"
#import "ModulesViewController.h"

#import "UIView+FFSAutoLayout.h"

@interface MainViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIStackView *stackView;

@property (nonatomic, strong) ModulesViewController *modulesViewController;
@property (nonatomic, strong) UIView *modulesViewContainer;
@property (nonatomic, strong) NSLayoutConstraint *modulesHeightConstraint;

@end

@implementation MainViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        
        self.modulesViewController = [[ModulesViewController alloc] init];
    }
    return self;
}

- (void)loadView {
    
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = [UIColor clearColor];
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
    
    self.stackView = [[UIStackView alloc] initWithArrangedSubviews:@[]];
    self.stackView.backgroundColor = [UIColor blueColor];
    self.stackView.alignment = UIStackViewAlignmentFill;
    self.stackView.axis = UILayoutConstraintAxisVertical;
    [self.scrollView addSubview:self.stackView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.scrollView ffs_fillContainer];
    
    [self.stackView ffs_constrainTopSpaceToContainer];
    [self.stackView ffs_constrainBottomSpaceToContainer];
    
    [self.stackView ffs_constrainTrailingSpaceToContainer];
    [self.stackView ffs_constrainLeadingSpaceToContainer];
    [self.stackView ffs_constrainWidthToView:self.scrollView constant:0.0];
    
//    UILabel *awesomeLabel = [[UILabel alloc] init];
//    awesomeLabel.backgroundColor = [UIColor whiteColor];
//    [awesomeLabel setText:@"Popular Designers"];
//    
//    [self.stackView addArrangedSubview:awesomeLabel];
    
    if (self.modulesViewContainer == nil) {
        self.modulesViewContainer = [[UIView alloc] init];
    }
    
    if (self.modulesViewContainer.superview != self.stackView) {
        
        [self.modulesViewContainer removeFromSuperview];
        
        [self.stackView insertArrangedSubview:self.modulesViewContainer atIndex:0];
        [self addChildViewController:self.modulesViewController];
        [self.modulesViewContainer addSubview:self.modulesViewController.view];
        [self.modulesViewController didMoveToParentViewController:self];
        
        [self.modulesViewController reloadWithContent];
        
        [self.modulesViewController.view ffs_constrainTopSpaceToContainer:41.0];
        [self.modulesViewController.view ffs_constrainBottomSpaceToContainer];
        [self.modulesViewController.view ffs_constrainLeadingSpaceToContainer:0.0];
        [self.modulesViewController.view ffs_constrainTrailingSpaceToContainer:0.0];
        
        self.modulesHeightConstraint = [self.modulesViewController.view ffs_constrainHeight:[self.modulesViewController contentHeightForTraitCollection:self.view.traitCollection]];
    }
    
    self.modulesHeightConstraint.constant = [self.modulesViewController contentHeightForTraitCollection:self.view.traitCollection];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
