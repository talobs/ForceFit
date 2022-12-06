function clear_fit_tables( handles )
%CLEAR_FIT_TABLES Summary of this function goes here
%   Detailed explanation goes here

handles.table_prop.Data = {} ;
handles.table_manual_fp.Data = {} ;
handles.table_auto_fp.Data = {} ;
handles.table_manual_p.Data = {} ;
handles.table_auto_p.Data = {} ;
handles.table_fbnd.Data = {} ;

handles.tf.pr = {} ;
handles.tf.man_fp = {} ;
handles.tf.man_p = {} ;
handles.tf.auto_fp = {} ;
handles.tf.autp_p = {} ;
handles.tf.fbnd = {} ;

guidata(handles.figure_main, handles) ;

end

