%����ű���Ŀ����Ϊ�˿���һ��avi�ļ����ж�����ͼƬ
aviPath = 'C:\Program Files\MATLAB\R2018b\examples\deeplearning_shared\caltech_cordova1.avi';


v = VideoReader(aviPath);
numOfFrames  = v.NumberOfFrames ;

%�ܶ�ȡĳһ֡��

%2019��12��19��11:31:24    ��ӱ��������avi�ļ���ÿ��avi�ļ���8000�ţ�


% currAxes = axes;
% while hasFrame(v)
%     vidFrame = readFrame(v);
%     image(vidFrame, 'Parent', currAxes);
%     currAxes.Visible = 'off';
%     pause(1/v.FrameRate);
% end