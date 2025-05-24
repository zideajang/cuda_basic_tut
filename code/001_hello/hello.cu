#include<stdio.h> // 引入标准输入输出库，用于printf函数
#include<cuda.h>  // 引入CUDA运行时库，包含了CUDA相关的函数和类型定义

// device d_
// host h_
// 上面两行是注释，通常用来标记变量是分配在设备端（GPU）还是主机端（CPU）

__global__ // 这是一个CUDA关键字，表示其后的函数是一个可以在GPU上执行的“核函数”
void kernel() // 定义了一个名为kernel的函数，它将在GPU上运行
{
    printf("Hello from GPU\n"); // 在GPU上执行时，将这条消息打印到控制台
}

int main(void){ // C语言程序的主函数，从这里开始执行
    printf("Hello from CPU\n"); // 在CPU上执行时，将这条消息打印到控制台
    // 调用kernel核函数。
    // <<<1,1>>> 是CUDA的执行配置（execution configuration）。
    // 第一个1表示启动一个网格（grid），网格中包含1个块（block）。
    // 第二个1表示每个块中包含1个线程（thread）。
    // 也就是说，这个核函数将只在一个线程上执行。
    kernel<<<1,1>>>();
    cudaDeviceSynchronize(); // 这是一个同步函数，强制CPU等待所有GPU上的操作完成。
                             // 这样做是为了确保在CPU程序结束前，GPU上的printf能够被执行并输出。
    return 0; // 主函数返回0，表示程序正常结束
}