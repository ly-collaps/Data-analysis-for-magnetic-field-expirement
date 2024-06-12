clear all;
close all; 

% Creating a twisted geometry

% ---- Input in mm

length=500;
width=1;       %keep const among geoms
height=1.6;    %pcb defined
height_dom=50;
res_shift=0.1;

current=0.035;
Name='35mA_double_twist4';
Name2='35mA_double_twist4_second';

% ---- compute 

%First wire
pos=[-(length/2)+res_shift -(width/2)+res_shift (height_dom/2)+res_shift];
i=1;
path{i}=[pos(1) pos(2) pos(3)];

l_dir=1;
w_dir=1;
h_dir=1;

while pos(1)<=length/2
    path{i+1}=[pos(1)+1*(width/2)*l_dir pos(2) pos(3)];
    path{i+2}=[pos(1)+2*(width/2)*l_dir pos(2)+1*(width/2)*w_dir pos(3)];
    path{i+3}=[pos(1)+3*(width/2)*l_dir pos(2)+1*(width/2)*w_dir pos(3)];

    path{i+4}=[pos(1)+3*(width/2)*l_dir pos(2)+1*(width/2)*w_dir pos(3)+height*h_dir];

    pos=[pos(1)+3*(width/2)*l_dir pos(2)+1*(width/2)*w_dir pos(3)+height*h_dir];
    i=i+4;
    w_dir=w_dir*-1;
    h_dir=h_dir*-1;
end

n = i;

%Second wire
i = 1;
pos=[-(length/2)+res_shift -(width/2)+res_shift+1*(width/2) (height_dom/2)+res_shift+height];
path2{i}=[pos(1) pos(2) pos(3)];
w_dir=w_dir*-1;
h_dir=h_dir*-1;

while pos(1)<=length/2
    path2{i+1}=[pos(1)+1*(width/2)*l_dir pos(2) pos(3)];
    path2{i+2}=[pos(1)+2*(width/2)*l_dir pos(2)+1*(width/2)*w_dir pos(3)];
    path2{i+3}=[pos(1)+3*(width/2)*l_dir pos(2)+1*(width/2)*w_dir pos(3)];

    path2{i+4}=[pos(1)+3*(width/2)*l_dir pos(2)+1*(width/2)*w_dir pos(3)+height*h_dir];

    pos=[pos(1)+3*(width/2)*l_dir pos(2)+1*(width/2)*w_dir pos(3)+height*h_dir];
    i=i+4;
    w_dir=w_dir*-1;
    h_dir=h_dir*-1;
end



% ---- Plot
for i=1:size(path,2)
    path_x(i)=path{i}(1);
    path_y(i)=path{i}(2);
    path_z(i)=path{i}(3);
end
figure()

hold on
for i=1:size(path,2)
    plot3(path_x,path_y,path_z,'LineWidth',2,'Color','b')
end
grid on
axis equal

clear path_x path_y path_z

for i=1:size(path2,2)
    path_x(i)=path2{i}(1);
    path_y(i)=path2{i}(2);
    path_z(i)=path2{i}(3);
end

hold on
for i=1:size(path2,2)
    plot3(path_x,path_y,path_z,'LineWidth',2,'Color','g')
end
grid on
axis equal


% ---- Export
% 
% fileName = append(Name,'.txt');
% fileID = fopen(fileName,'w');
% for i=1:n
%     fprintf(fileID,'%s,%.10f,%.10f,%.10f,%.10f\n',Name,current,path{i}(1),path{i}(2),path{i}(3));
%     %fprintf(fileID,'%s,%.10f,%.10f,%.10f,%.10f\n',Name,current,path2{i}(1),path2{i}(2),path2{i}(3));
% end
% for i=n:-1:1
%     fprintf(fileID,'%s,%.10f,%.10f,%.10f,%.10f\n',Name2,current,path2{i}(1),path2{i}(2),path2{i}(3));
% end
% fclose(fileID);

% fileName = append(Name,'.txt');
% fileID = fopen(fileName,'w');
% for i=1:n
%     fprintf(fileID,'%s,%.10f,%.10f,%.10f,%.10f\n',Name,current,path2{i}(1),path2{i}(2),path2{i}(3));
% end
% fclose(fileID);