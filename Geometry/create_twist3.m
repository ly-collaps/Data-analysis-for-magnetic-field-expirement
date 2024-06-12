clear all;
close all;

% Creating Twistet Geometry pattern two
% Creating parallel comparison geometry

% ---- Input in mm

length=150;
width=1;
height=1.6;

height_dom=50;
res_shift=0.1;

current=0.055;
Name='55mA_double_twist3';

% ---- compute 

pos=[-(length/2)+res_shift -(width/2)+res_shift (height_dom/2)+res_shift];
i=1;
path{i}=[pos(1) pos(2) pos(3)];

l_dir=1;
w_dir=1;
h_dir=1;

while pos(1)<=length/2
    path{i+1}=[pos(1)+1*width*l_dir pos(2)+1*width*w_dir pos(3)];
    path{i+2}=[pos(1)+1*width*l_dir pos(2)+1*width*w_dir pos(3)+height*h_dir];

    pos=[pos(1)+1*width*l_dir pos(2)+1*width*w_dir pos(3)+height*h_dir];

    i=i+2;
    w_dir=w_dir*-1;
    h_dir=h_dir*-1;
end

path{i+1}=[pos(1) pos(2)+width*w_dir pos(3)];
pos=[pos(1) pos(2)+width*w_dir pos(3)];

i=i+1;
w_dir=w_dir*-1;
l_dir=l_dir*-1;

while pos(1)>=-length/2
    path{i+1}=[pos(1)+1*width*l_dir pos(2)+1*width*w_dir pos(3)];
    path{i+2}=[pos(1)+1*width*l_dir pos(2)+1*width*w_dir pos(3)+height*h_dir];

    pos=[pos(1)+1*width*l_dir pos(2)+1*width*w_dir pos(3)+height*h_dir];

    i=i+2;
    w_dir=w_dir*-1;
    h_dir=h_dir*-1;
end

pos=[-(length/2)+res_shift -(width/2)+res_shift (height_dom/2)+res_shift];

path2{1}=[pos(1) pos(2) pos(3)];
path2{2}=[pos(1)+length pos(2) pos(3)];
path2{3}=[pos(1)+length pos(2)+width pos(3)];
path2{4}=[pos(1) pos(2)+width pos(3)];


% ---- Plot

% for i=1:size(path,2)
%     path_x(i)=path{i}(1);
%     path_y(i)=path{i}(2);
%     path_z(i)=path{i}(3);
% end
% % 
% figure()
% hold on
% for i=1:size(path,2)
%     plot3(path_x,path_y,path_z,'LineWidth',2,'Color','b')
% end
% grid on
% axis equal
% % view(30,25)
% % zoom(8)
% % zlim([24 28])
% 
% clear path_x path_y path_z
% 
% for i=1:size(path2,2)
%     path_x(i)=path2{i}(1);
%     path_y(i)=path2{i}(2);
%     path_z(i)=path2{i}(3);
% end

% figure()
% hold on
% for i=1:size(path2,2)
%     plot3(path_x,path_y,path_z,'LineWidth',2,'Color','b')
% end
% grid on
% axis equal
% view(30,25)
% zoom(8)
% zlim([24 28])

% ---- Export

fileName = append(Name,'_T','.txt');
fileID = fopen(fileName,'w');
for i=1:size(path,2)
    fprintf(fileID,'%s,%.10f,%.10f,%.10f,%.10f\n',Name,current,path{i}(1),path{i}(2),path{i}(3));
end
fclose(fileID);

% fileName = append(Name,'.txt');
% fileID = fopen(fileName,'w');
% for i=1:size(path2,2)
%     fprintf(fileID,'%s,%.10f,%.10f,%.10f,%.10f\n',Name,current,path2{i}(1),path2{i}(2),path2{i}(3));
% end
% fclose(fileID);