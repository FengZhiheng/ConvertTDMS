%这个脚本的目的是为了看看一个avi文件里有多少张图片
aviPath = 'C:\Program Files\MATLAB\R2018b\examples\deeplearning_shared\caltech_cordova1.avi';


v = VideoReader(aviPath);
numOfFrames  = v.NumberOfFrames ;

%能读取某一帧吗？

%2019年12月19日11:31:24    郭颖给的这批avi文件，每个avi文件是8000张；


% currAxes = axes;
% while hasFrame(v)
%     vidFrame = readFrame(v);
%     image(vidFrame, 'Parent', currAxes);
%     currAxes.Visible = 'off';
%     pause(1/v.FrameRate);
% end