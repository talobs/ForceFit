function handles = update_gui( handles )
%UPDATE_GUI Summary of this function goes here
%   Detailed explanation goes here
handles = update_active_fits(handles) ;
plot_groups(handles)
handles = write_fits_table(handles);
end

