一.为什么要自定义转场动画
    1.让产品做的更炫
    2.让产品做的更符合用户的需求，用户的体验习惯
    3.更好的管理
    归根结底一句话：系统标准的控制器动画的切换满足不了我们的需求
二.系统标准的控制器动画切换有哪些？主流的切换方式
    1.导航控制器的：push/pop
    2.TabBarController
    3.present and dismiss
三.自定义所涉及到的类
    
    UITabBarControllerDelegate:

    - (nullable id <UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
    animationControllerForTransitionFromViewController:(UIViewController *)fromVC
    toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0);

    UINavigationControllerDelegate:

    - (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
    animationControllerForOperation:(UINavigationControllerOperation)operation
    fromViewController:(UIViewController *)fromVC
    toViewController:(UIViewController *)toVC  NS_AVAILABLE_IOS(7_0);

    UIViewControllerTransitioningDelegate:

    - (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source;

    - (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed;


    