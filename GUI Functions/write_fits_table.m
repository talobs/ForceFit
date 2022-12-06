function  handles = write_fits_table( handles )
%WRITE_MANUAL_TABLE Summary of this function goes here
%   Detailed explanation goes here
clear_fit_tables(handles) ;

grp_idx = handles.selected_group ;
if isempty(grp_idx)
    return ;
end

model = handles.groups(grp_idx).active_fit ;

if isempty(model)
    return
end

%manual

[~, m_column_parameter] = ismember('Parameter', handles.table_manual_fp.ColumnName);
[~, m_column_value] = ismember('Value', handles.table_manual_fp.ColumnName);
[~, m_column_units] = ismember('Units', handles.table_manual_fp.ColumnName);

[~, a_column_parameter] = ismember('Parameter', handles.table_auto_fp.ColumnName);
[~, a_column_value] = ismember('Value', handles.table_auto_fp.ColumnName);
[~, a_column_units] = ismember('Units', handles.table_auto_fp.ColumnName);
[~, a_column_error] = ismember('Error', handles.table_auto_fp.ColumnName);
[~, a_column_guess] = ismember('Guess', handles.table_auto_fp.ColumnName);
[~, a_column_min] = ismember('Min', handles.table_auto_fp.ColumnName);
[~, a_column_max] = ismember('Max', handles.table_auto_fp.ColumnName);

fit_obj = handles.groups(grp_idx).fits.(model) ;
fp_fields = fieldnames(fit_obj.fp) ;
for i = 1:length(fp_fields)
    fp_obj = fit_obj.fp.(fp_fields{i}) ;
    if ~fp_obj.visible
        continue
    end
    if fp_obj.is_manual
        handles.table_manual_fp.Data{i,m_column_parameter} = fp_obj.name ;
        handles.table_manual_fp.Data{i,m_column_value} = fp_obj.mval ;
        handles.table_manual_fp.Data{i,m_column_units} = fp_obj.units ;
        handles.tf.man_fp{i} = fp_fields{i} ;
    end
    
    if fp_obj.is_auto
        handles.table_auto_fp.Data{i,a_column_parameter} = fp_obj.name ;
        handles.table_auto_fp.Data{i,a_column_value} = fp_obj.aval ;
        handles.table_auto_fp.Data{i,a_column_units} = fp_obj.units ;
        handles.table_auto_fp.Data{i,a_column_error} = fp_obj.aval_error ;
        handles.table_auto_fp.Data{i,a_column_guess} = fp_obj.aval_guess ;
        handles.table_auto_fp.Data{i,a_column_min} = fp_obj.aval_min ;
        handles.table_auto_fp.Data{i,a_column_max} = fp_obj.aval_max ;
        handles.tf.auto_fp{i} = fp_fields{i} ;
    end
end

p_fields = fieldnames(fit_obj.p) ;
for i = 1:length(p_fields)
    p_obj = fit_obj.p.(p_fields{i}) ;
    if ~p_obj.visible
        continue
    end
    if fp_obj.is_manual
        handles.table_manual_p.Data{i,m_column_parameter} = p_obj.name ;
        handles.table_manual_p.Data{i,m_column_value} = p_obj.mval ;
        handles.table_manual_p.Data{i,m_column_units} = p_obj.units ;
        handles.tf.man_p{i} = p_fields{i} ;
    end
        
    if fp_obj.is_auto
        handles.table_auto_p.Data{i,a_column_parameter} = p_obj.name ;
        handles.table_auto_p.Data{i,a_column_value} = p_obj.aval ;
        handles.table_auto_p.Data{i,a_column_error} = p_obj.aval_error ;
        handles.table_auto_p.Data{i,a_column_units} = p_obj.units ;
        handles.tf.auto_p{i} = p_fields{i} ;
    end
end

[~, fbnd_column_name] = ismember('Name', handles.table_fbnd.ColumnName);
[~, fbnd_column_value] = ismember('Value', handles.table_fbnd.ColumnName);

fbnd_fields = fieldnames(fit_obj.fbnd) ;
for i = 1:length(fbnd_fields)
    fbnd_obj = fit_obj.fbnd.(fbnd_fields{i}) ;
    
    handles.table_fbnd.Data{i, fbnd_column_name} = fbnd_obj.name ;
    handles.table_fbnd.Data{i, fbnd_column_value} = fbnd_obj.val ;
    handles.tf.fbnd{i} = fbnd_fields{i} ;
end

[~, prop_column_name] = ismember('Name', handles.table_prop.ColumnName);
[~, prop_column_value] = ismember('Value', handles.table_prop.ColumnName);
[~, prop_column_units] = ismember('Units', handles.table_prop.ColumnName);

pr_fields = fieldnames(fit_obj.pr) ;
for i = 1:length(pr_fields)
    pr_obj = fit_obj.pr.(pr_fields{i}) ;
    if ~pr_obj.visible
        continue
    end
    
    handles.table_prop.Data{i,prop_column_name} = pr_obj.name ;
    handles.table_prop.Data{i,prop_column_value} = pr_obj.val ;
    handles.table_prop.Data{i,prop_column_units} = pr_obj.units ;
    handles.tf.pr{i} = pr_fields{i} ;

end

if isempty(fit_obj.fit_curves)
    handles.table_fit2plot.Data = {} ;
    handles.table_fit2plot.Enable = 'off' ;
else
    for i = 1:length(fit_obj.fit_curves)
        handles.table_fit2plot.Data{i,1} = fit_obj.fit_curves(i).name ;
        if fit_obj.fit_curves(i).disp
            handles.table_fit2plot.Data{i,2} = 'Yes' ;
        else
            handles.table_fit2plot.Data{i,2} = 'No' ;
        end
        handles.table_fit2plot.Data{i,3} = fit_obj.fit_curves(i).line ;
    end
    handles.table_fit2plot.Enable = 'on' ;
end