//
//  ViewController.m
//  LazyLoadingPageControlNavigation
//
//  Created by 关沛东 on 15/11/10.
//  Copyright (c) 2015年 关沛东. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIImageView *page1;
@property(nonatomic,strong)UIImageView *page2;
@property(nonatomic,strong)UIImageView *page3;

@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)UIPageControl *pageControl;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width*3, self.view.bounds.size.height);
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(120, 400, 100, 20)];
    self.pageControl.numberOfPages = 3;
    self.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    self.pageControl.currentPage = 1;
    self.pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.pageControl];
    self.page1 = [[UIImageView alloc]initWithFrame:self.view.frame];
    self.page1.image = [UIImage imageNamed:@"达芬奇-蒙娜丽莎.png"];
    [self.scrollView addSubview:self.page1];
    self.scrollView.pagingEnabled = YES;
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offset = scrollView.contentOffset;
    self.pageControl.currentPage = offset.x/self.view.frame.size.width;
    [self loadImage:self.pageControl.currentPage + 1];
    
}



- (void)loadImage:(NSInteger)nextPage{
    if (nextPage == 1&&self.page2 == nil) {
        self.page2 = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.frame.size.height)];
        self.page2.image = [UIImage imageNamed:@"罗丹-思想者.png"];
        [self.scrollView addSubview:self.page2];
    }
    if (nextPage == 2&&self.page3 == nil) {
        self.page3 = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width*2, 0, self.view.bounds.size.width, self.view.frame.size.height)];
        self.page3.image = [UIImage imageNamed:@"保罗克利-肖像.png"];
        [self.scrollView addSubview:self.page3];
    }
}

@end
