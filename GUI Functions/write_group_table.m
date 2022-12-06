function write_group_table(handles)

[~, column_name] = ismember('Name', handles.table_groups.ColumnName);
[~, column_model] = ismember('Model', handles.table_groups.ColumnName);
[~, column_offset] = ismember('Offset', handles.table_groups.ColumnName);


for i = 1:length(handles.groups)
    handles.table_groups.Data{i,column_name} = handles.groups(i).name ;
    handles.table_groups.Data{i,column_model} = handles.groups(i).fits.(handles.groups(i).active_fit).name ;
    handles.table_groups.Data{i,column_offset} = handles.groups(i).offset ;
end