%% This is for the grand average and stats%%

clear; close all;

%% define paremeters
ID = {'101';'102';'103';'104';'105';'106';'107';'108';'109';'110';'111';'112';'113';'114';'115';'116';'117';'118'};
con = {'co' ; 'no'; 'st'};

aud = 'Audi';
inPath = '//Volumes/DATADRIVE/WORKDIR/ft_analysis/ft_conditions/';
outPath = '/Volumes/DATADRIVE/WORKDIR/ft_analysis/ft_comparecond/';

%% close other condition

% ft_defaults;

cd(inPath)

for i=1:size(ID,1);
    
    % load data
    load([inPath,[ID{i,1} 'co' '_ftactivationBc' '.mat']]);
    idco{i,1} = ['H' ID{i,1}];
    ALLco.(idco{i,1}) = ftactivationBc;
    
end

% Perform grand average
cfg=[];
cfg.keepindividual = 'yes';

GA_co = ft_freqgrandaverage(cfg,...
        ALLco.(idco{1,1}),...
        ALLco.(idco{2,1}),...
        ALLco.(idco{3,1}),...
        ALLco.(idco{4,1}),...
        ALLco.(idco{5,1}),...
        ALLco.(idco{6,1}),...
        ALLco.(idco{7,1}),...
        ALLco.(idco{8,1}),...
        ALLco.(idco{9,1}),...
        ALLco.(idco{10,1}),...
        ALLco.(idco{11,1}),...
        ALLco.(idco{12,1}),...
        ALLco.(idco{13,1}),...
        ALLco.(idco{14,1}),...
        ALLco.(idco{15,1}),...
        ALLco.(idco{16,1}),...
        ALLco.(idco{17,1}),...
        ALLco.(idco{18,1}));

% Checks that the number of participants is correct
if size(ID,1) ~= size(GA_co.powspctrm,1)
    error('Number of participants in GA_co does not match number of participants in ID. Data not saved');
end
    
% save results
cd(outPath)
save('GA_co', 'GA_co');

    
 %% strange condition

% ft_defaults;

cd(inPath)

for i=1:size(ID,1);
    
    % load data
    load([inPath,[ID{i,1} 'st' '_ftactivationBc' '.mat']]);
    idst{i,1} = ['H' ID{i,1}];
    ALLst.(idst{i,1}) = ftactivationBc;
    
end

% Perform grand average
cfg=[];
cfg.keepindividual = 'yes';

GA_st = ft_freqgrandaverage(cfg,...
        ALLst.(idst{1,1}),...
        ALLst.(idst{2,1}),...
        ALLst.(idst{3,1}),...
        ALLst.(idst{4,1}),...
        ALLst.(idst{5,1}),...
        ALLst.(idst{6,1}),...
        ALLst.(idst{7,1}),...
        ALLst.(idst{8,1}),...
        ALLst.(idst{9,1}),...
        ALLst.(idst{10,1}),...
        ALLst.(idst{11,1}),...
        ALLst.(idst{12,1}),...
        ALLst.(idst{13,1}),...
        ALLst.(idst{14,1}),...
        ALLst.(idst{15,1}),...
        ALLst.(idst{16,1}),...
        ALLst.(idst{17,1}),...
        ALLst.(idst{18,1}));

% Checks that the number of participants is correct
if size(ID,1) ~= size(GA_st.powspctrm,1)
    error('Number of participants in GA_st does not match number of participants in ID. Data not saved');
end
    
% save results
cd(outPath)
save('GA_st', 'GA_st');


%% no-holding condition

% ft_defaults;

cd(inPath)

for i=1:size(ID,1);
    
    % load data
    load([inPath,[ID{i,1} 'no' '_ftactivationBc' '.mat']]);
    idno{i,1} = ['H' ID{i,1}];
    ALLno.(idno{i,1}) = ftactivationBc;
    
end

% Perform grand average
cfg=[];
cfg.keepindividual = 'yes'; 

