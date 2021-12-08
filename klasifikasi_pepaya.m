function varargout = klasifikasi_pepaya(varargin)
% KLASIFIKASI_PEPAYA MATLAB code for klasifikasi_pepaya.fig
%      KLASIFIKASI_PEPAYA, by itself, creates a new KLASIFIKASI_PEPAYA or raises the existing
%      singleton*.
%
%      H = KLASIFIKASI_PEPAYA returns the handle to a new KLASIFIKASI_PEPAYA or the handle to
%      the existing singleton*.
%
%      KLASIFIKASI_PEPAYA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in KLASIFIKASI_PEPAYA.M with the given input arguments.
%
%      KLASIFIKASI_PEPAYA('Property','Value',...) creates a new KLASIFIKASI_PEPAYA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before klasifikasi_pepaya_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to klasifikasi_pepaya_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help klasifikasi_pepaya

% Last Modified by GUIDE v2.5 15-Mar-2021 09:53:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @klasifikasi_pepaya_OpeningFcn, ...
                   'gui_OutputFcn',  @klasifikasi_pepaya_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before klasifikasi_pepaya is made visible.
function klasifikasi_pepaya_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to klasifikasi_pepaya (see VARARGIN)

% Choose default command line output for klasifikasi_pepaya
handles.output = hObject;
handles.output = hObject;
guidata(hObject, handles);
hback = axes('units','normalized','position',[0 0 1 1]);
uistack(hback,'bottom'); 
% menciptakan axes untuk tempat menampilkan gambar
% menampilkan background
[back map]=imread('background.jpg');
image(back)
colormap(map)
background=imread('background.jpg');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes klasifikasi_pepaya wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = klasifikasi_pepaya_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton9 akurasi.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load database_pepaya
total_case = handles.total_case;
ciri = zeros(1,6);
for i = 1:6
    ciri(i) = str2double(total_case{i,2});
end
[num,~] = size(database_pepaya);

dist = zeros(1,num);
for n = 1:num
    data_base = database_pepaya(n,:);
    accuracy = sum(data_base-ciri)/numel(data_base-ciri)*100
    dist(n) = accuracy;
    set(handles.edit2,'String',accuracy)
end
    
function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8 hasil klasifikasi.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load database_pepaya
total_case = handles.total_case;

ciri = zeros(1,6);
for i = 1:6
    ciri(i) = str2double(total_case{i,2});
end

[num,~] = size(database_pepaya);

dist = zeros(1,num);
for n = 1:num
    data_base = database_pepaya(n,:);
    jarak = sum((data_base-ciri).^2).^0.5;
    dist(n) = jarak;
end

[~,id] = min(dist);

if isempty(id)
    set(handles.edit1,'String','Unknown')
else
    switch id
        case 1
            tingkat = 'Pepaya Belum Matang';
        case 2
            tingkat = 'Pepaya Belum Matang';
        case 3
            tingkat = 'Pepaya Belum Matang';
        case 4
            tingkat = 'Pepaya Belum Matang';
        case 5
            tingkat = 'Pepaya Matang';
        case 6
            tingkat = 'Pepaya Matang';
        case 7
            tingkat = 'Pepaya Matang';
        case 8
            tingkat = 'Pepaya Matang';
    end
    set(handles.edit1,'String',tingkat)
end
          
function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Img_bw = handles.Img_bw;
axes(handles.axes4)
imshow(Img_bw)
title('Citra Biner');

stats = regionprops(Img_bw,'Area','Perimeter','Eccentricity');
area = stats.Area;
perimeter = stats.Perimeter;
metric = 4*pi*area/(perimeter^2);
eccentricity = stats.Eccentricity;

ciri_bentuk = cell(2,2);
ciri_bentuk{1,1} = 'Metric';
ciri_bentuk{2,1} = 'Eccentricity';
ciri_bentuk{1,2} = num2str(metric);
ciri_bentuk{2,2} = num2str(eccentricity);

handles.ciri_bentuk = ciri_bentuk;
guidata(hObject, handles)

