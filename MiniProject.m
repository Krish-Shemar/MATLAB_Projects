clear
clc;
clf; % clears figure/graph

fprintf("Hello, this is the quadratic equation program. \n"); 
while true 
    Value_Astr = input( "The input, for A cannot be zero: ", 's'); %Takes the input
    Value_A = str2double(Value_Astr); %Then converts string to a number
     
    %Error Check
    if isempty(Value_Astr) 
        disp('input cannot be empty.');
    elseif isnan(Value_A)
        disp('This is not a number.'); 
    elseif Value_A == 0  
        disp('A must not be zero!') 
    elseif ~isreal(Value_A)
        disp('A must be a real number please!'); 
    elseif isinf(Value_A)
        disp('A must be a finate number.'); 
    else 
        break % Break, exits the loop only if the input is valid
    end

end

fprintf("A accepted: %g\n", Value_A);%g is a notation here after geti9ng the input we print the persons input for a and accept it 

%Value B input and error check
while true
    Value_Bstr = input("Input the value for B: ", 's');
    Value_B = str2double(Value_Bstr);
    
    %Error Check
    if isempty(Value_Bstr)
        disp('B cannot be empty!!');
    
    elseif isnan(Value_B)
        disp('There must be a number! Please go again');
    
    elseif ~isreal(Value_B)
        disp('B needs to be a real number');
    
    elseif isinf(Value_B)
        disp('B must be finite!'); 
    else 
        break
    end
end

fprintf("B accepted: %g\n", Value_B);

%Value C input and error check
while true
    Value_Cstr = input("Finally, input C: ", 's');
    Value_C = str2double(Value_Cstr);
    
    %Error Check
    if isempty(Value_Cstr)
        disp('C cannot be empty!');
    
    elseif isnan(Value_C)
        disp('C must be a number!');
    
    elseif ~isreal(Value_C)
        disp('C must be a real number');
    
    elseif isinf(Value_C)
        disp('C must be a finite number.'); 
    else 
        break
    end
end

fprintf("C accepted: %g\n", Value_C);

% Discriminant Equation
D = Value_B^2 - (4 *Value_A * Value_C);
fprintf("Discriminant = %.2f \n",D); %2f is in a floating point form but once diaplyed it is shown as a number at 2 decimal points.

% Roots: Quadratic equation
if D > 0
    % Calcualtes the 2 roots if they are real
    x1 = (-Value_B + sqrt(Value_B^2 - (4 * Value_A * Value_C))) / (2 * Value_A); % Quadratic formula
    x2 = (-Value_B - sqrt(Value_B^2 - (4 * Value_A * Value_C))) / (2 * Value_A);
    fprintf("2 real roots\n");
    fprintf("The 2 roots are: (%.f) and (%.2f)\n", x1, x2) % Displays 2 roots in there decimal form one at 1 decimal place other 2 decimal place

elseif D == 0
    % Calcualtes only one repeated root
    x1 = -Value_B / (2 * Value_A);                                                                                                                                                                              
    fprintf("Only 1 repated root which = (%.2f) \n",x1)

else 
    fprintf("There are no real roots.\n");
end 

%turning point equation
x_rotate = -Value_B / (2 * Value_A);
y_rotate = (Value_A * x_rotate^2 + Value_B * x_rotate + Value_C); %This is the vertex of the quadratic equation 
fprintf("The Turning point, is around: (%.1f, %.3f)\n", x_rotate, y_rotate); % It prints one of the turning poitns to 1 and the other to 3 decimal places.

% limits-axis for the Quadratic Graph
if D >= 0 % This, choses the right x limits based on the inputs x1 and x2 entered and x_rotate number when solved.   
    x_value = linspace(min(x1, x2) - 20, max(x1, x2) + 20); % Roots
else
    x_value = linspace(x_rotate - 20, x_rotate + 20); %turning point 
end 

% The same as y_rotate but for the y limits as well.
y_value = (Value_A * x_value.^2 + Value_B * x_value + Value_C);


% Plots the Quadratic graph/curve
Legend_curve = plot(x_value, y_value, 'b', 'Linewidth', 1.5); % Saves the value to help us with legend later
grid on
title('The Quadratic Graph')
xlabel('x-axis') 
ylabel('y-axis') 

% adds the x and y axes lines on graph which equal to 0 
yline(0, 'Linewidth', 2); % plots the axisas y = o and x = 0 and also chose how thick the lines will be as well.
xline(0, 'LineWidth', 2);

