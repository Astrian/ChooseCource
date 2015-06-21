import Cocoa


//新建课程类以及其他的类
class 课程 {
    var 课程名称: String?
    var 学分: Int?
    var 是数学类 = false
    var 是运筹学类 = false
    var 是计算机学类 = false
    var 要求先修微积分或线性代数 = false
    var 要求先修计算机编程 = false
    var 要求先修应用统计 = false
    var 先修课要求: Array<String>?
}

//导入每个课程信息
var 微积分 = 课程();
微积分.课程名称 = "微积分"
微积分.学分 = 5
微积分.是数学类 = true

var 线性代数 = 课程()
线性代数.课程名称 = "线性代数"
线性代数.学分 = 4
线性代数.是数学类 = true

var 最优化方法 = 课程()
最优化方法.课程名称 = "最优化方法"
最优化方法.学分 = 4
最优化方法.是数学类 = true
最优化方法.是运筹学类 = true
最优化方法.要求先修微积分或线性代数 = true

var 数据结构 = 课程()
数据结构.课程名称 = "数据结构"
数据结构.学分 = 3
数据结构.是数学类 = true
数据结构.是计算机学类 = true
数据结构.要求先修计算机编程 = true

var 应用统计 = 课程()
应用统计.课程名称 = "应用统计"
应用统计.学分 = 4
应用统计.是数学类 = true
应用统计.是运筹学类 = true
应用统计.要求先修微积分或线性代数 = true

var 计算机模拟 = 课程()
计算机模拟.课程名称 = "计算机模拟"
计算机模拟.学分 = 3
计算机模拟.是计算机学类 = true
计算机模拟.是运筹学类 = true
计算机模拟.要求先修计算机编程 = true

var 计算机编程 = 课程()
计算机编程.课程名称 = "计算机编程"
计算机编程.学分 = 2
计算机编程.是计算机学类 = true

var 预测理论 = 课程()
预测理论.课程名称 = "预测理论"
预测理论.学分 = 2
预测理论.是运筹学类 = true
预测理论.要求先修应用统计 = true

var 数学实验 = 课程()
数学实验.课程名称 = "数学实验"
数学实验.学分 = 3
数学实验.是运筹学类 = true
数学实验.是计算机学类 = true
数学实验.要求先修微积分或线性代数 = true

//组成数组，方便调用
var 课程组 = [微积分,线性代数,最优化方法,数据结构,应用统计,计算机模拟,计算机编程,预测理论,数学实验]

//一些必要的变量
var 运筹学数量:Int
var 计算机学数量:Int
var 数学数量:Int
var 符合条件:BooleanType
var 继续循环:BooleanType
var 可选个数 = 0
var 最高学分 = 0

