

name = "hong"

for window in range(1,len(name)+1):
	for i in range(len(name)-window+1):
  		print name[i:i+window]
