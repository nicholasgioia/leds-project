%   plotDecisionBoundaries() plot Decision Boundaries for One-vs-All Logistic Regression Models
%   Input:
%   all_theta - Matrix where the i-th row is the trained logistic regression parameters for class i
%   u - Training data 
%   y - Training labels

function plotDecisionBoundaries(all_theta, u, y)
    % Create a grid of points
    u_min = min(u(:, 1)) - 1;
    u_max = max(u(:, 1)) + 1;
    y_min = min(u(:, 2)) - 1;
    y_max = max(u(:, 2)) + 1;
    [u1Grid, u2Grid] = meshgrid(u_min:0.1:u_max, y_min:0.1:y_max);
    UGrid = [u1Grid(:), u2Grid(:)];
    
    % Predict using the grid
    y_predGrid = oneVsAll_Pred(all_theta, UGrid);
    
    % Reshape the predictions back into the grid
    y_predGrid = reshape(y_predGrid, size(u1Grid, 1), size(u2Grid, 2));
    
    % Plot the decision boundaries as a background
    figure();
    imagesc([u_min, u_max], [y_min, y_max], y_predGrid);
    set(gca, 'YDir', 'normal');
    grid on;
    hold on;
    % Plot the data pont
    gscatter(u(:,1), u(:,2), y, 'rgb', '.');
    legend({'C1','C2','C3'});
    title('Decision Boundaries');
    hold off;
end