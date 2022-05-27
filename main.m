clc;clear;
    
n= input("Enter n:");
n=20000;
fprintf("n=%d\n", n);
[step, sequ] = solution(n);
fprintf("op_num=%d\n", step);
fprintf("sequence=");
for y=2:length(sequ)
    fprintf("%d ",sequ(y))
end
for i=1:10
n=i;
fprintf("n=%d\n", n);
[step, sequ] = solution(n);
fprintf("op_num=%d\n", step);
fprintf("sequence=");
for y=2:length(sequ)
    fprintf("%d ",sequ(y))
end
fprintf("\n");
end

% time analysis
n0=500; % initial value of n
nn=8; % number of samples in each experiment
kk = 5; % number of experiments
timR = zeros(kk,nn);% initial time table
disp('The time table is printed. Just a minute ...');
fprintf('--------------------------------------------------------------------------------\n');
disp('n       500      1000     2000     4000     8000     16000    32000    64000');
fprintf('--------------------------------------------------------------------------------\n');
for k = 1:kk
    n=n0;
    for i=1:nn
        tic; % start timer
        solution(n+1);
        timR(k,i)=toc; % stop timer
        n=n*2;
    end
end
for k = 1:kk
fprintf('Exp#%d %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f\n',k,timR(k,:));
end
timR(1,:)=[]; % delete first time row
timR(:,1)=[]; % delete first time column
Y = mean(timR); % mean time values excluding the first row and the first column
fprintf('--------------------------------------------------------------------------------\n');
fprintf('Mean of #2-5:  %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f %8.4f \n',mean(timR));
fprintf('--------------------------------------------------------------------------------\n');
n=[ 1000   2000  4000  8000  16000 32000 64000]; % number of elements
scatter(n,mean(timR),50,'filled');%,'ro-','LineWidth',2);
grid; 
set(gca,'FontWeight','Bold');
title('Time complexity of Primitive calculator');
xlabel('Number of elements'); ylabel('Time (s)');
xlim([0 64000]);

