

function calculator()
    fig = figure('Name', 'Octave Calculator', 'NumberTitle', 'off', ...
                 'Position', [500, 100, 310, 650], 'MenuBar', 'none', ...
                 'Resize', 'on', 'Color', [0.97, 0.97, 0.97]);

displayBox = uicontrol('Style', 'edit', 'String', '', ...
                       'Position', [20, 600, 270, 50], ...
                       'FontSize', 16, 'HorizontalAlignment', 'right', ...
                       'BackgroundColor', [0.9, 1, 0.9], ... % Light green background
                       'ForegroundColor', [0, 0, 0]);

    % Button labels
    btnLabels = {'x^y','x^1/y','x^1/2','x^1/3', ...
                 '1/x', 'e', 'x^2', 'x^3',...
                 'secd','cosecd','cotd','!', ...
                 'sind','cosd','tand','pi', ...
                 '(', ')', '⌫', 'C', ...
                 '7', '8', '9', '/', ...
                 '4', '5', '6', '*', ...
                 '1', '2', '3', '-', ...
                 '.', '0', '=', '+', ...
                 };

    % Grid parameters
    btnWidth = 60;
    btnHeight = 50;
    paddingX = 10;  % Horizontal spacing
    paddingY = 10;  % Vertical spacing
    startX = 20;    % Left margin
    startY = 540;   % Bottom margin
    cols = 4;       % Number of columns

    % Create buttons dynamically with color
    for i = 1:length(btnLabels)
        row = floor((i-1) / cols);  % Calculate row index
        col = mod((i-1), cols);     % Calculate column index

        xPos = startX + col * (btnWidth + paddingX);
        yPos = startY - row * (btnHeight + paddingY);

        % Button color logic (e.g., 'C' button in red)
        if strcmp(btnLabels{i}, 'C')
            bgColor = [1, 0, 0];  % Red background for 'C'
            fgColor = [1, 1, 1];  % White text
        elseif strcmp(btnLabels{i}, '=')  % Blue background for '='
            bgColor = [0, 0, 1];
            fgColor = [1, 1, 1];  % White text
        elseif strcmp(btnLabels{i}, '0')  % Blue background for '='
            bgColor = [0.6, 0.6, 0.6];
            fgColor = [1, 1, 1];  % White text
        elseif strcmp(btnLabels{i}, '1')  % Blue background for '='
            bgColor = [0.6, 0.6, 0.6];
            fgColor = [1, 1, 1];  % White text
        elseif strcmp(btnLabels{i}, '2')  % Blue background for '='
            bgColor = [0.6, 0.6, 0.6];
            fgColor = [1, 1, 1];  % White text
        elseif strcmp(btnLabels{i}, '3')  % Blue background for '='
            bgColor = [0.6, 0.6, 0.6];
            fgColor = [1, 1, 1];  % White text
        elseif strcmp(btnLabels{i}, '4')  % Blue background for '='
            bgColor = [0.6, 0.6, 0.6];
            fgColor = [1, 1, 1];  % White text
        elseif strcmp(btnLabels{i}, '5')  % Blue background for '='
            bgColor = [0.6, 0.6, 0.6];
            fgColor = [1, 1, 1];  % White text
        elseif strcmp(btnLabels{i}, '6')  % Blue background for '='
            bgColor = [0.6, 0.6, 0.6];
            fgColor = [1, 1, 1];  % White text
        elseif strcmp(btnLabels{i}, '7')  % Blue background for '='
            bgColor = [0.6, 0.6, 0.6];
            fgColor = [1, 1, 1];  % White text
        elseif strcmp(btnLabels{i}, '8')  % Blue background for '='
            bgColor = [0.6, 0.6, 0.6];
            fgColor = [1, 1, 1];  % White text
        elseif strcmp(btnLabels{i}, '9')  % Blue background for '='
            bgColor = [0.6, 0.6, 0.6];
            fgColor = [1, 1, 1];  % White text
        else
            bgColor = [0.2, 0.2, 0.2];  % Light gray background for others
            fgColor = [1, 1, 1];  % White text
        end

        % Create button
        uicontrol('Style', 'pushbutton', 'String', btnLabels{i}, ...
                  'Position', [xPos, yPos, btnWidth, btnHeight], ...
                  'FontSize', 14, 'Callback', @(src, event) buttonPress(src, displayBox), ...
                  'BackgroundColor', bgColor, 'ForegroundColor', fgColor);
    end
end

