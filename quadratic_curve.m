function quadratic_curve

    %Initial Variables.
    A = 1.6
    B = 2.5 
    C = 6;
    
    %Linspace between -4 to 6.
    x = linspace(-4,6);
    %Y Value - Quadratic Curve.
    y = (A.*x).^2 + B.*x + C;
   
    %create the random noise with standard deviation of 5.
    samples = 5.*randn(1,100);  
   
    %Linear Regression Analytical Method FOR TEST.
    %n = length(x);
    %m2 = (n*sum(x.*y)-sum(x)*sum(y))/(n*sum(x.^2)-(sum(x)^2));
    %c2 = mean(y)-m2*mean(x);
    %y2 = m2*x + c2; 
    
    %linear basis for regress
    XLin = [x;ones(size(samples));];
    betaLin = regress(y.',XLin.');
    %Get the m value.
    m3 = betaLin(1); 
    %calculate c
    c3 = betaLin(2)
    %get y from new m and new c.
    yLin = m3.*x + c3;
   
    %Quadatic basis for regress
    Quad = [x .*x; x;ones(size(samples));];
    betaQuad = regress(y.',Quad.');
    yQuad = (A.*x).^2 + (betaQuad.*x) + C;
    %plotting data
    figure
    hold on
    plot(x,samples(1,:)+y,'Marker','o');
    plot(x,yQuad(1,:),'r');
    plot(x,yLin,'g');
    
    title('Quadratic Plot');
    xlabel('Data point number');
    ylabel('Data point value');
    
    legend('raw-data','fitted lin data','fitted quad data');

    
end
