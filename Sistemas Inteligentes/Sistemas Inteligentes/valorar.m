function [error1, error2, error3] = valorar(x,y,z)
    fun1 = (x)*3+ (y)*8+ (z)*2;   
    fun2 = (x)- (y)*2+ (z)*4;
    fun3 = -(x)*5+ (y)*3+ (z)*11;
    error1 = 25-fun1;
    error2 = 12-fun2;
    error3 = 4-fun3;
end

