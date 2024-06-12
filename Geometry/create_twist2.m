clear all;
close all; 

% Creating Twistet Geometry pattern one

% ---- Input in mm

length=150;
width=1;
height=1.6;

current=0.015;
Name='15mA_double_twist2';

% ---- compute 

pos=[-length/2 -width/2 0];
i=1;
path{i}=[pos(1) pos(2) pos(3)];

l_dir=1;
w_dir=1;
h_dir=1;

while i<=(length*2)
    path{i+1}=[pos(1)+1*(width/2)*l_dir pos(2)+1*(width/2)*w_dir pos(3)];
    path{i+2}=[pos(1)+3*(width/2)*l_dir pos(2)+1*(width/2)*w_dir pos(3)];
    path{i+3}=[pos(1)+4*(width/2)*l_dir pos(2)+2*(width/2)*w_dir pos(3)];

    path{i+4}=[pos(1)+4*(width/2)*l_dir pos(2)+2*(width/2)*w_dir pos(3)+height*h_dir];

    pos=[pos(1)+4*(width/2)*l_dir pos(2)+2*(width/2)*w_dir pos(3)+height*h_dir];
    i=i+4;
    w_dir=w_dir*-1;
    h_dir=h_dir*-1;
end

path{i+1}=[pos(1) pos(2)+width*w_dir pos(3)];
pos=[pos(1) pos(2)+width*w_dir pos(3)];

i=i+1;

w_dir=w_dir*-1;
l_dir=l_dir*-1;

while i<=(length*4)
    path{i+1}=[pos(1)+1*(width/2)*l_dir pos(2)+1*(width/2)*w_dir pos(3)];
    path{i+2}=[pos(1)+3*(width/2)*l_dir pos(2)+1*(width/2)*w_dir pos(3)];
    path{i+3}=[pos(1)+4*(width/2)*l_dir pos(2)+2*(width/2)*w_dir pos(3)];

    path{i+4}=[pos(1)+4*(width/2)*l_dir pos(2)+2*(width/2)*w_dir pos(3)+height*h_dir];

    pos=[pos(1)+4*(width/2)*l_dir pos(2)+2*(width/2)*w_dir pos(3)+height*h_dir];
    i=i+4;
    w_dir=w_dir*-1;
    h_dir=h_dir*-1;
end

pos=[-length/2 -width/2 0];

path2{1}=[pos(1) pos(2) pos(3)];
path2{2}=[pos(1)+length pos(2) pos(3)];
path2{3}=[pos(1)+length pos(2)+width pos(3)];
path2{4}=[pos(1) pos(2)+width pos(3)];


% ---- Plot

for i=1:(length*4)-1
    path_x(i)=path{i}(1);
    path_y(i)=path{i}(2);
    path_z(i)=path{i}(3);
end
figure()
hold on
for i=1:(length*4)-1
    plot3(path_x,path_y,path_z)
end
grid on
axis equal

% ---- Export
% 
% fileName = append(Name,'_T','.txt');
% fileID = fopen(fileName,'w');
% for i=1:(length*4)
%     fprintf(fileID,'%s,%.10f,%.10f,%.10f,%.10f\n',Name,current,path{i}(1),path{i}(2),path{i}(3));
% end
% fclose(fileID);
% 
% fileName = append(Name,'.txt');
% fileID = fopen(fileName,'w');
% for i=1:4
%     fprintf(fileID,'%s,%.10f,%.10f,%.10f,%.10f\n',Name,current,path2{i}(1),path2{i}(2),path2{i}(3));
% end
% fclose(fileID);
