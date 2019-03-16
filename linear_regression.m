function linear_regression()

    %Initial variables.
    %linspace to create vaules between -4,6
    x = linspace(-4,6);
    m = 1.6;
    c = 6;
    %y = mx + C;
    y = 1.6*x + c;
    
    %create random noise.
    r = randn(2,100);    
    %get the length of x
    n = length(x);
    %first part of calculating c 
    m2 = (n*sum(x.*y)-sum(x)*sum(y))/(n*sum(x.^2)-(sum(x)^2));
    %calculation of c.
    c2 = mean(y)-m2*mean(x);
    %calculation of y in accordance to the analytical method.
    y2 = m2*x + c2;
    
    %Creating plots.
    figure
    hold on
    %Plotting the initial x,y with random noise (r)
    plot(x,r(1,:)+y,'Marker','*');
    %plotting the new x,y (linear regression).
    plot(x,y2);
    
    title('Raw data ');
    xlabel('Data point value');
    ylabel('Data point number');
    
end 
