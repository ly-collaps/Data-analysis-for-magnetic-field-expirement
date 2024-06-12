clear all;
close all;

load data.mat;

a = data00000000(:,5);
l = 50; %quarter length of a step (around 50 for 15 sec step)
m = movmean(a, l);
% hold on
% plot(1:size(data00000000,1),data00000000(:,2));
% plot(1:size(data00000000,1), m)

tol = 0.025; %acceptable difference between mean values in one step
n_tol = 20; %(maybe less)

%if n_tol values in front of the current are not greater than tol => leave it
for n = n_tol + 1 : length(m) - n_tol
    container = 0;
    for k = 1 : n_tol
        if abs(m(n) - m(n + k)) < tol || abs(m(n) - m(n - k)) < tol
            container = container + 1;
        end
    end
    %if not - make it a NaN
    if container ~= n_tol
        m(n) = NaN;
    end
end

% hold on
% plot(1:size(data00000000,1),data00000000(:,5));
% plot(1:size(data00000000,1), m, 'o')
% title('Absolut magnetic field currents 0.6-1A')
% ylabel('Magnetic field [μT]')

% % %remove NaN
% m = rmmissing(m);
% 
% plot(m) %shifted, because of removed x-values
% 
% 
% step = 10;
% diff_tol = 0.05;
% %c
% vals = zeros(1, length(m));
% for i = 1 : length(m) - n_tol
%     if abs(m(i) - m(i + step)) < diff_tol
%         vals(i) = m(i);
%     else
%         vals(i) = NaN;
%     end
% end
vals = m;


hold on
% plot(vals)


%sort into separate arrays
j = 1;
n_groups = 30; %upper limit
val_table = zeros(n_groups, length(vals));
for i = 1 : length(vals) - 1
    val_table(j, i) = vals(i);
    if isnan(vals(i+1)) && ~isnan(vals(i))
        j = j + 1;
    end
end

row_means = zeros(n_groups, 1);
for i = 1 : n_groups
    row_means(i, 1) = mean(val_table(i,(val_table(i, :) ~= 0)), "omitnan");
end
% 
% %row_means over time
% for j = 1 : length(vals) - 1
%     for i = 1:n_groups
%         if val_table(i, j) ~= 0 && ~isnan(val_table(i, j))
%             val_table(i, j) = row_means(i, 1);
%         end
%     end
% end

row_means = rmmissing(row_means);
% plot(row_means, 'o')


%manual work
magnetic_field = [row_means(3), row_means(5), (row_means(8)+row_means(7))/2, (row_means(13)+row_means(14))/2, row_means(16)];
%substract the ground field
ground_field = (row_means(4)+row_means(6)+ row_means(12)+row_means(15))/4;
magnetic_field = (magnetic_field - ground_field)*10^3; %conversion to nanoT
currents = [600 700 800 900 1000];
%plot(currents, magnetic_field,'*')

myfit = fittype({'x'});
f=fit(currents(:),magnetic_field(:), myfit)

%from excel
fitting_curve_calculation = 0.229*currents + 1e-7;


% Plot
hold on
plot(f, currents, magnetic_field, 'o')
plot(currents, fitting_curve_calculation, 'DisplayName', 'Calculation')
title('Absolut magnetic field against currents')
ylabel('Magnetic field [μT]')
xlabel('Current[mA]')