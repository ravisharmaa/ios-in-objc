//
//  ViewController.m
//  ObjectiveCApp
//
//  Created by Ravi Bastola on 10/28/20.
//

#import "ViewController.h"
#import "CustomTableViewCell.h"
#import "List.h"


@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray <List *> *lists;

@end

@implementation ViewController

- (void) viewDidLoad {
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    
    self.navigationController.navigationBar.prefersLargeTitles = true;
    
    self.navigationItem.title = @"List Me";
    
    [self configureTableView];
    
    [self fetchData];
    
}

#pragma mark - Table View Config

- (void) configureTableView  {
    
    _customTableView = [[UITableView alloc] init];
    
    _customTableView.delegate = self;
    
    _customTableView.dataSource = self;
    
    [_customTableView registerClass:CustomTableViewCell.class forCellReuseIdentifier:@"cellId"];
    
    [self.view addSubview: _customTableView];
    
    _customTableView.tableFooterView = [[UIView alloc] init ];
    
    _customTableView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [_customTableView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor].active = YES;
    
    [_customTableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    
    [_customTableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
    
    [_customTableView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor].active = YES;
}


- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _lists.count;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    
    List *list = self.lists[indexPath.row];
    
    cell.textLabel.text = list.storeName;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (void)fetchData {
    
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    
    NSURL *url = [NSURL URLWithString:@"http://list-me.test/api/cart/1"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"GET"];
    
    NSURLSessionTask *dataTask = [defaultSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data != nil) {
            NSArray *results = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            
            self.lists = [[NSMutableArray alloc] init];
            
            for (NSDictionary *lists in results) {
                
                List *list = [[List alloc] init ];
                
                list.name = lists[@"name"];
                
                list.storeName = lists[@"storeName"];
                
                [self.lists addObject:list];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.customTableView reloadData];
            });
        }
        
    }];
    
    [dataTask resume];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", indexPath);
}


@end
