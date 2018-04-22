//
//  PaymentDetailsController.m
//  SBTTask
//
//  Created by Isa Aliev on 21.04.2018.
//  Copyright © 2018 IA. All rights reserved.
//

#import "PaymentDetailsController.h"
#import "Cells/PaymentDetailsDocumentInfoCell.h"
#import "Cells/PaymentDetailsAmoutCell.h"
#import "Cells/PaymentDetailsBaseCell.h"
#import "UITableView+CellRegistering.h"

@interface PaymentDetailsController ()

@property (strong, nonatomic) PaymentDetailsViewModel *model;

@end

@implementation PaymentDetailsController

- (instancetype)initWithModel:(PaymentDetailsViewModel *)model {
    self = [super init];
    if (self) {
        self.model = model;
    }
    
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"model.cellModels"]) {
        NSLog(@"Change Detected");
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureNavigationBar];
    [self registerCells];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:nil options:nil];

    return [views objectAtIndex:0];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44.0;
}
    
- (void)configureNavigationBar {
    self.title = self.model.title;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:58 / 255.0
                                                                           green:153 / 255.0
                                                                            blue:37 / 255.0
                                                                           alpha:1.0];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
}

- (void)registerCells {
    NSArray *identifiers = [self.model.cellModels valueForKeyPath:@"@distinctUnionOfObjects.identifier"];
    
    for (NSString *identifier in identifiers) {
        [self.tableView registerCellForIdentifier:identifier withClass:NSClassFromString(identifier)];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.model.cellModels.count;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BaseCellModel *model = [self.model.cellModels objectAtIndex:indexPath.row];
    PaymentDetailsBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:model.identifier];
    cell.model = model;
    
    return cell;
}
    
@end
