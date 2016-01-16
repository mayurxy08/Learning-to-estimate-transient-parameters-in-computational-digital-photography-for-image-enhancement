function varargout = auto_ui(varargin)
% AUTO_UI M-file for auto_ui.fig
%      AUTO_UI, by itself, creates a new AUTO_UI or raises the existing
%      singleton*.
%
%      H = AUTO_UI returns the handle to a new AUTO_UI or the handle to
%      the existing singleton*.
%
%      AUTO_UI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in AUTO_UI.M with the given input arguments.
%
%      AUTO_UI('Property','Value',...) creates a new AUTO_UI or raises
%      the existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before auto_ui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to auto_ui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help auto_ui

% Last Modified by GUIDE v2.5 22-May-2015 20:52:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @auto_ui_OpeningFcn, ...
                   'gui_OutputFcn',  @auto_ui_OutputFcn, ...
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

% --- Executes just before auto_ui is made visible.
function auto_ui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to auto_ui (see VARARGIN)

% Choose default command line output for auto_ui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

initialize_gui(hObject, handles, false);
clc
clear all

% UIWAIT makes auto_ui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = auto_ui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in calc.
function calc_Callback(hObject, eventdata, handles)
% hObject    handle to calc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
main

% --- Executes on button press in tap.
function tap_Callback(hObject, eventdata, handles)
% hObject    handle to tap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

initialize_gui(gcbf, handles, true);
display('Take a pic as this: with your choice of aperture and shutter speed')
display('snappic(Aper, shutter, address)')



% --- Executes on button press in startSeq.
function startSeq_Callback(hObject, eventdata, handles)
% hObject    handle to startSeq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
display('init_slr_mt')

% --- Executes when selected object changed in unitgroup.
function unitgroup_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in unitgroup 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    %set(handles.text6, 'String', 'kg');


% --------------------------------------------------------------------
function initialize_gui(fig_handle, handles, isreset)
% If the metricdata field is present and the tap flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to tap the data.

% Update handles structure
guidata(handles.figure1, handles);
