%% THIS IS FOR SLIDING-WINDOW CORRELATION

%% close other vs. no-holding
% cut and AUC
cut_co=nan(16,11);
ep_time=linspace(0,1,1000)';
for i=1:16;
    
    for j=1:11;
        cut=avg_co(1001+500*(j-1):1001+500*(j-1)+999,i);
        area=trapz(ep_time,cut);
        cut_co(i,j)=area;
    end
    
end

cut_no=nan(16,11);
for i=1:16;
    
    for j=1:11;
        cut=avg_no(1001+500*(j-1):1001+500*(j-1)+999,i);
        area=trapz(ep_time,cut);
        cut_no(i,j)=area;
    end
    
end

% difference
cut_diff_co=cut_no-cut_co;

% correlate
rvalue1=nan(11,1);
pvalue1=nan(11,1);
for i=1:11;

[r,p]=corrcoef(cut_diff_co(:,i),PainRelief(:,:));
rvalue1(i,1)=r(1,2);
pvalue1(i,1)=p(1,2);
     
end

% plot together
figure,ep_time=linspace(0.5,5.5,11);
yyaxis left
plot(ep_time,rvalue1),xlim([0,6]),hold on, 

yyaxis right
plot(ep_time,pvalue1),hold on 

%% stranger vs. no-holding
% cut and AUC
cut_st=nan(16,11);
ep_time=linspace(0,1,1000)';
for i=1:16;
    
    for j=1:11;
        cut=avg_st(1001+500*(j-1):1001+500*(j-1)+999,i);
        area=trapz(ep_time,cut);
        cut_st(i,j)=area;
    end
    
end

cut_no=nan(16,11);
for i=1:16;
    
    for j=1:11;
        cut=avg_no(1001+500*(j-1):1001+500*(j-1)+999,i);
        area=trapz(ep_time,cut);
        cut_no(i,j)=area;
    end
    
end

% difference
cut_diff_st=cut_st-cut_no;

% correlate
rvalue2=nan(11,1);
pvalue2=nan(11,1);
for i=1:11;

[r,p]=corrcoef(cut_diff_st(:,i),PainRelief_st(:,:));
rvalue2(i,1)=r(1,2);
pvalue2(i,1)=p(1,2);
     
end

% plot together
figure,ep_time=linspace(0.5,5.5,11);
yyaxis left
plot(ep_time,rvalue2),xlim([0,6]),hold on, 

yyaxis right
plot(ep_time,pvalue2),hold on 