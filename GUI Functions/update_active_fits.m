function [ handles ] = update_active_fits( handles )
%UPDATE_ACTIVE_FITS Summary of this function goes here
%   Detailed explanation goes here

grp_idx = handles.selected_group ;
model = handles.groups(grp_idx).active_fit ;

if handles.groups(grp_idx).fits.(model).active.m
    handles.manual_checkbox.Value = 1 ;
else
    handles.manual_checkbox.Value = 0 ;
end

if handles.groups(grp_idx).fits.(model).active.a
    handles.checkbox_auto.Value = 1 ;
    handles.checkbox_fitbnd_plot.Enable = 'on' ;
else
    handles.checkbox_auto.Value = 0 ;
    handles.checkbox_fitbnd_plot.Enable = 'off' ;
end

end