hold on
%plots the turning point
Legend_turn = plot(x_rotate, y_rotate, 'go', 'MarkerFaceColor', 'g'); % plots the turning point and fills the point with the colour green.

%plots the roots onto graph/figure only if they are real
if D >= 0    
    Legend_root1 = plot(x1, 0, 'co', 'MarkerFaceColor', 'c'); % I set it to value legend_root1 to help later withthe legend

if D > 0
    Legend_root2 = plot(x2, 0, 'ro', 'MarkerFaceColor', 'r');
end

end

hold off   

%Quadratic Parabola Legend 
if D > 0 % This for 2 real roots and turning point
    TPL1 = sprintf('Turning Point = (%.f, %.3f)', x_rotate, y_rotate); % Allows to put on the legend the cordinates on the roots and truning point
    Root_L1 = sprintf('Root 1 = (%.2f, 0)', x1); % root is displyed at 2 decimal places
    Root_L2 = sprintf('Root 2 = (%.2f, 0)', x2); % root is displyed at 2 decimal places
    legend([Legend_curve, Legend_turn, Legend_root1, Legend_root2],{'Quadratic Parabola', TPL1, Root_L1, Root_L2}, ...
        'Location', 'best');% This code makes the legend uses L1, L2, L3  for roots and turning point
    % and puts them in the best location based on how the quadratic graph
    % will look

elseif D == 0 % This for 1 real roots and turning point
    TPL1 = sprintf('Turning Point = (%.f, %.3f)', x_rotate, y_rotate);
    Root_L1 = sprintf('Root 1 = (%.2f, 0)', x1);
    legend([Legend_curve, Legend_turn, Legend_root1],{'Quadratic Parabola', TPL1, Root_L1}, 'Location', 'best');

else % This is just for the turning points and no real roots
    TPL1 = sprintf('Turning Point = (%.f, %.3f)', x_rotate, y_rotate);
    legend([Legend_curve, Legend_turn], {'Quadratic Parabola', TPL1},'Location', 'best'); 
end

%%Extension Task Straigh line graph
while true 
    Choice1str = input("Would you like to plot another line on the graph (y/n):", 's'); % Gives the descison if you want to cotinue on with program
   
    if isempty(Choice1str) % Error Check
        disp('The input can not be empty.');
   elseif isnumeric(Choice1str)
        disp('Input cannot be a number.');
    elseif any(strcmpi(Choice1str, {'y', 'n'})) %This checks weather the descion made was either y or n and any compres the 2 strings y and n and 
        %returns one of them true and the other false
        Choice1 = Choice1str;
        break
    else
        disp('This is a Invalid input.');
    if strcmpi(Choice1, 'y')% Checks if userer entered the leter y 
        end
    end
end

fprintf("Decision accepted: %s\n", Choice1);
    
% Gradient input
while true
    mg_1str = input("Please enter the gradient of the line: ", 's');
    mg_1 = str2double(mg_1str);
    
    if isempty(mg_1str)
        disp(' The Gradient must not be empty!'); 
    elseif isnan(mg_1)
        disp('Input has to be a number!'); 
    elseif ~isreal(mg_1)
        disp('Input must be a real number!');
    elseif isinf(mg_1)
        disp('Input has to be finite!');
    else
        break
    end
end
fprintf("Gradient accepted: %g\n", mg_1);

% Y-intercept input
while true
    Intercect_C_str = input("Please enter the Y-intercept of the line: ", 's');
    Intercect_C = str2double(Intercect_C_str);
    
    if isempty(Intercect_C_str)
        disp('The Y-intercept cannot be empty!');
    elseif isnan(Intercect_C)
        disp('Input must be a number!');
    elseif ~isreal(Intercect_C)
        disp('Input needs to be a real number!');
    elseif isinf(Intercect_C)
        disp('Input must be finite!');
    else
        break
   end
end
fprintf("Y-intercept accepted: %g\n", Intercect_C);

% Quadratic for the intersections points
input_A = Value_A; % Input A now equals Value A
input_B = (Value_B - mg_1); % Input B equals Value B - gradient
input_C = (Value_C - Intercect_C); %Input C equals value C - y intmercept

Discriminant_line = (input_B^2 - 4 * input_A * input_C); % Discriminant equation
fprintf("Discriminant of straight line = %.2f \n", Discriminant_line);

