function Interval = GetInterval(i1,i2)

imginfo  = imfinfo(i1);
timeinfo = imginfo.DateTime;
timeinfo = split(timeinfo,' ');
t1 = posixtime(datetime(strcat(strrep(timeinfo{1},':','-')," ",timeinfo{2})));


imginfo  = imfinfo(i2);
timeinfo = imginfo.DateTime;
timeinfo = split(timeinfo,' ');
t2 = posixtime(datetime(strcat(strrep(timeinfo{1},':','-')," ",timeinfo{2})));
Interval = (t2-t1)*1000;
