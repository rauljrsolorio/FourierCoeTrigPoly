n = input('Enter an integer n such that n > 0: ');
while n < 1
    n = input('Enter an integer n such that n > 0: ');
end

m = input('Enter an integer m such that m > 0: ');
while m < 1
    m = input('Enter an integer n such that m > 0: ');
end

x = linspace(0,2*pi,m); %determines the x. m is how many points to plot - 1 (syntax?) 
hold on
scatter(x,f(x)) % plot x and f(x) which is the y
scatter(x,pn(x,n)) %plot x and pn(x,n) which is the y
hold off

%Reminder: I removed the function sum_squared_error(n)

function pnx = pn(t,n) %where t is x0 through x100
    sum_cosines = c0_coefficient; %counter, instead of starting at 0, start with c0
    sum_sines = 0; %counter
    for i = 1: n
      sum_cosines = sum_cosines + (cos_coefficient(i) * cos(i*t));
      sum_sines = sum_sines + (sin_coefficient(i) * sin(i*t));    
    end
    pnx = sum_cosines + sum_sines;
end

function dn = sin_coefficient(n)
    %All this finds values from x0 to x100
    x_matrix = zeros(101,1); %holds from x0 to x100
    format long;
    deltaX = ((2*pi)-0)/100;%formula fixed ... (b-a) / n
    for i = 0 : 100 %from 0 through n
        xi = 0 + (i * deltaX); %formula
        x_matrix(i+1,1) = xi;   %storing it into the matrix
    end

    %only adds the first and last functions
    x0 = x_matrix(0+1,1); %gets x0 from matrix
    x100 = x_matrix(100 + 1,1); %gets x100 from matrix
    f0 = f(x0) * sin(n*x0); %formula, x0 passes through function f(t)
    f100 = f(x100) * sin(n*x100); %fomrula x100 passes through function f(t)
    first_last_sum = f0 + f100; %adds both values.
    
    %only adds the functions with coefficient 4 (in other words x sub odd num)
    sum_sin_odd = 0; %counter
    for i = 1 : 2 : 100
        xi = x_matrix(i+1,1); %gets value from matrix
        fi_odd = 4 * f(xi) * sin(n*xi); %formula
        sum_sin_odd = sum_sin_odd + fi_odd; %adds all the values
    end
    
    %only adds the functions with coefficient 2 (in other words x sub even num)
    sum_sin_even = 0;
    for i = 2 : 2 : 98
        xi = x_matrix(i+1,1);
        fi_even = 2 * f(xi) * sin(n*xi);
        sum_sin_even = sum_sin_even + fi_even;
    end
    
    all_sin_sum = first_last_sum + sum_sin_odd + sum_sin_even; %adds up all the sums
    simpsons_approx = (((2*pi)-0)/300) * all_sin_sum; % formula for simpsons rule
    dn = (1/pi) * simpsons_approx; % formula to find coefficient dk
end

function c0 = c0_coefficient
    %All this finds values from x0 to x100
    x_matrix = zeros(101,1); %holds from x0 to x100
    format long;
    deltaX = ((2*pi)-0)/100;%formula fixed ... (b-a) / n
    for i = 0 : 100 %from 0 through n
        xi = 0 + (i * deltaX); %formula
        x_matrix(i+1,1) = xi;   %storing it into the matrix
    end
    
    %only adds the first and last functions
    x0 = x_matrix(0+1,1);
    x100 = x_matrix(100 + 1,1);
    f0 = f(x0);
    f100 = f(x100);
    first_last_sum = f0 + f100;
    
    %only adds the functions with coefficient 4 (in other words x sub odd num)
    sum_cos_odd = 0;
    for i = 1 : 2 : 100
        xi = x_matrix(i+1,1);
        fi_odd = 4 * f(xi);
        sum_cos_odd = sum_cos_odd + fi_odd;
    end
    
    %only adds the functions with coefficient 2 (in other words x sub even num)
    sum_cos_even = 0;
    for i = 2 : 2 : 98
        xi = x_matrix(i+1,1);
        fi_even = 2 * f(xi);
        sum_cos_even = sum_cos_even + fi_even;
    end
    
    all_cos_sum = first_last_sum + sum_cos_odd + sum_cos_even; %adds up all the sums
    simpsons_approx = (((2*pi)-0)/300) * all_cos_sum; % formula for simpsons rule
    c0 = (1/(2*pi)) * simpsons_approx; % formula to find coefficient cn
end

function cn = cos_coefficient(n)
    %All this finds values from x0 to x100
    x_matrix = zeros(101,1); %holds from x0 to x100
    format long;
    deltaX = ((2*pi)-0)/100;%formula fixed ... (b-a) / n
    for i = 0 : 100 %from 0 through n
        xi = 0 + (i * deltaX); %formula
        x_matrix(i+1,1) = xi;   %storing it into the matrix
    end
    
    %only adds the first and last functions
    x0 = x_matrix(0+1,1);
    x100 = x_matrix(100 + 1,1);
    f0 = f(x0) * cos(n*x0);
    f100 = f(x100) * cos(n*x100);
    first_last_sum = f0 + f100;
    
    %only adds the functions with coefficient 4 (in other words x sub odd num)
    sum_cos_odd = 0;
    for i = 1 : 2 : 100
        xi = x_matrix(i+1,1);
        fi_odd = 4 * f(xi) * cos(n*xi);
        sum_cos_odd = sum_cos_odd + fi_odd;
    end
    
    %only adds the functions with coefficient 2 (in other words x sub even num)
    sum_cos_even = 0;
    for i = 2 : 2 : 98
        xi = x_matrix(i+1,1);
        fi_even = 2 * f(xi) * cos(n*xi);
        sum_cos_even = sum_cos_even + fi_even;
    end
    
    all_cos_sum = first_last_sum + sum_cos_odd + sum_cos_even; %adds up all the sums
    simpsons_approx = (((2*pi)-0)/300) * all_cos_sum; % formula for simpsons rule
    cn = (1/pi) * simpsons_approx; % formula to find coefficient cn
end

function ft = f(t)
    ft = cos(3*t); %function f(t) = t^2 ... This can be modified if needed
end