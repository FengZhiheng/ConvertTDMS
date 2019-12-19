%% ����ű���Ŀ����Ϊ�˶�ȡtdms��ߵ���Ϣ��Ȼ��������ߵ���Ϣ���Ѵ�tif�ļ��⿪
%2019��12��19��11:31:24    ��ӱ��������avi�ļ���ÿ��avi�ļ���8000�ţ�


%��ȡ0_Cam-1_Info.tdms
% data = convertTDMS(0,'0_Cam-1_Info.tdms');

frameNumOfOneAvi = 8000;
outputPath = ['MiceVideo\'];
CamID = data.Data.MeasuredData(3).Data;%�õ���ID����ʽcell;
CamTime =  data.Data.MeasuredData(4).Data;%�õ���ID����ʽcell;

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


fatherPath = 'C:\Program Files\MATLAB\R2018b\examples\deeplearning_shared';%����ļ����±�Ҫ�źܶ�avi�ļ�����
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

