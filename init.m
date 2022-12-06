function handles = init(handles)
restoredefaultpath
addpath('Cyplot Classes', 'Functions', 'GUI Functions', 'model classes', 'models', 'Physical Tools')
handles.mainDir = fileparts(mfilename('fullpath')) ;
load([handles.mainDir '\+Const_p_Exact\DB\2&3s.mat'], 'solsDB')
handles.solsDB = solsDB ;
end

