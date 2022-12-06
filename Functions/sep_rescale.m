function handles = sep_rescale(handles)
%SEP_RESCALE Summary of this function goes here
%   Detailed explanation goes here

for i = 1:length(handles.groups)
    handles.groups(i).sep = handles.groups(i).sep_old*handles.sep_rsf ;
end
end

