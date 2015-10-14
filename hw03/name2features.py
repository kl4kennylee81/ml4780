#!/usr/bin/python
import sys

def hashfeatures(name):
  B=100000; # number of dimensions in our feature space
  v=[0]*B; # initialize the vector to be all-zeros
  name=name.lower() # make all letters lower case
  # hash prefixes & suffixes

  for m in range(3):
    featurestring='prefix'+name[0:min(m+1,len(name))]
    v[hash(featurestring) % B] = 1
    featurestring='suffix'+name[-1:-min(m+2,len(name)+1):-1]
    v[hash(featurestring) % B] = 1


  # for window in range(1,len(name)+1):
  #   for i in range(len(name)-window+1):
  #     feature = name[i:i+window]
  #     v[hash(feature) % B] = 1


  # vowels = 'aie'
  # if vowels.find(name[-1])!=-1:
  #   featurestring = 'lastvFemale'
  #   v[hash(featurestring) % B]=1


  return v



for name in sys.stdin:
  print ','.join(map(str,hashfeatures(name.strip())))

