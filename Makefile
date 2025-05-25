# 依赖关系：
#	每个目标后紧跟的 .o 文件或 .c 文件表示依赖项。例如 main 依赖于三个 .o 文件，而每个 .o 文件依赖于对应的 .c 文件。
# 编译流程：
# 	首先通过 gcc -c 命令将每个 .c 文件编译为 .o 目标文件（只进行编译不链接）。
# 	然后通过 gcc -o 命令将所有 .o 文件链接为最终的可执行文件。
# 
# 编译过程
# 	1、如果工程没有编译过，那么工程中的所有.c 文件都要被编译并且链接成可执行程序。
# 	2、如果工程中只有个别 C 文件被修改了，那么只编译这些被修改的 C 文件即可。
# 	3、如果工程的头文件被修改了，那么我们需要编译所有引用这个头文件的 C 文件，并且链接成可执行文件。
# 空出来的地方一定要使用“TAB”键！不要使用空格键！

# make 命令会在当前目录下查找是否存在“Makefile”这个文件，如果存在的话就会按照 Makefile 里面定义的编译方式进行编译
# make 命令会为 Makefile 中的每个以 TAB 开始的命令创建一个 Shell 进程去执行


# 定义 main 目标：由 main.o、input.o 和 calcu.o 三个依赖文件链接生成
# 命令使用 gcc 链接器将目标文件合并为可执行文件 main
main: main.o input.o calcu.o
	gcc -o main main.o input.o calcu.o

# 定义 main.o 目标：由 main.c 源文件编译生成
# 命令使用 gcc 编译器以编译模式 (-c) 生成目标文件
main.o: main.c
	gcc -c main.c

# 定义 input.o 目标：由 input.c 源文件编译生成
# 命令同上，生成 input.o 目标文件
input.o: input.c
	gcc -c input.c

# 定义 calcu.o 目标：由 calcu.c 源文件编译生成
# 命令同上，生成 calcu.o 目标文件
calcu.o: calcu.c
	gcc -c calcu.c

# 定义 clean 伪目标：用于清理编译生成的文件
# 第一个命令删除所有 .o 目标文件
# 第二个命令删除最终生成的可执行文件 main
# Windows 系统没有 rm 命令，需要使用 del 代替
clean:
	del *.o  
	del main.exe
