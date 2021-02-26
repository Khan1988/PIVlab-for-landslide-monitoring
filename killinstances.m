function killinstances()
[status, str] = system('tasklist');  % Assuming Windows, use 'ps -eaf' on Linux
List    = strsplit(str, '\n');
nMatlab = strncmp(List, 'MATLAB.exe', 10)
allinstances = List(nMatlab==1)
for i = 1:length(allinstances)
    p = strsplit(allinstances{i})
    pid = str2double(p(2));
    if ~(feature('getpid') == pid)
        if ispc
            cmd = sprintf('taskkill /PID %d', pid);
        else
            cmd = sprintf('kill %d', pid);
        end
        system(cmd)
    end
end