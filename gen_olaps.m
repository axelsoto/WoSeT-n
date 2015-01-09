load('20ng_gui.mat');
utopwords = utop10words; % replace 'utop20words' with 'utop10words' to use top 10
molap = molap10; % replace 'molap20' with 'molap10' to use top 10

olapm = tril(molap, -1);
temp = olapm(:);
fidx = find(temp>0);
wpair = zeros(length(fidx), 2);

for i=1:length(fidx)
wpair(i, :) = [mod(fidx(i)-1, 8163)+1, floor((fidx(i)-1)/8163)+1];
end

wssize = sum(utopwords);

for i=1:length(fidx)
pwssize(i) = wssize(wpair(i,1)) * wssize(wpair(i,2));
end

sorter = [temp(fidx) pwssize'];
[xx sind] = sortrows(sorter, [-1 -2]);

%% Write to file
display('Writing to file');
fp = fopen('wsolaps.txt', 'w'); % Output file

for i=1:length(sind)
    idx1 = utopwords(wpair(sind(i), 1), :);
    idx2 = utopwords(wpair(sind(i), 2), :);
    words1 = unstemmed_words(idx1);
    words2 = unstemmed_words(idx2);
    val = sprintf('%1.4f {', full(temp(fidx(sind(i)))));
    words1 = sprintf('%s ', words1{:});
    words2 = sprintf('%s ', words2{:});
    fprintf(fp, '%s\n', strcat(val, words1, '}{', words2, '}'));
end

fclose(fp);