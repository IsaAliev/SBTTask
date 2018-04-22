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
#import "NSObject+Observe.h"

NSString * const updateRowsTriggerKeyPath = @"viewModel.shouldUpdateRowsTrigger";

@interface PaymentDetailsController ()

@property (strong, nonatomic) PaymentDetailsViewModel *viewModel;
@property (strong, nonatomic) NSMutableArray *observingKeyPaths;

@end

@implementation PaymentDetailsController

- (instancetype)initWithViewModel:(PaymentDetailsViewModel *)viewModel {
    self = [super init];
    if (self) {
        self.observingKeyPaths = [NSMutableArray array];
        self.viewModel = viewModel;
    }
    
    return self;
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self bindViewModel];
    [self configureNavigationBar];
    [self registerCells];
}

- (void)bindViewModel {
    [self.observingKeyPaths addObject:@"viewModel.cellModels"];
    [self.observingKeyPaths addObject:updateRowsTriggerKeyPath];

    [self observeKeyPaths:self.observingKeyPaths];
}
    
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([self.observingKeyPaths containsObject:keyPath]) {
        if ([keyPath isEqualToString:updateRowsTriggerKeyPath]) {
            [self updateTableForHeights];
        } else {
            [self registerCells];
            [self updateTableWithChange:change];
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)updateTableForHeights {
    [[self tableView] beginUpdates];
    [[self tableView] endUpdates];
}

- (void)updateTableWithChange:(NSDictionary *)change {
    NSNumber *changeKind = change[NSKeyValueChangeKindKey];
    NSIndexSet *indexSet = change[NSKeyValueChangeIndexesKey];
    
    NSMutableArray *indexPaths = [NSMutableArray array];
    
    [indexSet enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
        [indexPaths addObject:[NSIndexPath indexPathForRow:idx inSection:0]];
    }];
    
    [[self tableView] beginUpdates];
    if (changeKind.integerValue == NSKeyValueChangeInsertion) {
        [[self tableView] insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
    } else if (changeKind.integerValue == NSKeyValueChangeRemoval) {
        [[self tableView] deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
    }
    [[self tableView] endUpdates];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:nil options:nil];

    return [views objectAtIndex:0];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44.0;
}
    
- (void)configureNavigationBar {
    self.title = self.viewModel.title;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:58 / 255.0
                                                                           green:153 / 255.0
                                                                            blue:37 / 255.0
                                                                           alpha:1.0];

    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
}

- (void)registerCells {
    NSArray *identifiers = [self.viewModel.cellModels valueForKeyPath:@"@distinctUnionOfObjects.identifier"];
    
    for (NSString *identifier in identifiers) {
        [self.tableView registerCellForIdentifier:identifier];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.cellModels.count;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BaseCellModel *cellModel = [self.viewModel.cellModels objectAtIndex:indexPath.row];
    PaymentDetailsBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:cellModel.identifier];
    cell.viewModel = cellModel;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.viewModel.cellModels objectAtIndex:indexPath.row].height;
}

- (void)dealloc {
    [self removeObservingOfKeyPaths:self.observingKeyPaths];
}
    
@end
