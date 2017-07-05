%% HR GROUP AVERAGE AND PLOTTING

ID = {'101';'102';'103';'104';'105';'106';'107';'108';'111';'112';'113';'114';'115';'116';'117';'118'}; % 
cond={'co';'no';'st'};% 

% close other conditon
avg_co=zeros(7000,16);
for i=1:size(ID,1)

    load(['BPM_' num2str(ID{i}) 'co' '.mat']);
    data=mean(BPM,2);
    avg_co(:,i)=data;
    
end

% no-holding conditon
avg_no=zeros(7000,16);
for i=1:size(ID,1)

    load(['BPM_' num2str(ID{i}) 'no' '.mat']);
    data=mean(BPM,2);
    avg_no(:,i)=data;
    
end
% stranger conditon
avg_st=zeros(7000,16);
for i=1:size(ID,1)

    load(['BPM_' num2str(ID{i}) 'st' '.mat']);
    data=mean(BPM,2);
    avg_st(:,i)=data;
    
end

% plot the average
figure,ep_time=linspace(-0.5,6,6500);
plot(ep_time,mean(avg_co(501:7000,:),2),'.','color','g'),xlim([-0.5,6]),ylim([-1,4]),hold on, 
plot(ep_time,mean(avg_no(501:7000,:),2),'.','color','r'),xlim([-0.5,6]),hold on, 
plot(ep_time,mean(avg_st(501:7000,:),2),'.','color','b'),xlim([-0.5,6]),