function buttonPress(src, displayBox)
    btnText = get(src, 'String');
    currentText = get(displayBox, 'String');

    switch btnText
        case 'C'  % Clear display
            set(displayBox, 'String', '');

        case '⌫'  % Backspace
            if ~isempty(currentText)
                set(displayBox, 'String', currentText(1:end-1));
            end

        case '='  % Evaluate expression
            try
                % Replace 'pi' with the numeric value of pi before evaluation
                expression = strrep(currentText, 'pi', num2str(pi));
                result = eval(expression);
                set(displayBox, 'String', num2str(result));
            catch
                set(displayBox, 'String', 'Error');
            end

        case '.'  % Decimal point
            if isempty(currentText)
                set(displayBox, 'String', '0.');
            else
                set(displayBox, 'String', [currentText btnText]);
            end

        case 'secd'  % sec(x) = 1 / cos(x)
            if isempty(currentText) || currentText(end) == '('
                set(displayBox, 'String', [currentText 'sec(']);
            else
                try
                    value = str2double(currentText);
                    result = 1 / cosd(value);
                    set(displayBox, 'String', num2str(result));
                catch
                    set(displayBox, 'String', 'Error');
                end
            end

        case 'cosecd'  % cosec(x) = 1 / sin(x)
            if isempty(currentText) || currentText(end) == '('
                set(displayBox, 'String', [currentText 'cosec(']);
            else
                try
                    value = str2double(currentText);
                    result = 1 / sind(value);
                    set(displayBox, 'String', num2str(result));
                catch
                    set(displayBox, 'String', 'Error');
                end
            end

        case 'cotd'  % cot(x) = 1 / tan(x)
            if isempty(currentText) || currentText(end) == '('
                set(displayBox, 'String', [currentText 'cot(']);
            else
                try
                    value = str2double(currentText);
                    result = 1 / tand(value);
                    set(displayBox, 'String', num2str(result));
                catch
                    set(displayBox, 'String', 'Error');
                end
            end

        case 'sind'  % sin(x)
            if isempty(currentText) || currentText(end) == '('
                set(displayBox, 'String', [currentText 'sin(']);
            else
                try
                    value = str2double(currentText);
                    result = sind(value);
                    set(displayBox, 'String', num2str(result));
                catch
                    set(displayBox, 'String', 'Error');
                end
            end

        case 'cosd'  % cos(x)
            if isempty(currentText) || currentText(end) == '('
                set(displayBox, 'String', [currentText 'cos(']);
            else
                try
                    value = str2double(currentText);
                    result = cosd(value);
                    set(displayBox, 'String', num2str(result));
                catch
                    set(displayBox, 'String', 'Error');
                end
            end

        case 'tand'  % tan(x)
            if isempty(currentText) || currentText(end) == '('
                set(displayBox, 'String', [currentText 'tan(']);
            else
                try
                    value = str2double(currentText);
                    result = tand(value);
                    set(displayBox, 'String', num2str(result));
                catch
                    set(displayBox, 'String', 'Error');
                end
            end

        case '!'  % Factorial
            try
                value = str2double(currentText);
                if value == floor(value) && value >= 0  % Ensure non-negative integer
                    result = factorial(value);
                    set(displayBox, 'String', num2str(result));
                else
                    set(displayBox, 'String', 'Error');
                end
            catch
                set(displayBox, 'String', 'Error');
            end

        case '1/x'  % Reciprocal (1/x)
            try
                if isempty(currentText)
                    set(displayBox, 'String', '1/');
                else
                    set(displayBox, 'String', [currentText '1/']);
                end
            catch
                set(displayBox, 'String', 'Error');
            end

        case 'e'  % e
            if isempty(currentText)
              value = 1;
            else
              value = str2double(currentText);
            end
            if isnan(value)  % Check for invalid input
                set(displayBox, 'String', 'Error');
            else
                result = exp(value);
                set(displayBox, 'String', num2str(result));
            end

        case 'x^1/2'  % x^2
          try
            if isempty(currentText)
              set(displayBox, 'String', 'Error');
            else
              set(displayBox, 'String', [currentText '^(1/2)']);
            end
          catch
            set(displayBox, 'String', 'Error');
          end


        case 'x^1/3'  % x^2
          try
            if isempty(currentText)
              set(displayBox, 'String', 'Error');
            else
              set(displayBox, 'String', [currentText '^(1/3)']);
            end
          catch
            set(displayBox, 'String', 'Error');
          end

        case 'x^1/y'  % x^2
            if isempty(currentText) || currentText(end) == '('
                set(displayBox, 'String', [currentText '']);
            else
                set(displayBox, 'String', [currentText '^(1/']);
            end

        case 'x^2'  % x^2
          try
            if isempty(currentText)
              set(displayBox, 'String', 'Error');
            else
              set(displayBox, 'String', [currentText '^2']);
            end
          catch
            set(displayBox, 'String', 'Error');
          end

       case 'x^3'  % x^2
          try
            if isempty(currentText)
              set(displayBox, 'String', 'Error');
            else
              set(displayBox, 'String', [currentText '^3']);
            end
          catch
            set(displayBox, 'String', 'Error');
          end

        case 'x^y'  % x^y
            if isempty(currentText) || currentText(end) == '('
                set(displayBox, 'String', [currentText '']);
            else
                set(displayBox, 'String', [currentText '^']);
            end

        otherwise  % Append button text to display
            set(displayBox, 'String', [currentText btnText]);
    end
end

calculator();