//选两门课
继续循环 = true
var 第一课程:Int = 0,第二课程:Int = 0
while 继续循环{
    
    符合条件 = true
    
    运筹学数量 = 0
    计算机学数量 = 0
    数学数量 = 0
    
    if 第一课程 != 第二课程{
        
        //检测数学类数量
        if 课程组[第一课程].是数学类 && 课程组[第二课程].是数学类 {
            数学数量 = 2
        }else if 课程组[第一课程].是数学类 || 课程组[第二课程].是数学类 {
            数学数量 = 1
        }
        
        //检测计算机学类数量
        if 课程组[第一课程].是计算机学类 && 课程组[第二课程].是计算机学类 {
            计算机学数量 = 2
        }else if 课程组[第一课程].是数学类 || 课程组[第二课程].是数学类 {
            计算机学数量 = 1
        }
        
        //检测运筹学类数量
        if 课程组[第一课程].是运筹学类 && 课程组[第二课程].是运筹学类 {
            运筹学数量 = 2
        }else if 课程组[第一课程].是数学类 || 课程组[第二课程].是数学类 {
            运筹学数量 = 1
        }
        
        //检测完毕后，判断是否（不）满足相应条件
        if 数学数量 < 2 || 运筹学数量 < 3 || 计算机学数量 < 2{
            符合条件 = false
        }
        
        //判断课程依赖是否符合条件
        if 课程组[第一课程].要求先修微积分或线性代数 == true || 课程组[第二课程].要求先修微积分或线性代数 == true{
            if 课程组[第一课程].课程名称 != "微积分" && 课程组[第一课程].课程名称 != "线性代数" && 课程组[第二课程].课程名称 != "微积分" && 课程组[第一课程].课程名称 != "线性代数"{
                符合条件 = false
            }
        }
        if 符合条件 {
            可选个数++
            var 学分:Int = 课程组[第一课程].学分! + 课程组[第二课程].学分!
            print("选两门课：选择\(课程组[第一课程].课程名称)和\(课程组[第二课程].课程名称)可以满足条件，学分为 \(学分)")
            if 学分 > 最高学分{
                最高学分 = 学分
                print("出现新最高学分！分值：\(最高学分)")
            }
        }
    }
    
    if 第二课程 == 8{
        if 第一课程 == 8{
            继续循环 = false
        }else{
            第一课程++
            第二课程 = 第一课程
        }
    }else{
        第二课程++
    }
}
print("目前符合条件的选课方案有 \(可选个数) 种。")

//选三门课
继续循环 = true
第一课程 = 0
第二课程 = 0
var 第三课程 = 0
while 继续循环{
    
    //初始化变量
    符合条件 = true
    
    运筹学数量 = 0
    计算机学数量 = 0
    数学数量 = 0
    
    if 第一课程 != 第二课程 && 第二课程 != 第三课程 && 第三课程 != 第一课程{
        
        //检测数学类数量
        if 课程组[第一课程].是数学类 {
            数学数量++
        }
        if 课程组[第二课程].是数学类 {
            数学数量++
        }
        if 课程组[第三课程].是数学类 {
            数学数量++
        }
        
        //检测计算机学类数量
        if 课程组[第一课程].是计算机学类{
            计算机学数量++
        }
        if 课程组[第二课程].是计算机学类{
            计算机学数量++
        }
        if 课程组[第三课程].是计算机学类{
            计算机学数量++
        }
        
        //检测运筹学类数量
        if 课程组[第一课程].是运筹学类 {
            运筹学数量++
        }
        if 课程组[第二课程].是运筹学类 {
            运筹学数量++
        }
        if 课程组[第三课程].是运筹学类 {
            运筹学数量++
        }
        
        //检测完毕后，判断是否（不）满足相应条件
        if 数学数量 < 2 || 运筹学数量 < 3 || 计算机学数量 < 2{
            符合条件 = false
        }
        
        //判断课程依赖是否符合条件
        if 课程组[第一课程].要求先修微积分或线性代数 == true || 课程组[第二课程].要求先修微积分或线性代数 == true{
            if 课程组[第一课程].课程名称 != "微积分" && 课程组[第一课程].课程名称 != "线性代数" &&
                课程组[第二课程].课程名称 != "微积分" && 课程组[第一课程].课程名称 != "线性代数" &&
                课程组[第三课程].课程名称 != "微积分" && 课程组[第三课程].课程名称 != "线性代数" {
                    符合条件 = false
            }
        }
        if 符合条件 {
            可选个数++
            var 学分:Int = 课程组[第一课程].学分! + 课程组[第二课程].学分! + 课程组[第三课程].学分!
            print("选三门课：选择\(课程组[第一课程].课程名称)，\(课程组[第二课程].课程名称)，\(课程组[第三课程].课程名称)可以满足条件，学分为 \(学分)")
            if 学分 > 最高学分{
                最高学分 = 学分
                print("出现新最高学分！分值：\(最高学分)")
            }
        }
    }
    
    if 第三课程 == 8{
        if 第二课程 == 8{
            if 第一课程 == 8{
                继续循环 = false
            }else{
                第一课程++
                第二课程 = 第一课程
            }
        }else{
            第二课程++
        }
        第三课程 = 第二课程
    }else{
        第三课程++
    }
}
print("目前符合条件的选课方案有 \(可选个数) 种。")