GA_no = ft_freqgrandaverage(cfg,...
        ALLno.(idno{1,1}),...
        ALLno.(idno{2,1}),...
        ALLno.(idno{3,1}),...
        ALLno.(idno{4,1}),...
        ALLno.(idno{5,1}),...
        ALLno.(idno{6,1}),...
        ALLno.(idno{7,1}),...
        ALLno.(idno{8,1}),...
        ALLno.(idno{9,1}),...
        ALLno.(idno{10,1}),...
        ALLno.(idno{11,1}),...
        ALLno.(idno{12,1}),...
        ALLno.(idno{13,1}),...
        ALLno.(idno{14,1}),...
        ALLno.(idno{15,1}),...
        ALLno.(idno{16,1}),...
        ALLno.(idno{17,1}),...
        ALLno.(idno{18,1}));

% Checks that the number of participants is correct
if size(ID,1) ~= size(GA_no.powspctrm,1)
    error('Number of participants in GA_no does not match number of participants in ID. Data not saved');
end
   
% save results
cd(outPath)
save('GA_no', 'GA_no');

return
%% plot to check
cfg=[];
cfg.xlim=[0 6];
cfg.zlim=[-1 1];
cfg.ylim=[4 8];
cfg.channel= {'FZ','FCZ'};
cfg.colorbar='yes';
    
figure;
subplot(3,1,1),ft_singleplotTFR(cfg, GA_co);
subplot(3,1,2),ft_singleplotTFR(cfg, GA_no);
subplot(3,1,3),ft_singleplotTFR(cfg, GA_st);

%% stats
cfg = [];
cfg.channel     = {'all'};
cfg.latency     = [0 6];
cfg.frequency   = [4 8]; %% 


cfg.minnbchan   = 2; %minimum number of channels for cluster
cfg.clusteralpha = 0.05;
cfg.clusterstatistic = 'maxsum';
cfg.alpha       = 0.025;% 0.025 for two tailed, 0.05 for one tailed
cfg.avgovertime = 'no'; %can change this between no and yes depending if you want time included
cfg.avgoverchan = 'no'; %can change this between no and yes depending if you want all channels included
cfg.avgoverfreq = 'yes'; %can change this between no and yes depending if you want all frequencies included
cfg.statistic   = 'depsamplesT';
cfg.numrandomization = 5000;
cfg.correctm    = 'cluster';
cfg.method      = 'montecarlo'; 
cfg.tail             = 0;
cfg.clustertail      = 0;
load('myneighbours_triangular.mat');
cfg.neighbours  = neighbours;

% design
subj = 18;
design = zeros(2,2*subj);
for i = 1:subj
  design(1,i) = i;
end
for i = 1:subj
  design(1,subj+i) = i;
end
design(2,1:subj)        = 1;
design(2,subj+1:2*subj) = 2;

cfg.design = design;
cfg.uvar  = 1;
cfg.ivar  = 2;

[stat_co_no] = ft_freqstatistics(cfg, GA_co, GA_no);
%[stat_co_st] = ft_freqstatistics(cfg, GA_co, GA_st);
%[stat_st_no] = ft_freqstatistics(cfg, GA_st, GA_no);
%% plot to check

cfg=[];
cfg.alpha = 0.025;
cfg.parameter = 'stat';
cfg.layout = 'quickcap64.mat';
cfg.highlightcolorpos = [0 0 1];
cfg.highlightcolorneg = [1 1 0];
cfg.colorbar='yes'; 
cfg.subplotsize       = [3 3];
cfg.zlim              = [-2 2];
cfg.highlightsymbolseries     =['*','x','+','o','.']; %1x5 vector, highlight marker symbol series (default ['*','x','+','o','.'] for p < [0.01 0.05 0.1 0.2 0.3]
cfg.highlightsizeseries       =[10 10 10 10 10 ];%1x5 vector, highlight marker size series   (default [6 6 6 6 6] for p < [0.01 0.05 0.1 0.2 0.3])
ft_clusterplot(cfg,stat_st_no);
