

import os,sys;

path=sys.argv[1];

if len(sys.argv)>1:
	HASHBUCKETS=2**int(sys.argv[2]);
else:
	HASHBUCKETS=2**10;
	
ind=[x.split() for x in open(path+'/index').read().split('\n') if len(x)>0]; # read in index file
codebook={}

# all_stopwords = open("stopwords.data")

def text_to_list(allw):

    # filter irrelevant special characters
    # text = text.replace("(","").replace(")","").replace(",","").replace(".","").replace("-","")\
    #             .replace(";","").replace("/","").replace("+","")
 
    # text_list = map(lambda s: s.lower(), text.split()) # turn from string to list
    # text_list = filter(lambda s: s.isalpha(), text_list) # remove all numbers
    # text_list = filter(lambda s: len(s) < 12 ,text_list)

    # stopwords = "a a's able about above according accordingly across actually after afterwards again against ain't all allow allows almost alone along already also although always am among amongst an and another any anybody anyhow anyone anything anyway anyways anywhere apart appear appreciate appropriate are aren't around as aside ask asking associated at available away awfully b be became because become becomes becoming been before beforehand behind being believe below beside besides best better between beyond both brief but by c c'mon c's came can can't cannot cant cause causes certain certainly changes clearly co com come comes concerning consequently consider considering contain containing contains corresponding could couldn't course currently d definitely described despite did didn't different do does doesn't doing don't done down downwards during e each edu eg eight either else elsewhere enough entirely especially et etc even ever every everybody everyone everything everywhere ex exactly example except f far few fifth first five followed following follows for former formerly forth four from further furthermore g get gets getting given gives go goes going gone got gotten greetings h had hadn't happens hardly has hasn't have haven't having he he's hello help hence her here here's hereafter hereby herein hereupon hers herself hi him himself his hither hopefully how howbeit however i i'd i'll i'm i've ie if ignored immediate in inasmuch inc indeed indicate indicated indicates inner insofar instead into inward is isn't it it'd it'll it's its itself j just k keep keeps kept know knows known l last lately later latter latterly least less lest let let's like liked likely little look looking looks ltd m mainly many may maybe me mean meanwhile merely might more moreover most mostly much must my myself n name namely nd near nearly necessary need needs neither never nevertheless new next nine no nobody non none noone nor normally not nothing novel now nowhere o obviously of off often oh ok okay old on once one ones only onto or other others otherwise ought our ours ourselves out outside over overall own p particular particularly per perhaps placed please plus possible presumably probably provides q que quite qv r rather rd re really reasonably regarding regardless regards relatively respectively right s said same saw say saying says second secondly see seeing seem seemed seeming seems seen self selves sensible sent serious seriously seven several shall she should shouldn't since six so some somebody somehow someone something sometime sometimes somewhat somewhere soon sorry specified specify specifying still sub such sup sure t t's take taken tell tends th than thank thanks thanx that that's thats the their theirs them themselves then thence there there's thereafter thereby therefore therein theres thereupon these they they'd they'll they're they've think third this thorough thoroughly those though three through throughout thru thus to together too took toward towards tried tries truly try trying twice two u un under unfortunately unless unlikely until unto up upon us use used useful uses using usually uucp v value various very via viz vs w want wants was wasn't way we we'd we'll we're we've welcome well went were weren't what what's whatever when whence whenever where where's whereafter whereas whereby wherein whereupon wherever whether which while whither who who's whoever whole whom whose why will willing wish with within without won't wonder would would wouldn't x y yes yet you you'd you'll you're you've your yours yourself yourselves z zero".split()
    # for stopword in stopwords:
    # 	if stopword in allw:
    # 		allw.remove(stopword)
    return allw


# build codebook
for (num,(label,fn)) in enumerate(ind):
		# the next command loads in the data, replaces returns with blanks, splits it into words and hashes the words into integers
		text = open(path+'/'+fn).read().replace('\n',' ')
		allw = text.split()
		allw = text_to_list(allw)

 		# remove all stop words
		# for stopword in all_stopwords:
		# 	stopword = stopword.lower()
		# 	if stopword in allw:
		# 		allw.remove(stopword)

		email=map(lambda e: abs(e.__hash__()) % HASHBUCKETS,allw);
		# write out "emailnumber,hashedword" for all words
		sys.stdout.write('\n'.join(map(lambda a: '%i,%i' % (num+1,a+1),email))+'\n');



	