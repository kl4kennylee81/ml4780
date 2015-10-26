filehandle = open("stopwords.data")

res = []

for line in filehandle:
  res.append(line.strip())

output = open("new","w")
restring = " ".join(res)
output.write(restring)

filehandle.close()
output.close()


