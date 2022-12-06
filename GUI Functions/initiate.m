function [] = initiate(handles)
% create cells

handles.groups = [] ;

handles.selected_group = [] ;

handles.func_str_axes_right = '' ;
handles.func_show_axes_right = 0 ;

% set axes properties
set(handles.axes_main,...
    'Box', 'on',...
    'LineWidth', 1.2,...
    'XMinorTick', 'on',...
    'YMinorTick', 'on',...
    'TickLength', [0.007 0.007],...
    'FontName', 'Lucida Bright',...
    'FontSize', 12,...
    'XGrid', 'on',...
    'YGrid', 'on');

handles.axes_lims.linear.x = [0 20] ;
handles.axes_lims.linear.y = [-0.1 3] ;

handles.axes_lims.semilog.x = [0 20] ;
handles.axes_lims.semilog.y = [1e-4 10] ;

handles.axes_lims.semilog_abs.x = [0 20] ;
handles.axes_lims.semilog_abs.y = [1e-4 10] ;

handles.axes_lims.loglog.x = [5 40] ;
handles.axes_lims.loglog.y = [1e-4 .5] ;

xlabel('Separation [nm]') ;
ylabel('Force [nN]') ;

handles.table_groups.Data = {} ;
clear_fit_tables(handles)

handles.sep_rsf = 1 ;
guidata(handles.figure_main, handles);
