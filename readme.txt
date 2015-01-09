Author: Ajitesh Srivastava

gen_olaps.m: Function used to calculate overlaps among the wordset. Different values for n are available by modifying the code as indicated
gen_topics.m: Function to generate the topics given the values calculater in gen_olaps.m and a threshold value
topwords2topics.m: Calculates Normalized Mutual Information between ground truth and clustering result.
20ng_gui.mat: 20 newsgroup dataset in matlab format suitable for this code
20ng_nostem.mat: 20 newsgroup dataset mapping to the unstemmed version of the words of the previous dataset

Reference: 
@inproceedings{Srivastava:2013:GTE:2494266.2494280,
 author = {Srivastava, Ajitesh and Soto, Axel J. and Milios, Evangelos},
 title = {A graph-based topic extraction method enabling simple interactive customization},
 booktitle = {Proceedings of the 2013 ACM symposium on Document engineering},
 series = {DocEng '13},
 year = {2013},
 isbn = {978-1-4503-1789-4},
 location = {Florence, Italy},
 pages = {71--80},
 numpages = {10},
 url = {http://doi.acm.org/10.1145/2494266.2494280},
 doi = {10.1145/2494266.2494280},
 acmid = {2494280},
 publisher = {ACM},
 address = {New York, NY, USA},
 keywords = {soft clustering, topic extraction, visual text mining},
}

You are free to use, change, or redistribute this code in any way you
want for non-commercial purposes. However, it is appreciated if you 
maintain the name of the original authors and you cite the above reference