hold on;

% This Plots the intersection points
if Discriminant_line > 0
    Intercect_point1 = (-input_B + sqrt(Discriminant_line)) / (2 * input_A); %Quadratic equation formula
    Intercect_point2 = (-input_B - sqrt(Discriminant_line)) / (2 * input_A);
    fprintf("There are only 2 intersection points on the graph: %.2f and %.2f\n", Intercect_point1, Intercect_point2); %Prints 2 intersect points

    point_1 = plot(Intercect_point1, mg_1 * Intercect_point1 + Intercect_C,'mo','MarkerFaceColor','m'); %Plots the first intersect point
    point_2 = plot(Intercect_point2, mg_1 * Intercect_point2 + Intercect_C,'mo','MarkerFaceColor','m'); %Plots the 2nd intersect point
    
elseif Discriminant_line == 0
    Intercect_point1 = (-input_B + sqrt(Discriminant_line)) / (2 * input_A); %Quadratic equation formula
    fprintf("There is only 1 intersection point: %.2f\n", Intercect_point1);
    
    point_1 = plot(Intercect_point1, mg_1 * Intercect_point1 + Intercect_C,'mo','MarkerFaceColor','m'); % Intercect_point1 is (x) and 
    % mg_1 * Intercect_point1 + Intercect_C is the (y) point and it is
    % colored magenta and filled in as well
    point_2 = [];% No intersect points it is empty

else
    fprintf("There is no intersection points.\n");
    point_1 = [];% No intersect points it is empty
    point_2 = [];
end

% Limits
if Discriminant_line > 0 % 2 intersect points exist
    x_newrange = linspace(min([Intercect_point1, Intercect_point2]) - 20, max([Intercect_point1, Intercect_point2]) + 20);
    %Sets the X limits on graph and extends 20 each side

elseif Discriminant_line == 0 % 1 intersect point
    x_newrange = linspace(Intercect_point1 - 20, Intercect_point1 + 20);
    
else % 0 Intcept points exist
    x_newrange = linspace(x_rotate - 20, x_rotate + 20);
    
end

% Plot straight line   
y_line = (mg_1 * x_newrange + Intercect_C); % Straight line equation y = mx + c
legend_line = plot(x_newrange, y_line, 'y', 'LineWidth', 1); % Plots straight line colour yellow width of line 1

% Straight line Legend
TPL1 = sprintf('Turning Point = (%.f, %.3f)', x_rotate, y_rotate); % Sets turning point for every outcome for the legends regardless of the intercepts

if Discriminant_line > 0
    IL_P1 = sprintf('Intersect 1 = (%.2f, %.2f)', Intercect_point1, mg_1*Intercect_point1+Intercect_C);
    IL_P2 = sprintf('Intersect 2 = (%.2f, %.2f)', Intercect_point2, mg_1*Intercect_point2+Intercect_C);
    legend([Legend_curve, Legend_turn, legend_line, point_1, point_2], ...
        {'Quadratic Parabola', TPL1, 'Straight line', IL_P1, IL_P2}, 'Location','best');

elseif Discriminant_line == 0
   IL_P1 = sprintf('Intersect = (%.2f, %.2f)', Intercect_point1, mg_1*Intercect_point1+Intercect_C);
   legend([Legend_curve, Legend_turn, legend_line, point_1], ...
       {'Quadratic Parabola', TPL1, 'Straight line', IL_P1}, 'Location','best');

else
   legend([Legend_curve, Legend_turn, legend_line], ...
       {'Quadratic Parabola', TPL1, 'Straight line'}, 'Location','best');
end

%Reference

%Linspace reference (no date) Generate linearly spaced vector - MATLAB. 
% Available at: https://www.mathworks.com/help/matlab/ref/double.linspace.html 
% (Accessed: 05 November 2025).  line: maincode = (104,108) and Extension = (249,258)

% Isnumeric (no date) Determine whether input is numeric array - MATLAB. Available at: 
% https://www.mathworks.com/help/matlab/ref/isnumeric.html
%  (Accessed: 05 November 2025). line: extension = (166,167)

%Strcmpi (no date) Compare strings (case insensitive) - MATLAB. Available at: 
% https://www.mathworks.com/help/matlab/ref/strcmpi.html 
% (Accessed: 05 November 2025). line: extension = (168,174)