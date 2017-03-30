clc

cd('C:\Users\ajalali\OneDrive\CHOP-PostDoc-Research\Anesthesia Now\ANVitalSigns_Jalali')

load an_patient

cd ..

[a,~,c]=xlsread('Ali_AnesNow.xlsx','Case Info');

inx_info=[1,4,9,13];
info=c(2:end,inx_info);

for i=1:length(info)
    if ~isnan(a(i))
        info{i,1}=num2str(info{i,1});
    end
end
clear i

for i=1:length(an_patient)
    k{i}=an_patient{i}.name;
end
clear i

kk=[88,127,158];

for i=1:213
    if ~ismember(i,kk)
        n=strcat(num2str(i));
        inx=find(strcmp(n,k)==1);
        an_subject{i}=an_patient{inx};
        inx_inf=find(strcmp(n,info(:,1))==1);
        an_subject{i}.name=[];
        an_subject{i}.name=n;
        an_subject{i}.age=info{inx_info,2};
        an_subject{i}.ASA=info{inx_info,3};
        an_subject{i}.emergency=info{inx_info,4};
    end
end

kk=[142,156];

for i=1:213
    if ~ismember(i,kk)
        n=strcat(num2str(i),'a');
        inx=find(strcmp(n,k)==1);
        an_subject_a{i}=an_patient{inx};
        inx_inf=find(strcmp(n,info(:,1))==1);
        an_subject_a{i}.name=[];
        an_subject_a{i}.name=n;
        an_subject_a{i}.age=info{inx_info,2};
        an_subject_a{i}.ASA=info{inx_info,3};
        an_subject_a{i}.emergency=info{inx_info,4};
    end
end

kk=[7,42,62,65,84,88,108,114,125,129,161,162,197,213];

for i=1:213
    if ~ismember(i,kk)
        n=strcat(num2str(i),'b');
        inx=find(strcmp(n,k)==1);
        an_subject_b{i}=an_patient{inx};
        inx_inf=find(strcmp(n,info(:,1))==1);
        an_subject_b{i}.name=[];
        an_subject_b{i}.name=n;
        an_subject_b{i}.age=info{inx_info,2};
        an_subject_b{i}.ASA=info{inx_info,3};
        an_subject_b{i}.emergency=info{inx_info,4};
    end
end
clear i 
clear n k inx inx_info
clear kk c a id info

cd('C:\Users\ajalali\OneDrive\CHOP-PostDoc-Research\Anesthesia Now\ANVitalSigns_Jalali')

save an_subject_b an_subject_b
save an_subject_a an_subject_a
save an_subject an_subject