//选四门课
继续循环 = true
第一课程 = 0
第二课程 = 0
第三课程 = 0
var 第四课程 = 0
while 继续循环{
    
    //初始化变量
    符合条件 = true
    
    运筹学数量 = 0
    计算机学数量 = 0
    数学数量 = 0
    
    if 第一课程 != 第二课程 &&
        第二课程 != 第三课程 && 第三课程 != 第一课程 &&
        第四课程 != 第一课程 && 第四课程 != 第二课程 && 第四课程 != 第三课程{
            
            //检测数学类数量
            if 课程组[第一课程].是数学类 {数学数量++}
            if 课程组[第二课程].是数学类 {数学数量++}
            if 课程组[第三课程].是数学类 {数学数量++}
            if 课程组[第四课程].是数学类 {数学数量++}
            
            //检测计算机学类数量
            if 课程组[第一课程].是计算机学类{计算机学数量++}
            if 课程组[第二课程].是计算机学类{计算机学数量++}
            if 课程组[第三课程].是计算机学类{计算机学数量++}
            if 课程组[第四课程].是计算机学类{计算机学数量++}
            
            //检测运筹学类数量
            if 课程组[第一课程].是运筹学类 {运筹学数量++}
            if 课程组[第二课程].是运筹学类 {运筹学数量++}
            if 课程组[第三课程].是运筹学类 {运筹学数量++}
            if 课程组[第四课程].是运筹学类 {运筹学数量++}
            
            //检测完毕后，判断是否（不）满足相应条件
            if 数学数量 < 2 || 运筹学数量 < 3 || 计算机学数量 < 2{
                符合条件 = false
            }
            
            //判断课程依赖是否符合条件
            if 课程组[第一课程].要求先修微积分或线性代数  || 课程组[第二课程].要求先修微积分或线性代数 {
                if  课程组[第一课程].课程名称 != "微积分" && 课程组[第一课程].课程名称 != "线性代数" &&
                    课程组[第二课程].课程名称 != "微积分" && 课程组[第一课程].课程名称 != "线性代数" &&
                    课程组[第三课程].课程名称 != "微积分" && 课程组[第三课程].课程名称 != "线性代数" &&
                    课程组[第四课程].课程名称 != "微积分" && 课程组[第四课程].课程名称 != "线性代数"{
                        符合条件 = false
                }
            }
            if 符合条件 {
                可选个数++
                var 学分:Int = 课程组[第一课程].学分! + 课程组[第二课程].学分! + 课程组[第三课程].学分! + 课程组[第四课程].学分!
                print("选四门课：选择\(课程组[第一课程].课程名称)，\(课程组[第二课程].课程名称)，\(课程组[第三课程].课程名称)，\(课程组[第四课程].课程名称)可以满足条件，学分为\(学分)")
                if 学分 > 最高学分{
                    最高学分 = 学分
                    print("出现新最高学分！分值：\(最高学分)")
                }
            }
    }
    
    if 第四课程 == 8{
        if 第三课程 == 8{
            if 第二课程 == 8{
                if 第一课程 == 8{
                    继续循环 = false
                }else{
                    第一课程++
                    第二课程 = 第一课程
                    第三课程 = 第二课程
                    第四课程 = 第三课程
                }
            }else{
                第二课程++
                第三课程 = 第二课程
                第四课程 = 第三课程
            }
        }else{
            第三课程++
            第四课程 = 第三课程
        }
    }else{
        第四课程++
    }
}
print("目前符合条件的选课方案有 \(可选个数) 种。")

