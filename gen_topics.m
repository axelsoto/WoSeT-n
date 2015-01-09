load 20ng_gui.mat; %Uncomment if you have not already loaded the mat file
load threshold.txt; % Read the value of threshold from file
cutoff = 0.5;   % Select the cutoff for are

% Now apply algorithm
mytopics = topwords2topics(utop20words, molap20, threshold, 100, lwc);
display('done forming topics');

fp = fopen('topics.txt', 'w');

for i=1:size(mytopics, 2)
    idx = find(mytopics(:, i)>0);
    words = unstemmed_words(idx);
    words = sprintf('%s ', words{:});
    idx = sprintf('%d ', full(mytopics(idx,i)));
    fprintf(fp, '%s\n', strcat(words, '| ', idx));
end

fclose(fp);

% Find suggestion for cutoff

tsize = sum(mytopics>0, 1);
temp  =cumsum(tsize);
temp = temp/temp(length(tsize));
xx = find(temp>cutoff);
suggested_topics = xx(1);

fp = fopen('suggested_topics.txt', 'w');
fprintf(fp, '%d', suggested_topics);
fclose(fp);

fp = fopen('syncFile.txt', 'w');
fprintf(fp, '%d', 1);
fclose(fp);
