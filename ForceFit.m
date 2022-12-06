function varargout = ForceFit(varargin)
% FORCEFIT MATLAB code for ForceFit.fig
%      FORCEFIT, by itself, creates a new FORCEFIT or raises the existing
%      singleton*.
%
%      H = FORCEFIT returns the handle to a new FORCEFIT or the handle to
%      the existing singleton*.
%
%      FORCEFIT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORCEFIT.M with the given input arguments.
%
%      FORCEFIT('Property','Value',...) creates a new FORCEFIT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ForceFit_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ForceFit_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ForceFit

% Last Modified by GUIDE v2.5 02-Apr-2020 18:33:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ForceFit_OpeningFcn, ...
                   'gui_OutputFcn',  @ForceFit_OutputFcn, ...
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


% --- Executes just before ForceFit is made visible.
function ForceFit_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ForceFit (see VARARGIN)

% Choose default command line output for ForceFit
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ForceFit wait for user response (see UIRESUME)
% uiwait(handles.figure_main);
handles = init(handles) ;
initiate(handles);

% --- Outputs from this function are returned to the command line.
function varargout = ForceFit_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function load_force_definition_Callback(hObject, eventdata, handles)
% hObject    handle to load_force_definition (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radio_manual.
function radio_manual_Callback(hObject, eventdata, handles)
% hObject    handle to radio_manual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio_manual


% --- Executes on button press in radio_auto.
function radio_auto_Callback(hObject, eventdata, handles)
% hObject    handle to radio_auto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radio_auto


% --- Executes on button press in manual_radio_sigma.
function manual_radio_sigma_Callback(hObject, eventdata, handles)
% hObject    handle to manual_radio_sigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of manual_radio_sigma


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on button press in checkbox_auto.
function checkbox_auto_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_auto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_auto
grp_idx = handles.selected_group ;
model = handles.groups(grp_idx).active_fit ;
handles.groups(grp_idx).fits.(model).active.a = eventdata.Source.Value ;

handles = update_gui(handles) ;
guidata(handles.figure_main, handles) ;

% --- Executes on button press in manual_checkbox.
function manual_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to manual_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of manual_checkbox
grp_idx = handles.selected_group ;
model = handles.groups(grp_idx).active_fit ;
handles.groups(grp_idx).fits.(model).active.m = eventdata.Source.Value ;

handles = update_gui(handles) ;
guidata(handles.figure_main, handles) ;

% --- Executes on button press in pushbutton_copy_auto2man.
function pushbutton_copy_auto2man_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_copy_auto2man (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
grp_idx = handles.selected_group ;
model = handles.groups(grp_idx).active_fit ;
handles.groups(grp_idx).fits.(model) = handles.groups(grp_idx).fits.(model).copy_fp_a2m() ;
handles.groups(grp_idx).fits.(model).active.m = 1 ;
handles.groups(grp_idx).fits.(model).active.a = 0 ;

handles = update_gui(handles) ;
guidata(handles.figure_main, handles) ;



% --- Executes on button press in plot_options_zero.
function plot_options_zero_Callback(hObject, eventdata, handles)
% hObject    handle to plot_options_zero (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of plot_options_zero
handles = update_gui(handles) ;
guidata(handles.figure_main, handles) ;

% --- Executes on button press in plot_options_plot_fx.
function plot_options_plot_fx_Callback(hObject, eventdata, handles)
% hObject    handle to plot_options_plot_fx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of plot_options_plot_fx



function fx_Callback(hObject, eventdata, handles)
% hObject    handle to fx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fx as text
%        str2double(get(hObject,'String')) returns contents of fx as a double


% --- Executes during object creation, after setting all properties.
function fx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ax_lim_xmin_checkbox.
function ax_lim_xmin_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to ax_lim_xmin_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ax_lim_xmin_checkbox


% --- Executes on button press in ax_lim_xmax_checkbox.
function ax_lim_xmax_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to ax_lim_xmax_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ax_lim_xmax_checkbox


% --- Executes on button press in ax_lim_ymin_checkbox.
function ax_lim_ymin_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to ax_lim_ymin_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ax_lim_ymin_checkbox


% --- Executes on button press in ax_lim_ymax_checkbox.
function ax_lim_ymax_checkbox_Callback(hObject, eventdata, handles)
% hObject    handle to ax_lim_ymax_checkbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of ax_lim_ymax_checkbox



function xmin_val_Callback(hObject, eventdata, handles)
% hObject    handle to xmin_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xmin_val as text
%        str2double(get(hObject,'String')) returns contents of xmin_val as a double
newval = str2double(handles.xmin_val.String) ;
yscale = get_yscale(handles) ;

if isnan(newval)
    handles.xmin_val.String = num2str(handles.axes_lims.(yscale).x(1)) ;
    return
end

handles.axes_lims.(yscale).x(1) = newval ;
plot_groups(handles)
guidata(handles.figure_main, handles) ;



% --- Executes during object creation, after setting all properties.
function xmin_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xmin_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xmax_val_Callback(hObject, eventdata, handles)
% hObject    handle to xmax_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xmax_val as text
%        str2double(get(hObject,'String')) returns contents of xmax_val as a double
newval = str2double(handles.xmax_val.String) ;
yscale = get_yscale(handles) ;

if isnan(newval)
    handles.xmax_val.String = num2str(handles.axes_lims.(yscale).x(2)) ;
    return
end

handles.axes_lims.(yscale).x(2) = newval ;
plot_groups(handles)
guidata(handles.figure_main, handles) ;


% --- Executes during object creation, after setting all properties.
function xmax_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xmax_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ymin_val_Callback(hObject, eventdata, handles)
% hObject    handle to ymin_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ymin_val as text
%        str2double(get(hObject,'String')) returns contents of ymin_val as a double
newval = str2double(handles.ymin_val.String) ;
yscale = get_yscale(handles) ;

if isnan(newval)
    handles.ymin_val.String = num2str(handles.axes_lims.(yscale).y(1)) ;
    return
end

handles.axes_lims.(yscale).y(1) = newval ;
plot_groups(handles)
guidata(handles.figure_main, handles) ;


% --- Executes during object creation, after setting all properties.
function ymin_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ymin_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ymax_val_Callback(hObject, eventdata, handles)
% hObject    handle to ymax_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ymax_val as text
%        str2double(get(hObject,'String')) returns contents of ymax_val as a double
newval = str2double(handles.ymax_val.String) ;
yscale = get_yscale(handles) ;

if isnan(newval)
    handles.ymax_val.String = num2str(handles.axes_lims.(yscale).y(2)) ;
    return
end

handles.axes_lims.(yscale).y(2) = newval ;
plot_groups(handles)
guidata(handles.figure_main, handles) ;


% --- Executes during object creation, after setting all properties.
function ymax_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ymax_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function load_force_group_Callback(hObject, eventdata, handles)
% hObject    handle to load_force_group (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file_name, path_name] = uigetfile('*.fgrp', 'Load Force Groups');

full_path = strcat(path_name, file_name);

if isempty(full_path)
    return
end

wait_bar = waitbar(0,'Loading...'); 
load(full_path, '-mat');
delete(wait_bar)

[file_name, path_name] = uigetfile('*.gprop', 'Load Properties');

full_path = strcat(path_name, file_name);

isprop = false ;
if ~isempty(full_path)
    isprop = true ;
    load(full_path, '-mat');
end

if isprop
    prop_fields = fieldnames(prop_struct) ;
end

handles.groups = struct ;

if isprop
    for i = 1:length(prop_struct)
        fgrp_idx = prop_struct(i).fgrp_idx ;
        handles.groups(i).name = groups_struct(fgrp_idx).obj.name ;
        handles.groups(i).sep_old = groups_struct(fgrp_idx).obj.sep_app*1e9 ;
        handles.groups(i).sep = groups_struct(fgrp_idx).obj.sep_app*1e9*handles.sep_rsf ;
        handles.groups(i).force = groups_struct(fgrp_idx).movemean.force_app*1e9 ;
        
        for j = 1:length(prop_fields)
            if strcmp(prop_fields{j}, 'fgrp_idx')
                continue
            end
            handles.groups(i).(prop_fields{j}) = prop_struct(i).(prop_fields{j}) ;
        end
        
        handles.groups(i).fits.DLVO = DLVO(handles, i) ;
        handles.groups(i).fits.DLVO_OSM = DLVO_OSM(handles, i) ;
        handles.groups(i).fits.CR_DLVO = CR_DLVO(handles, i) ;
        handles.groups(i).fits.DLVO_expAtr = DLVO_expAtr(handles, i) ;
        handles.groups(i).fits.Sep_DLVO = Sep_DLVO(handles, i) ;
        handles.groups(i).fits.Const_p_Linear = Const_p_Linear(handles, i) ;
        handles.groups(i).fits.Const_p_Exact = Const_p_Exact(handles, i) ;
        handles.groups(i).active_fit = 'Const_p_Exact' ;
        
        handles.groups(i).offset = 0 ;
        handles.groups(i).comments = [] ;
    end
else
    for i = 1:length(groups_struct)
        fgrp_idx = i ;
        handles.groups(i).name = groups_struct(fgrp_idx).obj.name ;
        handles.groups(i).sep_old = groups_struct(fgrp_idx).obj.sep_app*1e9 ;
        handles.groups(i).sep = groups_struct(fgrp_idx).obj.sep_app*1e9*handles.sep_rsf ;
        handles.groups(i).force = groups_struct(fgrp_idx).movemean.force_app*1e9 ;
        
        handles.groups(i).fits.DLVO = DLVO(handles, i) ;
        handles.groups(i).fits.DLVO_OSM = DLVO_OSM(handles, i) ;
        handles.groups(i).fits.CR_DLVO = CR_DLVO(handles, i) ;
        handles.groups(i).fits.DLVO_expAtr = DLVO_expAtr(handles, i) ;
        handles.groups(i).fits.Const_p_Linear = Const_p_Linear(handles, i) ;
        handles.groups(i).fits.Const_p_Exact = Const_p_Exact(handles, i) ;
        handles.groups(i).active_fit = 'Const_p_Exact' ;
        
        handles.groups(i).offset = 0 ;
        handles.groups(i).comments = [] ;
    end
end

guidata(handles.figure_main, handles) ;
write_group_table(handles)

% --------------------------------------------------------------------
function save_forcefit_Callback(hObject, eventdata, handles)
% hObject    handle to save_forcefit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[FileName,PathName] = uiputfile('*.ffit', 'Save ForceFit') ;

if ~PathName
    return ;
end

FF_struct.groups = handles.groups ;
FF_struct.sep_rsf = handles.sep_rsf ;
save(strcat(PathName, FileName), 'FF_struct', '-v7.3') ;


function comments_text_Callback(hObject, eventdata, handles)
% hObject    handle to comments_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of comments_text as text
%        str2double(get(hObject,'String')) returns contents of comments_text as a double
return



% --- Executes during object creation, after setting all properties.
function comments_text_CreateFcn(hObject, eventdata, handles)
% hObject    handle to comments_text (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected cell(s) is changed in table_groups.
function table_groups_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to table_groups (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)
if isempty(eventdata.Indices)
    return
end
handles.selected_group = unique(eventdata.Indices(1,1)) ;

handles = update_gui(handles) ;
guidata(handles.figure_main, handles) ;



% --- Executes when selected object is changed in uibutton_yscale.
function uibutton_yscale_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibutton_yscale 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if strcmp(eventdata.NewValue.String, 'Linear')
    handles.axes_main.XScale = 'linear' ;
    handles.axes_main.YScale = 'linear' ;
end

if strcmp(eventdata.NewValue.String, 'Semilog') || strcmp(eventdata.NewValue.String, 'Semilog Abs')
    handles.axes_main.XScale = 'linear' ;
    handles.axes_main.YScale = 'log' ;
end

if strcmp(eventdata.NewValue.String, 'LogLog (abs)')
    handles.axes_main.XScale = 'log' ;
    handles.axes_main.YScale = 'log' ;
end

handles = update_gui(handles) ;
guidata(handles.figure_main, handles) ;


% --- Executes when entered data in editable cell(s) in table_groups.
function table_groups_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to table_groups (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
if eventdata.Indices(2) == 3
    if isnan(eventdata.NewData)
        handles.table_groups.Data{eventdata.Indices(1), eventdata.Indices(2)} = eventdata.PreviousData ;
    else
        handles.groups(eventdata.Indices(1)).offset = eventdata.NewData ;
        plot_groups(handles)
    end
end

if eventdata.Indices(2) == 2
    grp_idx = eventdata.Indices(1, 1) ;
    cell_val = handles.table_groups.Data{eventdata.Indices(1), eventdata.Indices(2)} ;
    
    if isempty(cell_val)
        handles.groups(grp_idx).active_fit = '' ;
    end
    
    if strcmp(cell_val, 'DLVO' )
        handles.groups(grp_idx).active_fit = 'DLVO' ;
    end
    
    if strcmp(cell_val, 'DLVO+expAtr' )
        handles.groups(grp_idx).active_fit = 'DLVO_expAtr' ;
    end
    
    if strcmp(cell_val, 'Sep. DLVO')
        handles.groups(grp_idx).active_fit = 'Sep_DLVO' ;
    end
    
    if strcmp(cell_val, 'DLVO_OSM')
        handles.groups(grp_idx).active_fit = 'DLVO_OSM' ;
    end
end

handles = update_gui(handles) ;
guidata(handles.figure_main, handles) ;


% --- Executes when entered data in editable cell(s) in table_prop.
function table_prop_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to table_prop (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
if ~(eventdata.Indices(2) == 2)
    return
end

if isnan(eventdata.NewData)
    handles.table_prop.Data{eventdata.Indices(1), eventdata.Indices(2)} = eventdata.PreviousData ;
else
    grp_idx = handles.selected_group ;
    model = handles.groups(grp_idx).active_fit ;
    
    pr_fields = fieldnames(handles.groups(grp_idx).fits.(model).pr) ;
    handles.groups(grp_idx).fits.(model).pr.(pr_fields{eventdata.Indices(1)}).val = eventdata.NewData ;
    handles.groups(grp_idx).fits.(model) = handles.groups(grp_idx).fits.(model).cal_p() ;
    handles = update_gui(handles) ;
    guidata(handles.figure_main, handles) ;
end


% --- Executes when entered data in editable cell(s) in table_manual_fp.
function table_manual_fp_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to table_manual_fp (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
if ~(eventdata.Indices(2) == 2)
    return
end
if isnan(eventdata.NewData)
    handles.table_prop.Data{eventdata.Indices(1), eventdata.Indices(2)} = eventdata.PreviousData ;
    return
end
grp_idx = handles.selected_group ;
pidx = eventdata.Indices(1) ;
model = handles.groups(grp_idx).active_fit ;
handles.groups(grp_idx).fits.(model).fp.(handles.tf.man_fp{pidx}).mval = eventdata.NewData ;
handles.groups(grp_idx).fits.(model) = handles.groups(grp_idx).fits.(model).cal_p() ;
handles.groups(grp_idx).fits.(model).active.m = 1 ;
handles = update_gui(handles) ;
guidata(handles.figure_main, handles) ;


% --- Executes when entered data in editable cell(s) in table_fbnd.
function table_fbnd_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to table_fbnd (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
if ~(eventdata.Indices(2) == 2)
    return
end

if isnan(eventdata.NewData)
    handles.table_fbnd.Data{eventdata.Indices(1), eventdata.Indices(2)} = eventdata.PreviousData ;
    return
end

pidx = eventdata.Indices(1) ;
grp_idx = handles.selected_group ;
model = handles.groups(grp_idx).active_fit ;
handles.groups(grp_idx).fits.(model).fbnd.(handles.tf.fbnd{pidx}).val = eventdata.NewData ;

handles = update_gui(handles) ;
guidata(handles.figure_main, handles) ;


% --------------------------------------------------------------------
function load_forcefit_Callback(hObject, eventdata, handles)
% hObject    handle to load_forcefit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file_name, path_name] = uigetfile('*.ffit', 'Load ForceFit File');

full_path = strcat(path_name, file_name);

if isempty(full_path)
    return
end

wait_bar = waitbar(0,'Loading...'); 
load(full_path, '-mat');
handles.groups = FF_struct.groups ;

handles.sep_rsf = FF_struct.sep_rsf ;
set(handles.sep_scaling_factor_textbox,'String', handles.sep_rsf) ;

delete(wait_bar)
write_group_table(handles) ;
guidata(handles.figure_main, handles) ;


% --- Executes on button press in pushbutton_copy_m2a_guess.
function pushbutton_copy_m2a_guess_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_copy_m2a_guess (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
grp_idx = handles.selected_group ;
model = handles.groups(grp_idx).active_fit ;
handles.groups(grp_idx).fits.(model) = handles.groups(grp_idx).fits.(model).copy_fp_m2a_guess() ;
handles.groups(grp_idx).fits.(model).active.m = 0 ;
handles.groups(grp_idx).fits.(model).active.a = 1 ;

handles = update_gui(handles) ;
guidata(handles.figure_main, handles) ;


% --- Executes when entered data in editable cell(s) in table_auto_fp.
function table_auto_fp_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to table_auto_fp (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
if isnan(eventdata.NewData)
    handles.table_prop.Data{eventdata.Indices(1), eventdata.Indices(2)} = eventdata.PreviousData ;
    return
end

grp_idx = handles.selected_group ;
pidx = eventdata.Indices(1) ;
model = handles.groups(grp_idx).active_fit ;

[~, a_column_guess] = ismember('Guess', handles.table_auto_fp.ColumnName);
[~, a_column_min] = ismember('Min', handles.table_auto_fp.ColumnName);
[~, a_column_max] = ismember('Max', handles.table_auto_fp.ColumnName);

switch eventdata.Indices(2)
    case a_column_guess
        handles.groups(grp_idx).fits.(model).fp.(handles.tf.auto_fp{pidx}).aval_guess = eventdata.NewData ;
    case a_column_min
        handles.groups(grp_idx).fits.(model).fp.(handles.tf.auto_fp{pidx}).aval_min = eventdata.NewData ;
    case a_column_max
        handles.groups(grp_idx).fits.(model).fp.(handles.tf.auto_fp{pidx}).aval_max = eventdata.NewData ;
end

handles = update_gui(handles) ;
guidata(handles.figure_main, handles) ;


% --- Executes on selection change in listbox_functions.
function listbox_functions_Callback(hObject, eventdata, handles)
% hObject    handle to listbox_functions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox_functions contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox_functions
if strcmp(get(handles.figure_main,'SelectionType'),'open')
end

% --- Executes during object creation, after setting all properties.
function listbox_functions_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox_functions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_fit.
function pushbutton_fit_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_fit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

grp_idx = handles.selected_group ;
if isempty(grp_idx)
    return ;
end

model = handles.groups(grp_idx).active_fit ;
handles.groups(grp_idx).fits.(model) = handles.groups(grp_idx).fits.(model).fit(handles) ;
handles.groups(grp_idx).fits.(model).active.a = 1 ;

handles = update_gui(handles) ;
guidata(handles.figure_main, handles) ;


% --- Executes on button press in pushbutton_fitbnd_cross.
function pushbutton_fitbnd_cross_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_fitbnd_cross (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

grp_idx = handles.selected_group ;
if isempty(grp_idx)
    return ;
end

model = handles.groups(grp_idx).active_fit ;

fields = fieldnames(handles.groups(grp_idx).fits.(model).fbnd) ;

[x, ~] = ginput(length(fields)) ;
x = sort(x) ;
for i = 1:length(fields)
    handles.groups(grp_idx).fits.(model).fbnd.(fields{i}).val = x(i) ;
end

handles = update_gui(handles) ;
guidata(handles.figure_main, handles) ;

% --- Executes on button press in Min_fBnd.
function Min_fBnd_Callback(hObject, eventdata, handles)
% hObject    handle to Min_fBnd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
grp_idx = handles.selected_group ;
if isempty(grp_idx)
    return ;
end

model = handles.groups(grp_idx).active_fit ;

fields = fieldnames(handles.groups(grp_idx).fits.(model).fbnd) ;

[x, ~] = ginput(1) ;
handles.groups(grp_idx).fits.(model).fbnd.(fields{1}).val = x ;

handles = update_gui(handles) ;
guidata(handles.figure_main, handles) ;

% --- Executes on button press in Max_fBnd.
function Max_fBnd_Callback(hObject, eventdata, handles)
% hObject    handle to Max_fBnd (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
grp_idx = handles.selected_group ;
if isempty(grp_idx)
    return ;
end

model = handles.groups(grp_idx).active_fit ;

fields = fieldnames(handles.groups(grp_idx).fits.(model).fbnd) ;

[x, ~] = ginput(1) ;
handles.groups(grp_idx).fits.(model).fbnd.(fields{2}).val = x ;

handles = update_gui(handles) ;
guidata(handles.figure_main, handles) ;


% --- Executes on button press in checkbox_fitbnd_plot.
function checkbox_fitbnd_plot_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_fitbnd_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_fitbnd_plot
handles = update_gui(handles) ;
guidata(handles.figure_main, handles) ;


% --- Executes on selection change in listbox4.
function listbox4_Callback(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox4


% --- Executes during object creation, after setting all properties.
function listbox4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when entered data in editable cell(s) in table_fit2plot.
function table_fit2plot_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to table_fit2plot (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
grp_idx = handles.selected_group ;
model = handles.groups(grp_idx).active_fit ;
cidx = eventdata.Indices(1) ;

switch eventdata.Indices(2)
    case 2
        if strcmp(eventdata.NewData, 'Yes')
            handles.groups(grp_idx).fits.(model).fit_curves(cidx).disp = 1 ;
        else
            handles.groups(grp_idx).fits.(model).fit_curves(cidx).disp = 0 ;
        end
    case 3
        handles.groups(grp_idx).fits.(model).fit_curves(cidx).line = eventdata.NewData ;
    otherwise
        return ;
end

handles = update_gui(handles) ;
guidata(handles.figure_main, handles) ;


% --- Executes on button press in yscale_radio_linear.
function yscale_radio_linear_Callback(hObject, eventdata, handles)
% hObject    handle to yscale_radio_linear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of yscale_radio_linear
handles = update_axlim_txtbx(handles) ;
guidata(handles.figure_main, handles) ;


% --- Executes on button press in yscale_radio_semilog.
function yscale_radio_semilog_Callback(hObject, eventdata, handles)
% hObject    handle to yscale_radio_semilog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of yscale_radio_semilog
handles = update_axlim_txtbx(handles) ;
guidata(handles.figure_main, handles) ;


% --- Executes on button press in yscale_semilog_abs.
function yscale_semilog_abs_Callback(hObject, eventdata, handles)
% hObject    handle to yscale_semilog_abs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of yscale_semilog_abs
handles = update_axlim_txtbx(handles) ;
guidata(handles.figure_main, handles) ;


% --- Executes on button press in yscale_loglog.
function yscale_loglog_Callback(hObject, eventdata, handles)
% hObject    handle to yscale_loglog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of yscale_loglog
handles = update_axlim_txtbx(handles) ;
guidata(handles.figure_main, handles) ;



function sep_scaling_factor_textbox_Callback(hObject, eventdata, handles)
% hObject    handle to sep_scaling_factor_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sep_scaling_factor_textbox as text
%        str2double(get(hObject,'String')) returns contents of sep_scaling_factor_textbox as a double
new_value = str2double(get(hObject,'String')) ;
if new_value
    handles.sep_rsf = new_value ;
    handles = sep_rescale(handles) ;
else
    set(hObject,'String', handles.sep_rsf) ;
end
handles = update_gui(handles) ;
guidata(handles.figure_main, handles) ;


% --- Executes during object creation, after setting all properties.
function sep_scaling_factor_textbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sep_scaling_factor_textbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when user attempts to close figure_main.
function figure_main_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure_main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
answer = questdlg('Are you sure you want to close ForceFit?', 'Exit Query', 'Yes', 'No!', 'No!') ;

if strcmp(answer, 'Yes')
    delete(hObject);
end


% --- Executes on key press with focus on figure_main and none of its controls.
function figure_main_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to figure_main (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.FIGURE)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
if strcmp(eventdata.Key, 'f')
    
    grp_idx = handles.selected_group ;
    if isempty(grp_idx)
        return ;
    end
    
    model = handles.groups(grp_idx).active_fit ;
    handles.groups(grp_idx).fits.(model) = handles.groups(grp_idx).fits.(model).fit(handles) ;
    handles.groups(grp_idx).fits.(model).active.a = 1 ;
    
    handles = update_gui(handles) ;
    guidata(handles.figure_main, handles) ;
end


% --- Executes during object creation, after setting all properties.
function figure_main_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure_main (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
