function [probmat molap rement fword] = topwords2topics(utopwords, molap, thres, num_topics, lwc)
lgw = lwc * spdiags(1./sum(lwc, 1)', 0, length(lwc), length(lwc));
%went = -sum(lgw.*log(lgw+1e-20), 1)/log(size(lgw, 1));
%went = sum(MI_lwc(lwc));
num_words = size(utopwords, 2);
num_topics = size(utopwords, 1);
probmat = sparse(num_words, num_words);
if size(molap,1)==0
olap = sparse(double(utopwords) * (utopwords'));
molap = olap;
dvec = diag(olap, 0);
for i=1:num_topics
molap(i, :) = olap(i, :)./min(ones(1, num_topics)*olap(i, i), dvec');
if mod(i, 500)==0
fprintf('Done for i= %d\n', i);
end
end

display('overlap calculated');
end
rement = [];
mutex = molap > thres;
included = zeros(1, length(molap));
wssize = sum(utopwords, 2);
%probmat = [];
j = 1;
[sorted sidx] = sort(wssize, 'descend');
for i=1:num_topics
	if included(sidx(i))==1
        continue;
    else
        included(sidx(i))=1;
        newrow =  sum(utopwords(mutex(sidx(i),:),:), 1);
        if sum(newrow>0)<2
            break;
        end
        if length(newrow)~=num_words
            fprintf('ERROR at %d sidx is %d and size is %d',i, sidx(i), length(newrow));
        end
        try
            %probmat =sparse([probmat; newrow]);
            probmat(j, :) = newrow;
        catch
            whos probmat
            break;
        end
        included(mutex(sidx(i),:)) = 1;
    %    rement1(j) = sum((included==1).*went)/sum(included==1);
    %    rement(j) = topics2ent(newrow', lwc);
    %    rement(j) = sum((newrow).*went)/sum(newrow);
        j = j+1;
	end
end
probmat( ~any(probmat,2), : ) = [];
probmat = probmat';

tsize = sum(probmat>0, 1);
[temp sidx] = sort(tsize, 'descend');
probmat = probmat(:, sidx);

for i=1:length(sidx)
    included = (sum(probmat(:, 1:i), 2)>0)';
    %rement1(i) = sum((included==1).*went)/sum(included==1);
	rement1(i) = 0;
    fword(i) = sum(included)/num_words;
end
rement = {};
rement{1} = rement1;

end