%menampilkan ke tabel
set(handles.text2,'String','Ekstraksi GLCM')
set(handles.uitable2,'Data',ciri_bentuk,'RowName',1:2)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Img = handles.Img;
Img_bw = handles.Img_bw;
ciri_bentuk = handles.ciri_bentuk;

Img_gray = rgb2gray(Img);
Img_gray(~Img_bw) = 0;
axes(handles.axes5)
imshow(Img_gray)
title('Citra Grayscale(GLCM)')

pixel_dist = 1;
GLCM = graycomatrix(Img_gray,'Offset',[0 pixel_dist; -pixel_dist pixel_dist; -pixel_dist 0; -pixel_dist -pixel_dist]);
stats = graycoprops(GLCM,{'contrast','correlation','energy','homogeneity'});
Contrast = mean(stats.Contrast);
Correlation = mean(stats.Correlation);
Energy = mean(stats.Energy);
Homogeneity = mean(stats.Homogeneity);

%Pengecekan database
total_case = cell(6,2);
total_case{1,1} = ciri_bentuk{1,1};
total_case{1,2} = ciri_bentuk{1,2};
total_case{2,1} = ciri_bentuk{2,1};
total_case{2,2} = ciri_bentuk{2,2};
total_case{3,1} = 'Contrast';
total_case{4,1} = 'Correlation';
total_case{5,1} = 'Energy';
total_case{6,1} = 'Homogeneity';
total_case{3,2} = num2str(Contrast);
total_case{4,2} = num2str(Correlation);
total_case{5,2} = num2str(Energy);
total_case{6,2} = num2str(Homogeneity);

handles.total_case = total_case;
guidata(hObject, handles)

set(handles.text2,'String','Ekstraksi GLCM')
set(handles.uitable2,'Data',total_case,'RowName',1:6)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Img = handles.Img;

cform = makecform('srgb2lab');
lab = applycform(Img,cform);
axes(handles.axes2)
imshow(lab)
title('Tranformasi citra');

handles.lab = lab;
guidata(hObject, handles)

% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Img = handles.Img;
lab = handles.lab;

ab = double(lab(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);

nColors = 2;
[cluster_idx, ~] = kmeans(ab,nColors,'distance','sqEuclidean',...
    'Replicates',3);
pixel_labels = reshape(cluster_idx,nrows,ncols);

segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);

for k = 1:nColors
    color = Img;
    color(rgb_label ~= k) = 0;
    segmented_images{k} = color;
end

area_cluster1 = sum(find(pixel_labels==1));
    area_cluster2 = sum(find(pixel_labels==2));
    [~,cluster_min] = min([area_cluster1,area_cluster2]);
    Img_bw = (pixel_labels==cluster_min);
    Img_bw = imfill(Img_bw,'holes');
    img_bw = bwareaopen(Img_bw,50);

pepaya = Img;
R = pepaya(:,:,1);
G = pepaya(:,:,2);
B = pepaya(:,:,3);
R(~Img_bw) = 0;
G(~Img_bw) = 0;
B(~Img_bw) = 0;
pepaya_rgb = cat(3,R,G,B);
axes(handles.axes3)
imshow(pepaya_rgb)
title('Citra Hasil Segmentasi');

handles.Img_bw = Img_bw;
guidata(hObject, handles)
    

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])

axes(handles.axes2)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])

axes(handles.axes3)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])

axes(handles.axes4)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])

axes(handles.axes5)
cla reset
set(gca,'XTick',[])
set(gca,'YTick',[])

% set(handles.text1,'String',[])
% set(handles.uitable1,'Data',[])
set(handles.edit1,'String',[])
set(handles.edit2,'String',[])


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile('*jpg','*png');
if ~isequal(filename,0)
    Img = imread(fullfile(pathname,filename));
    axes(handles.axes1)
    imshow(Img)
    title('Citra Pepaya RGB')
else
    return
end
handles.Img = Img;
guidata(hObject, handles)
    
