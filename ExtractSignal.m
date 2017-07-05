%% This is for extracting signal and correlation %%

%% close other vs. no-holding
% create the difference wave

GA_no_co=GA_co;
GA_no_co.powspctrm=GA_no.powspctrm-GA_co.powspctrm;

% extract the difference wave
diff_eeg1=nan(18,11);

for i=1:size(GA_no_co.powspctrm, 1);
    
    temp1=squeeze(GA_no_co.powspctrm(i,:,:,:)); % extract the participant
    temp2=temp1([2,7,8,16],5:13,:); % extract the significant 
    temp3=squeeze(mean(temp2,1)); % average
    temp4=squeeze(mean(temp3,1)); % average
    temp5= inpaint_nans(temp4,4); % inpant nans
    
    for j=1:11;
        diff_eeg1(i,j)=mean(temp5(1,101+50*(j-1):101+50*(j-1)+99));
    end

end

% correlate
rvalue=nan(11,1);
pvalue=nan(11,1);
for i=1:11;

[r,p]=corrcoef(diff_eeg1(:,i),PainRelief(:,:));
rvalue(i,1)=r(1,2);
pvalue(i,1)=p(1,2);
     
end

% plot together
figure,ep_time=linspace(0.5,5.5,11);
yyaxis left
plot(ep_time,rvalue),xlim([0,6]),hold on, 

yyaxis right
plot(ep_time,pvalue),hold on, 


%% stranger vs. no-holding
% create the difference wave

GA_no_st=GA_st;
GA_no_st.powspctrm=GA_no.powspctrm-GA_st.powspctrm;

% extract the difference wave
diff_eeg2=nan(18,11);

for i=1:size(GA_no_st.powspctrm, 1);
    
    temp1=squeeze(GA_no_st.powspctrm(i,:,:,:)); % extract the participant
    temp2=temp1([35,36,37,44],5:13,:); % extract the significant
    temp3=squeeze(mean(temp2,1)); % average
    temp4=squeeze(mean(temp3,1)); % average
    temp5= inpaint_nans(temp4,4); % impant nans
    
    for j=1:11;
        diff_eeg2(i,j)=mean(temp5(1,101+50*(j-1):101+50*(j-1)+99));
    end

end

% correlate
rvalue1=nan(11,1);
pvalue1=nan(11,1);
for i=1:11;

[r,p]=corrcoef(diff_eeg2(:,i),PainRelief_st(:,:));
rvalue1(i,1)=r(1,2);
pvalue1(i,1)=p(1,2);
     
end


% plot together
figure,ep_time=linspace(0.5,5.5,11);
yyaxis left
plot(ep_time,rvalue1),xlim([0,6]),hold on, 

yyaxis right
plot(ep_time,pvalue1)