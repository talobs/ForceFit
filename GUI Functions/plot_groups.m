function plot_groups( handles )
axes(handles.axes_main)
cla() ;
if isempty(handles.selected_group)
    return ;
else
    grp_idx = handles.selected_group ;
end

%{
x_max = [] ;

        if handles.ax_lim_xmax_checkbox.Value
            x_max = str2num(handles.xmax_val.String) ;
        end
        
        if isempty(x_max)
            x_max = Inf ;
            manual_x_max = false ;
        else
            manual_x_max = true ;
        end
        
        if handles.ax_lim_xmin_checkbox.Value
            x_min = str2num(handles.xmin_val.String) ;
        else
            x_min = 0 ;
        end
        
y_min = [] ;
y_max = [] ;

        if handles.ax_lim_ymax_checkbox.Value
            y_max = str2num(handles.ymax_val.String) ;
        end
        
        if isempty(y_max)
            y_max = Inf ;
            manual_y_max= false ;
        else
            manual_y_max = true ;
        end
        
        if handles.ax_lim_ymin_checkbox.Value
            y_min = str2num(handles.ymin_val.String) ;
        end
        
        if isempty(y_min)
            y_min = -Inf ;
            manual_y_min= false ;
        else
            manual_y_min = true ;
        end
%} 

hold on
x = handles.groups(grp_idx).sep ;
y =  handles.groups(grp_idx).force + handles.groups(grp_idx).offset ;

%{
if manual_x_max
    [~, sep_idx_at_x_min] = min(abs(x-x_min)) ;
    [~, sep_idx_at_x_max] = min(abs(x-x_max)) ;
    if ~manual_y_max
        y_max = max([y(sep_idx_at_x_min:sep_idx_at_x_max) ; y_max]) ;
    end
    if ~manual_y_min
        y_min = min([y(sep_idx_at_x_min:sep_idx_at_x_max) ; y_min]) ;
    end
end

    x_max = max([handles.groups(group_idx).plot_prop.x_max*1e9 ; x_max]) ;
    if ~manual_y_max
        y_max = max([handles.groups(group_idx).plot_prop.y_max*1e9 ; y_max]) ;
    end
    if ~manual_y_min
        y_min = min([handles.groups(group_idx).plot_prop.y_min*1e9 ; y_min]) ;
    end
end
%}

if handles.yscale_semilog_abs.Value || handles.yscale_loglog.Value
    y = abs(y) ;
end

plot(x, y,...
    'Color', [0 0 0],...
    'LineStyle', 'none',...
    'Marker', '.',...
    'MarkerSize', 3,...
    'DisplayName', handles.groups(grp_idx).name);

model = handles.groups(grp_idx).active_fit ;
y_man_fit = handles.groups(grp_idx).fits.(model).cal(x,'m', handles) ;
y_auto_fit = handles.groups(grp_idx).fits.(model).cal(x,'a', handles) ;

if isempty(handles.groups(grp_idx).fits.(model).fit_curves)
   i_end = 1 ; 
   selective_disp = 0;
   line = '-' ;
else
    i_end = length(handles.groups(grp_idx).fits.(model).fit_curves) ;
    selective_disp = 1;
end

for i = 1:i_end
    if selective_disp
        if ~handles.groups(grp_idx).fits.(model).fit_curves(i).disp
            continue
        end
        line = handles.groups(grp_idx).fits.(model).fit_curves(i).line ;
    end
    
    if handles.manual_checkbox.Value
        if handles.yscale_semilog_abs.Value || handles.yscale_loglog.Value
            y_man_fit = cellfun(@abs, y_man_fit, 'UniformOutput',false) ;
        end
            
        if ~isempty(y_man_fit{i})
            plot(x, y_man_fit{i},...
                'Color', [0 0 1],...
                'LineStyle', line,...
                'Marker', 'none',...
                'MarkerSize', 3,...
                'DisplayName', handles.groups(grp_idx).name);
        end
    end
    
    if handles.checkbox_auto.Value
        if handles.yscale_semilog_abs.Value || handles.yscale_loglog.Value
            y_auto_fit = cellfun(@abs, y_auto_fit, 'UniformOutput',false) ;
        end
            
        if ~isempty(y_auto_fit{i})
            plot(x, y_auto_fit{i},...
                'Color', [1 0 0],...
                'LineStyle', line,...
                'Marker', 'none',...
                'MarkerSize', 3,...
                'DisplayName', handles.groups(grp_idx).name);
        end
        
    end
end
%{
x_lims = [x_min x_max] ;
y_lims = sort([y_min y_max]) ;
%}

yscale = get_yscale(handles) ;
x_lims = handles.axes_lims.(yscale).x ;
y_lims = handles.axes_lims.(yscale).y ;

if handles.checkbox_fitbnd_plot.Value && handles.checkbox_auto.Value
    fields = fieldnames(handles.groups(grp_idx).fits.(model).fbnd) ;
    for i = 1:length(fields)
        fbnd_x_val = handles.groups(grp_idx).fits.(model).fbnd.(fields{i}).val ;
        
        color = handles.groups(grp_idx).fits.(model).fbnd.(fields{i}).color ;
        if isempty(color)
            color = [1 0 1] ;
        end
        
        plot([fbnd_x_val fbnd_x_val], y_lims, ...
            'Color', [color 0.7],...
            'LineStyle', '--',...
            'Marker', 'none',...
            'MarkerSize', 3);
    end
end

if handles.plot_options_zero.Value
    plot(x_lims, [0 0], ...
        'Color', [0 0 0 0.7],...
        'LineStyle', '--',...
        'Marker', 'none',...
        'MarkerSize', 3);
end

%{
if ~isempty(handles.func_str_axes_right) && plots(6)
    x = linspace(x_min, x_max, 1000) ;
    y = eval(handles.func_str_axes_right) ;
    y = ySign_plotScale(handles, y) ;
    plot(x, y, 'color', [0 0 0], 'LineWidth', 2, 'DisplayName', 'Input Function')
end
%}

hold off

if size(x_lims) == [1 2] 
    xlim(x_lims) ;
end

if size(y_lims) == [1 2] 
    ylim(y_lims)
end

guidata(handles.figure_main, handles) ;