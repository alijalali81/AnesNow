function m_patient=anesnowread(fid,formatSpec)

D = textscan(fid,formatSpec,'Delimiter','|');
D(:,[1:3,5,10:17])=[];
fclose(fid);

t=datetime(D{1});
h=t.Hour;
m=t.Minute;
s=t.Second;
new_t=[h m s];
f=[3600;60;1];
tt=new_t*f;
clear f new_t h m s t

vital_label=D{2};
vitals=unique(vital_label);
vital_value=cell2mat(D(3));
source_name=D{5};
%source=unique(source_name);

for i=1:length(vitals)
    inx=strcmp(vital_label,vitals{i});
    vname=vitals{i};
    time=tt(inx==1);
    source=source_name(inx==1);
    value=vital_value(inx==1);
    dd=table(time,source,value);
    patient{i}=dd;
end
clear i tt

for i=1:length(vitals)
    n_vitals{i,1}=strrep(vitals{i},'-','_');
    n_vitals{i,1}=strrep(n_vitals{i},' ','_');
end
clear i
 
m_patient=cell2struct(patient,n_vitals,2);

clear n_vitals inx vname time source
clear value dd patient source_name vital_value
clear vital_label formatSpec
clear D fid ans vitals