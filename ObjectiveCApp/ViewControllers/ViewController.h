//
//  ViewController.h
//  ObjectiveCApp
//
//  Created by Ravi Bastola on 10/28/20.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) UITableView *customTableView;

- (void) fetchData;

@end

