clc
clear 

cd('C:\Users\ajalali\OneDrive\CHOP-PostDoc-Research\Anesthesia Now\ANVitalSigns_Jalali\ANVitalSigns_Jalali')
lis=dir();
formatSpec = '%s %s %d %{yyy-mm-dd HH:mm:ss}D %d %s %d %s %s %d %s %d %s %s %s %s %s';

for i=3:length(lis)
    
    nam=lis(i).name;
    fid=fopen(nam);
    p=anesnowread(fid,formatSpec);
    p.name=nam(1:length(nam)-4);
    an_patient{i-2}=p;
    
end
clear i
clear p lis fid nam

save an_patient an_patient