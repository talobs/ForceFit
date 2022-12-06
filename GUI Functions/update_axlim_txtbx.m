function [ handles ] = update_axlim_txtbx( handles )
%UPDATE_AXLIM_TXTBX Summary of this function goes here
%   Detailed explanation goes here
yscale = get_yscale(handles) ;
handles.xmin_val.String = num2str(handles.axes_lims.(yscale).x(1)) ;
handles.xmax_val.String = num2str(handles.axes_lims.(yscale).x(2)) ;
handles.ymin_val.String = num2str(handles.axes_lims.(yscale).y(1)) ;
handles.ymax_val.String = num2str(handles.axes_lims.(yscale).y(2)) ;


end

