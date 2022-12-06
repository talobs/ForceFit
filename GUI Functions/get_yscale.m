function [ yscale ] = get_yscale( handles )
%GET_YSCALE Summary of this function goes here
%   Detailed explanation goes here

if handles.yscale_radio_linear.Value
    yscale = 'linear' ;
end

if handles.yscale_radio_semilog.Value
    yscale = 'semilog' ;
end

if handles.yscale_semilog_abs.Value
    yscale = 'semilog_abs' ;
end

if handles.yscale_loglog.Value
    yscale = 'loglog' ;
end
end