//选五门课
继续循环 = true
第一课程 = 0
第二课程 = 0
第三课程 = 0
第四课程 = 0
var 第五课程 = 0
while 继续循环{
    
    //初始化变量
    符合条件 = true
    
    运筹学数量 = 0
    计算机学数量 = 0
    数学数量 = 0
    
    if 第一课程 != 第二课程 &&
        第二课程 != 第三课程 && 第三课程 != 第一课程 &&
        第四课程 != 第一课程 && 第四课程 != 第二课程 && 第四课程 != 第三课程{
            
            //检测数学类数量
            if 课程组[第一课程].是数学类 {数学数量++}
            if 课程组[第二课程].是数学类 {数学数量++}
            if 课程组[第三课程].是数学类 {数学数量++}
            if 课程组[第四课程].是数学类 {数学数量++}
            if 课程组[第五课程].是数学类 {数学数量++}
            
            //检测计算机学类数量
            if 课程组[第一课程].是计算机学类{计算机学数量++}
            if 课程组[第二课程].是计算机学类{计算机学数量++}
            if 课程组[第三课程].是计算机学类{计算机学数量++}
            if 课程组[第四课程].是计算机学类{计算机学数量++}
            if 课程组[第五课程].是计算机学类{计算机学数量++}
            
            //检测运筹学类数量
            if 课程组[第一课程].是运筹学类 {运筹学数量++}
            if 课程组[第二课程].是运筹学类 {运筹学数量++}
            if 课程组[第三课程].是运筹学类 {运筹学数量++}
            if 课程组[第四课程].是运筹学类 {运筹学数量++}
            if 课程组[第五课程].是运筹学类 {运筹学数量++}
            
            //检测完毕后，判断是否（不）满足相应条件
            if 数学数量 < 2 || 运筹学数量 < 3 || 计算机学数量 < 2{
                符合条件 = false
            }
            
            //判断课程依赖是否符合条件
            if 课程组[第一课程].要求先修微积分或线性代数  || 课程组[第二课程].要求先修微积分或线性代数 {
                if 课程组[第一课程].课程名称 != "微积分" && 课程组[第一课程].课程名称 != "线性代数" &&
                    课程组[第二课程].课程名称 != "微积分" && 课程组[第一课程].课程名称 != "线性代数" &&
                    课程组[第三课程].课程名称 != "微积分" && 课程组[第三课程].课程名称 != "线性代数" &&
                    课程组[第四课程].课程名称 != "微积分" && 课程组[第四课程].课程名称 != "线性代数" &&
                    课程组[第五课程].课程名称 != "微积分" && 课程组[第五课程].课程名称 != "线性代数"{
                        符合条件 = false
                }
            }
            if 符合条件 {
                可选个数++
                var 学分:Int = 课程组[第一课程].学分! + 课程组[第二课程].学分! + 课程组[第三课程].学分! + 课程组[第四课程].学分! + 课程组[第五课程].学分!
                print("选五门课：选择\(课程组[第一课程].课程名称)，\(课程组[第二课程].课程名称)，\(课程组[第三课程].课程名称)，\(课程组[第四课程].课程名称)，\(课程组[第五课程].课程名称)可以满足条件，学分为 \(学分)")
                if 学分 > 最高学分{
                    最高学分 = 学分
                    print("出现新最高学分！分值：\(最高学分)")
                }
            }
    }
    
    if 第五课程 == 8{
        if 第四课程 == 8{
            if 第三课程 == 8{
                if 第二课程 == 8{
                    if 第一课程 == 8{
                        继续循环 = false
                    }else{
                        第一课程++
                        第二课程 = 第一课程
                        第三课程 = 第二课程
                        第四课程 = 第三课程
                        第五课程 = 第四课程
                    }
                }else{
                    第二课程++
                    第三课程 = 第二课程
                    第四课程 = 第三课程
                    第五课程 = 第四课程
                }
            }else{
                第三课程++
                第四课程 = 第三课程
                第五课程 = 第四课程
            }
        }else{
            第四课程++
            第五课程 = 第四课程
        }
    }else{
        第五课程++
    }
}
print("目前符合条件的选课方案有 \(可选个数) 种。")



