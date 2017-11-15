%In this directory, you will find some example data, which is a 300x8
%array stored in a .mat file. Image these are measurements for 300 genes are 8 different time
%points
%GB comments
1) 100 
2) 0 The number of eigenvalues is reflected by the number of variables or dimensions. In this question, there are 8 time points and therefore 8 dimensions. The question asks, how many dimensions are necessary to explain the data. The eigenvalues for each dimension is a number that describes the variance for that given variable or dimension. You can see that the variance then decreases as time moves on. Now we need to determine the number of dimensions that most contribute to changes we observe in the data. We see that the eigenvalues for the first two are much larger than the rest of the values, and therefore contribute most to the data. 
3) 90. Not really the most appropriate graphical representation. Data should be represented as points without lines. 
overall: 63

%1. Use matlab to perform pca on this data, getting the transformation
%matrix, the transformed data, and the eigenvalues.

dat = load('example_dat.mat');
dat = dat.dat;
[coeff, sc, eig] = pca(dat);
% transformation marix = coeff;
% the transformed data = sc;
% the eigenvalues = eig;

%2. Look at the eigenvalues - how many dimensions are necessary to explain
%the data? 

% Yu Ouyang's answer: there are 8 eigen values, which means 8 dimensions. 

%3. Using kmeans clustering to cluster the data into 3 clusters. 
% Make a plot of the first coordinate of the raw data vs the second color coded
% by which cluster it is in. Make the same plot but use the first two
% principle components instead. 

ids = kmeans(dat,3);
tt = 1:8;
for  ii = 1:3
    inds = ids == ii;
    subplot(1,3,ii);
    plot(tt,mean(dat(inds,:),1),'.-','LineWidth',3,'MarkerSize',18);
    title(['Cluster ', int2str(ii), ' ngenes: ' int2str(sum(inds))]);
end

%4. Repeat part 3 but use 7 clusters. Which is a more appropriate number of
%clusters for the data?
%%

ids2 = kmeans(dat,7);
tt = 1:8;
for  ii = 1:7
    inds2 = ids2 == ii;
    subplot(3,3,ii);
    plot(tt,mean(dat(inds2,:),1),'.-','LineWidth',3,'MarkerSize',18);
    title(['Cluster ', int2str(ii), ' ngenes: ' int2str(sum(inds2))]);
end


% Yu Ouyang' answer: I think 3 would be more proper, since the three
% figures are significantly different from each other. However, in the 7
% cluster figure, there are some figures which looks similar. 
