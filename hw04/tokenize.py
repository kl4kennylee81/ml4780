#!/usr/bin/python
#
# Usage: 
# python tokenize.py log_2(HASHBUCKETSIZE)
#
# 

import os,sys;

path=sys.argv[1];

if len(sys.argv)>1:
	HASHBUCKETS=2**12;
else:
	HASHBUCKETS=2**12;
	
ind=[x.split() for x in open(path+'/index').read().split('\n') if len(x)>0]; # read in index file
codebook={}

all_stopwords = open("stopwords.data")

# build codebook
for (num,(label,fn)) in enumerate(ind):
		# the next command loads in the data, replaces returns with blanks, splits it into words and hashes the words into integers
		all_words = open(path+'/'+fn).read().replace('\n',' ').split()
		
		# Lower all words
		all_words = map(lambda word: word.lower(), all_words)

		# remove all stop words
		for stopword in all_stopwords:
			if stopword in all_words:
				all_words.remove(stopword)

		email = map(lambda e: abs(e.__hash__())%HASHBUCKETS, all_words)

		# write out "emailnumber,hashedword" for all words
		sys.stdout.write('\n'.join(map(lambda a: '%i,%i' % (num+1,a+1), email))+'\n');

all_stopwords.close()

