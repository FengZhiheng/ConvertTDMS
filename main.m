%% 这个脚本的目的是为了读取tdms里边的信息，然后利用里边的信息，把大tif文件解开
%2019年12月19日11:31:24    郭颖给的这批avi文件，每个avi文件是8000张；


%读取0_Cam-1_Info.tdms
% data = convertTDMS(0,'0_Cam-1_Info.tdms');

frameNumOfOneAvi = 8000;
outputPath = ['MiceVideo\'];
CamID = data.Data.MeasuredData(3).Data;%得到了ID，格式cell;
CamTime =  data.Data.MeasuredData(4).Data;%得到了ID，格式cell;

CamIDNum = size(CamID,1);
CamTimeNum = size(CamTime,1);



CamFileNameList = [];
if(CamIDNum == CamTimeNum)
    for i = 1:CamIDNum
        %do something
        newCamFileName = [CamID{i} CamTime{i} '.jpg'];
        CamFileNameList{end+1,1} = newCamFileName;
        disp(['newCamFileName is ' newCamFileName]);
    end
else
    disp(['num error']);
end


fatherPath = 'C:\Program Files\MATLAB\R2018b\examples\deeplearning_shared';%这个文件夹下边要放很多avi文件才行
aviFileNames = getAVIFilenameList(fatherPath);
numAviFiles = size(aviFileNames,2);
for i = 1:numAviFiles
    wholePathOfThisAVIFile = [fatherPath, '\' aviFileNames{i}];
    disp(wholePathOfThisAVIFile);
    tmpVideoReader = VideoReader(wholePathOfThisAVIFile);
    count = 1;
    while hasFrame(tmpVideoReader)
        vidFrame = readFrame(tmpVideoReader);
        Inxed = (i-1)*frameNumOfOneAvi + count;
        thisFrameName = CamFileNameList{Inxed};
%         imwrite(vidFrame,[outputPath filename]);
        disp([num2str(count) ' ' outputPath thisFrameName]);
        count = count + 1;
    end
end

% whichAviFile = floor(i/frameNumOfOneAvi)+1;
% whichFrameInThisAviFile = mod(i, frameNumOfOneAvi);
% wholePathOfThisAVIFile = [fatherPath, '\' aviFileNames{whichAviFile}];
% tmpVideoReader = VideoReader(wholePathOfThisAVIFile);
% newCamFrame = read(v, 10);

