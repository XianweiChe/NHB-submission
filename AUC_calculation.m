%% THIS IS FOR AUC CALCULATION

% Sub 109 and 110 have no heart rate data. Sub 101 was deleted (an outlier) in the statistics (comparison and correlation analysis).

ID = {'101';'102';'103';'104';'105';'106';'107';'108';'111';'112';'113';'114';'115';'116';'117';'118'}; % 
cond={'co';'no';'st'};% 

AUCBPM=nan(3,size(ID,1));
for i=1:size(ID,1)
    
    for j=1:size(cond,1)
        
    
      
    % load the data
    load(['BPM_' num2str(ID{i}) cond{j} '.mat']);
    
    % creat AUC
    a=mean(BPM,2);
    a=a(1001:end,1);
    ep_time=linspace(0,6,6000)';
    %figure,plot(ep_time,a);
    area=trapz(ep_time,a) % this function works despite of the negative values
    
    % save data
    AUCBPM(j,i)=area;
    
    end
    
end