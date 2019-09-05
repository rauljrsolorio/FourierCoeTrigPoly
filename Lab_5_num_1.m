k = input('Enter an integer k such that k is greater than or equal to 0: ');
while k < 0
    k = input('Enter an integer k such that k is greater than or equal to 0: ');
end

trig_function = input('Enter a number (1 = sine, 2 = cosine) to find the approximation of the Fourier coefficient: ');

if trig_function == 1
    sin_coefficient(k);
elseif trig_function == 2
    cos_coefficient(k);
end

function dk = sin_coefficient(k)
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
    f0 = f(x0) * sin(k*x0); %formula, x0 passes through function f(t)           
    f100 = f(x100) * sin(k*x100); %formula x100 passes through function f(t)    
    first_last_sum = f0 + f100; %adds both values.
    
    %only adds the functions with coefficient 4 (in other words x sub odd num)
    sum_sin_odd = 0; %counter
    for i = 1 : 2 : 100                %reality goes from 1 through 99 but odds
        xi = x_matrix(i+1,1); %gets value from matrix
        fi_odd = 4 * f(xi) * sin(k*xi); %formula
        sum_sin_odd = sum_sin_odd + fi_odd; %adds all the values
    end
    
    %only adds the functions with coefficient 2 (in other words x sub even num)
    sum_sin_even = 0;
    for i = 2 : 2 : 98
        xi = x_matrix(i+1,1);
        fi_even = 2 * f(xi) * sin(k*xi);
        sum_sin_even = sum_sin_even + fi_even;
    end
    
    all_sin_sum = first_last_sum + sum_sin_odd + sum_sin_even; %adds up all the sums
    simpsons_approx = (((2*pi)-0)/300) * all_sin_sum; % formula for simpsons rule
    format long;
    dk = (1/pi) * simpsons_approx; % formula to find coefficient dk
   
    fprintf('An approximation of the Fourier coefficient, dk (for sine), is: %d\n',dk);
end

function ck = cos_coefficient(k)

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
    f0 = f(x0) * cos(k*x0);
    f100 = f(x100) * cos(k*x100);
    first_last_sum = f0 + f100;
    
    %only adds the functions with coefficient 4 (in other words x sub odd num)
    sum_cos_odd = 0;
    for i = 1 : 2 : 100
        xi = x_matrix(i+1,1);
        fi_odd = 4 * f(xi) * cos(k*xi);
        sum_cos_odd = sum_cos_odd + fi_odd;
    end
    
    %only adds the functions with coefficient 2 (in other words x sub even num)
    sum_cos_even = 0;
    for i = 2 : 2 : 98
        xi = x_matrix(i+1,1);
        fi_even = 2 * f(xi) * cos(k*xi);
        sum_cos_even = sum_cos_even + fi_even;
    end
    
    all_cos_sum = first_last_sum + sum_cos_odd + sum_cos_even; %adds up all the sums
    simpsons_approx = (((2*pi)-0)/300) * all_cos_sum; % formula for simpsons rule
    ck = (1/pi) * simpsons_approx; % formula to find coefficient cn
    
    fprintf('An approximation of the Fourier coefficient, ck (for cosine), is: %d\n', ck);
end

function ft = f(t)
    ft = cos(3*t); %function f(t) = t^2 ... This can be modified if needed
end