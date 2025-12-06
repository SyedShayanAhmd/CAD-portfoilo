% Data from the table
models = {'YOLO v8 (10)', 'YOLO v11 (10)', 'CNN (10)', 'ResNet (10)', 'DenseNet (10)', ...
          'YOLO v8 (30)', 'YOLO v11 (30)', 'CNN (30)', 'ResNet (30)', 'DenseNet (30)'};

accuracy = [84.0, 94.5, 91.4, 77.0, 81.9, 94.5, 99.0, 83.7, 87.1, 93.0];

f1_dusty = [83.8, 94.2, 89.8, 76.7, 81.6, 94.5, 99.0, 77.2, 82.0, 91.3];
f1_clean = [84.4, 96.6, 91.5, 83.5, 88.4, 94.3, 99.0, 78.6, 82.3, 91.6];

% Create scatter plot
figure;
hold on;
grid on;

% Scatter plot for Dusty
scatter(accuracy, f1_dusty, 100, 'ro', 'filled'); % Red circles

% Scatter plot for Clean
scatter(accuracy, f1_clean, 100, 'bs', 'filled'); % Blue squares

% Labels and title
xlabel('Accuracy (%)');
ylabel('F1 Score');
title('Accuracy vs. F1 Score for Dusty and Clean Categories');
legend({'Dusty', 'Clean'}, 'Location', 'southeast');

% Annotate points with model names
for i = 1:length(models)
    text(accuracy(i), f1_dusty(i), models{i}, 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'Color', 'r');
    text(accuracy(i), f1_clean(i), models{i}, 'VerticalAlignment', 'top', 'HorizontalAlignment', 'left', 'Color', 'b');
end

hold off;
