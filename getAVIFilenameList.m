%% 这个脚本的目的是获取指定文件夹下avi文件名list
function result = getAVIFilenameList(fatherPath)
aviDir = dir([fatherPath '\*.avi']);
aviCell = struct2cell(aviDir);
aviFileNames = aviCell(1,:);
aviFileNamesSort = sort_nat(aviFileNames);
result = aviFileNamesSort;
% num = length(aviFileNamesSort);
% for i =1:num
%     oldname = [cellFilePath,filename{i}];
%     newname = [cellFilePath,num2str(i,'%04d'),'.tif'];
%     movefile(oldname,newname);
%     waitbar(i/num,h,[num2str(i/num*100,'%0.2f'),'%']);
% end
return