clear all;
close all; 

% Creating Twistet Geometry pattern one

% ---- Input in mm

length=150;
width=5;
height=1.6;

current=0.2;
Name='200mA_double_twist6';

% ---- compute 

pos=[0 -2 0];
i=1;
path{i}=[pos(1) pos(2) pos(3)];

pos=[2 -4 0];
i=i+1;
path{i}=[pos(1) pos(2) pos(3)];

pos=[2 -8 0];
i=i + 1;
path{i}=[pos(1) pos(2) pos(3)];

pos=[13 -19 0];
i=i + 1;
path{i}=[pos(1) pos(2) pos(3)];

pos=[29 -19 0];
i=i + 1;
path{i}=[pos(1) pos(2) pos(3)];

pos=[40 -8 0];
i=i + 1;
path{i}=[pos(1) pos(2) pos(3)];

pos=[40 8 0];
i=i + 1;
path{i}=[pos(1) pos(2) pos(3)];

pos=[29 19 0];
i=i + 1;
path{i}=[pos(1) pos(2) pos(3)];

pos=[13 19 0];
i=i + 1;
path{i}=[pos(1) pos(2) pos(3)];

pos=[2 8 0];
i=i + 1;
path{i}=[pos(1) pos(2) pos(3)];

pos=[2 0 0];
i=i + 1;
path{i}=[pos(1) pos(2) pos(3)]; 

%second cirlce
pos=[2 0 height];
i=i + 1;
path{i}=[pos(1) pos(2) pos(3)]; 

pos=[2 -8 height];
i=i + 1;
path{i}=[pos(1) pos(2) pos(3)];

pos=[13 -19 height];
i=i + 1;
path{i}=[pos(1) pos(2) pos(3)];

pos=[29 -19 height];
i=i + 1;
path{i}=[pos(1) pos(2) pos(3)];

pos=[40 -8 height];
i=i + 1;
path{i}=[pos(1) pos(2) pos(3)];

pos=[40 8 height];
i=i + 1;
path{i}=[pos(1) pos(2) pos(3)];

pos=[29 19 height];
i=i + 1;
path{i}=[pos(1) pos(2) pos(3)];

pos=[13 19 height];
i=i + 1;
path{i}=[pos(1) pos(2) pos(3)];

pos=[2 8 height];
i=i + 1;
path{i}=[pos(1) pos(2) pos(3)];

pos=[2 4 height];
i=i + 1;
path{i}=[pos(1) pos(2) pos(3)];

pos=[0 2 height];
i=i + 1;
path{i}=[pos(1) pos(2) pos(3)];

n = i;
%---- Plot

for i=1:n
    path_x(i)=path{i}(1);
    path_y(i)=path{i}(2);
    path_z(i)=path{i}(3);
end
figure()
hold on
plot3(path_x,path_y,path_z)
grid on
axis equal

% ---- Export
% 
% fileName = append(Name,'.txt');
% fileID = fopen(fileName,'w');
% for i=1:n
%     fprintf(fileID,'%s,%.10f,%.10f,%.10f,%.10f\n',Name,current,path{i}(1),path{i}(2),path{i}(3));
% end
% fclose(fileID);