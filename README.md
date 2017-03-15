# HJWViscousParticleBtn

- 🍩 A Single ViscousParticleBtn for iOS.
- 一款优雅的甜甜圈按钮

# eg
 ![HJWViscousParticleBtn set up - 140](http://ofaxaig0m.bkt.clouddn.com/HJWViscousParticleBtn.gif)

# Usage
## **ViewController :**

### 🍩甜甜圈创建

```Objetive-C
    self.btn = [[HJWViscousParticleBtn alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [self.btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    self.btn.center = self.view.center;
    self.btn.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor colorWithRed: 0.608 green: 0.612 blue: 0.965 alpha: 1];
    [self.view addSubview:self.btn];
    
    [self.btn startAnimation];
```

### 创建渐变背景

```Objetive-C
- (void)createGradientLayer {
    //初始化CAGradientlayer对象，使它的大小为UIView的大小
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = self.view.bounds;
    
    //将CAGradientlayer对象添加在我们要设置背景色的视图的layer层
    [self.view.layer addSublayer:self.gradientLayer];
    
    //设置渐变区域的起始和终止位置（范围为0-1）
    self.gradientLayer.startPoint = CGPointMake(0, 1);
    self.gradientLayer.endPoint = CGPointMake(0, 0);
    
    //设置颜色数组
    self.gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed: 0.608 green: 0.612 blue: 0.965 alpha: 1].CGColor,
                                  (__bridge id)[UIColor colorWithWhite:1.0 alpha:0.5].CGColor];
    //设置颜色分割点（范围：0-1）
    self.gradientLayer.locations = @[@(0.01f), @(0.25f), @(0.5f), @(0.75f), @(1.0f)];
}
```

### 创建背景粒子

```Objetive-C
- (void)createEmitterLayer {
    // 创建粒子Layer
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    
    // 粒子发射位置
    snowEmitter.emitterPosition = CGPointMake(120,0);
    
    // 发射源的尺寸大小
    snowEmitter.emitterSize     = self.view.bounds.size;
    
    // 发射模式
    snowEmitter.emitterMode     = kCAEmitterLayerSurface;
    
    // 发射源的形状
    snowEmitter.emitterShape    = kCAEmitterLayerLine;
    
    // 创建雪花类型的粒子
    CAEmitterCell *snowflake    = [CAEmitterCell emitterCell];
    
    // 粒子的名字
    snowflake.name = @"snow";
    
    // 粒子参数的速度乘数因子
    snowflake.birthRate = 20.0;
    snowflake.lifetime  = 120.0;
    
    // 粒子速度
    snowflake.velocity  = 10.0;
    
    // 粒子的速度范围
    snowflake.velocityRange = 10;
    
    // 粒子y方向的加速度分量
    snowflake.yAcceleration = 2;
    
    // 周围发射角度
    snowflake.emissionRange = 0.5 * M_PI;
    
    // 子旋转角度范围
    snowflake.spinRange = 0.25 * M_PI;
    snowflake.contents  = (id)[[UIImage imageNamed:@"snow"] CGImage];
    
    // 设置雪花形状的粒子的颜色
    snowflake.color      = [[UIColor whiteColor] CGColor];
    snowflake.redRange   = 2.f;
    snowflake.greenRange = 2.f;
    snowflake.blueRange  = 2.f;
    
    snowflake.scaleRange = 0.6f;
    snowflake.scale      = 0.7f;
    
    snowEmitter.shadowOpacity = 1.0;
    snowEmitter.shadowRadius  = 0.0;
    snowEmitter.shadowOffset  = CGSizeMake(0.0, 0.0);
    
    // 粒子边缘的颜色
    snowEmitter.shadowColor  = [[UIColor whiteColor] CGColor];
    
    // 添加粒子
    snowEmitter.emitterCells = @[snowflake];
    
    // 将粒子Layer添加进图层中
    [self.view.layer addSublayer:snowEmitter];
    
    // 形成遮罩
    UIImage *image      = [UIImage imageNamed:@"alpha"];
    _movedMask          = [CALayer layer];
    _movedMask.frame    = (CGRect){CGPointZero, image.size};
    _movedMask.contents = (__bridge id)(image.CGImage);
    _movedMask.position = self.view.center;
    snowEmitter.mask    = _movedMask;
    
    // 拖拽的View
    UIView *dragView =
    [[UIView alloc] initWithFrame:(CGRect){CGPointZero, image.size.width + 50, image.size.height + 50,}];
    dragView.userInteractionEnabled = YES;
    dragView.center  = self.view.center;
    [self.view addSubview:dragView];
    
    // 给dragView添加拖拽手势
    UIPanGestureRecognizer *recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [dragView addGestureRecognizer:recognizer];
}

```

# issue
#### 在尝试将粒子与甜甜圈能够产生相互的影响，比如粒子穿叠过甜甜圈、类似粘性的分离等等。
#### 希望大家可以给予这些方面的想法和建议


