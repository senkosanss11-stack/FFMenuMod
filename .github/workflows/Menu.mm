#import <UIKit/UIKit.h>

@interface MenuWindow : UIWindow
@property (nonatomic, strong) UIButton *menuButton;
@property (nonatomic, strong) UIView *menuPanel;
@property (nonatomic, strong) UISwitch *espSwitch;
@property (nonatomic, strong) UISwitch *boneSwitch;
@end

@implementation MenuWindow

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.windowLevel = UIWindowLevelAlert + 1000.0;
        self.backgroundColor = [UIColor clearColor];
        [self setHidden:NO];
        [self createMenuUI];
    }
    return self;
}

- (void)createMenuUI {
    self.menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.menuButton.frame = CGRectMake(40, 100, 60, 60);
    self.menuButton.backgroundColor = [UIColor colorWithRed:0.1 green:0.8 blue:0.3 alpha:0.8];
    self.menuButton.layer.cornerRadius = 30;
    [self.menuButton setTitle:@"M" forState:UIControlStateNormal];
    [self.menuButton addTarget:self action:@selector(togglePanel) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.menuButton];

    self.menuPanel = [[UIView alloc] initWithFrame:CGRectMake(120, 100, 240, 180)];
    self.menuPanel.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.9];
    self.menuPanel.layer.cornerRadius = 10;
    self.menuPanel.hidden = YES;

    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 220, 25)];
    titleLabel.text = @"Senko Systems RPB";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.menuPanel addSubview:titleLabel];

    UILabel *espLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 50, 140, 30)];
    espLabel.text = @"Enable ESP";
    espLabel.textColor = [UIColor whiteColor];
    [self.menuPanel addSubview:espLabel];

    self.espSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(170, 50, 50, 30)];
    [self.menuPanel addSubview:self.espSwitch];

    UILabel *boneLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 140, 30)];
    boneLabel.text = @"Bone ESP";
    boneLabel.textColor = [UIColor whiteColor];
    [self.menuPanel addSubview:boneLabel];

    self.boneSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(170, 100, 50, 30)];
    [self.menuPanel addSubview:self.boneSwitch];

    [self addSubview:self.menuPanel];
}

- (void)togglePanel {
    self.menuPanel.hidden = !self.menuPanel.hidden;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *hitView = [super hitTest:point withEvent:event];
    if (hitView == self) {
        return nil;
    }
    return hitView;
}

@end

static MenuWindow *modMenu = nil;

void initMenu() {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        modMenu = [[MenuWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    });
}