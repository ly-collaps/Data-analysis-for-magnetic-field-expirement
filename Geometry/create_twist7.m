clear all;
close all; 

% Creating Twistet Geometry pattern one

% ---- Input in mm

length=150;
width=5;
height=-1.6;

current=0.6;
Name='600mA_double_twist7';

% ---- compute
dx = 1;
dy = 1;
j = 1;

%upper circle
pos=[0 -2 0];
path{j}=[pos(1) pos(2) pos(3)];
j=j+1;

for i=0:3
    pos=[0+2*dx*i -9+dy*i 0];
    path{j}=[pos(1) pos(2) pos(3)];
    j=j+1;


    pos=[16+dx*i -25+2*dy*i 0];
    path{j}=[pos(1) pos(2) pos(3)];
    j=j+1;


    pos=[38-dx*i -25+2*dy*i 0];
    path{j}=[pos(1) pos(2) pos(3)];
    j=j+1;


    pos=[52-2*dx*i -11+dy*i 0];
    path{j}=[pos(1) pos(2) pos(3)];
    j=j+1;


    pos=[52-2*dx*i 11-dy*i 0];
    path{j}=[pos(1) pos(2) pos(3)];
    j=j+1;


    pos=[38-dx*i 25-2*dy*i 0];
    path{j}=[pos(1) pos(2) pos(3)];
    j=j+1;


    pos=[16+dx*i 25-2*dy*i 0];
    path{j}=[pos(1) pos(2) pos(3)];
    j=j+1;


    pos=[2+2*dx*i 11-dy*i 0];
    path{j}=[pos(1) pos(2) pos(3)];
    j=j+1;
end

% connection point
pos=[8 0 0];
path{j}=[pos(1) pos(2) pos(3)];
j=j+1;

pos=[8 0 height];
path{j}=[pos(1) pos(2) pos(3)];
j=j+1;

%second circle 
for i=0:3
    pos=[8-2*dx*i -8-dy*i height];
    path{j}=[pos(1) pos(2) pos(3)];
    j=j+1;


    pos=[19-dx*i -19-2*dy*i height];
    path{j}=[pos(1) pos(2) pos(3)];
    j=j+1;


    pos=[35+dx*i -19-2*dy*i height   ];
    path{j}=[pos(1) pos(2) pos(3)];
    j=j+1;


    pos=[46+2*dx*i -8-dy*i height];
    path{j}=[pos(1) pos(2) pos(3)];
    j=j+1;


    pos=[46+2*dx*i 8+dy*i height];
    path{j}=[pos(1) pos(2) pos(3)];
    j=j+1;


    pos=[35+dx*i 19+2*dy*i height];
    path{j}=[pos(1) pos(2) pos(3)];
    j=j+1;


    pos=[19-dx*i 19+2*dy*i height];
    path{j}=[pos(1) pos(2) pos(3)];
    j=j+1;


    pos=[6-2*dx*i 6+dy*i height];
    path{j}=[pos(1) pos(2) pos(3)];
    j=j+1;
end

pos=[0 2 height];
path{j}=[pos(1) pos(2) pos(3)];
j=j+1;
n = j;

%---- Plot

for i=1:n-1
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
% for i=1:n-1
%     fprintf(fileID,'%s,%.10f,%.10f,%.10f,%.10f\n',Name,current,path{i}(1),path{i}(2),path{i}(3));
% end
% fclose(fileID);