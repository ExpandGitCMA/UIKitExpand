#import "AppDelegate.h"
#import "YBSAppJumpConterl.h"
@interface AppDelegate ()
@end
@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [YBSAppJumpConterl jumpBaserConterl];
    return YES;
}
//class-dump -H 捷报狂欢体育 -o CalculatorHeader

/*
    1. 修改上级目录 <python工具>文件夹下 hunxiao_data.json 文件中key值：
            a. “chgClassOrMethod” 下的修改类名和方法名需要过滤的相关文件夹和文件的配置
            b. "projectName" 对应正确的工程名称配置
            c. "userName": 对应的电脑用户名配置（随机填写一个用户名）
    2. 打开终端，cd 到这个目录
    2. 执行启动脚本命令：python3 main.py，按照执行过程中提示，输入对应运行参数
//="utf-8"
注：
    1. 可能存在调用脚本后未知错误引起的报错情况，找到错误修改后即可
    2. 如果工程还需要做添加垃圾文件或垃圾代码操作的话，建议请先执行此工具完成修改类名和方法名之后,再去执行对应的添加操作

*/
@end
