clc
format long
disp("Lagrange Interpolation Polynomial")

%Collecting data from the user
answer = input("Will you be entering data from a file Y/N? ","s");

if (answer == "Y")
     
    Q = readmatrix("lagrange_interpolation_data.xlsx");
    numberData_points = size(Q,1);
          
else
   numberData_points = input("How many data points will you have: ");
   Q = zeros(numberData_points,2);

   for j = 1:numberData_points
       x_value = input("Enter value for x co-ordinate: ");
       y_value = input("Enter value for y co-ordinate: ");
       Q(j,1) = x_value;
       Q(j,2)= y_value;
   end

end

interpolation_point = input("Can you please enter the x value you would like to interpolate: ");

%Completed lagrange interpolation
Pn = LagrangeInterpolator(Q,interpolation_point,numberData_points);
disp(sprintf('The interpolated value is %f', Pn));


%
% Plotting our data
x_range = linspace(Q(1,1),Q(numberData_points,1),100);
for i = 1:100
    y_range(i) = LagrangeInterpolator(Q,x_range(i),numberData_points);
end

plot(Q(:,1),Q(:,2),"ro");
hold on
plot(x_range,y_range,"b-");
hold off

title("Lagrange interpolation polynomial");
subtitle("done by Rea","FontAngle","italic", "FontSize",10);
xlabel('x data points [units]');
ylabel('y data points [units]');
legend('Data Set', 'Polynomial', 'location', 'best');



%The lagrange formula stored in a function
function Pn = LagrangeInterpolator(Q,p,numberData_points)
sum =0;
for j = 1:numberData_points
    prod =1;
    for k = 1:numberData_points
        if(k~=j)
            prod = ((p - Q(k,1))/(Q(j,1)-Q(k,1)))*prod;
        end
    end
    sum = sum + prod*Q(j,2);
end
Pn = sum;
end