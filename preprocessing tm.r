#read file
a= read.csv(file.chose(),header = True)
str(a)
summary(a)
library(tm)
#build corpus: collection of doc
#each tweet will be consider as documents
corpus = iconv(a$text)
corpus = Corpus(VectorSource(corpos))
inspect(corpos[1:2])
#data cleaning
corpus = tm_map(corpus,tolower)
inspect(corpus[1:5])
corpus = tm_map(corpus,removePunctuation)
#remove punctuation
inspect(corpus[1:5])
cleanset = tm_map(corpus,removeWords,stopwords('english'))
inspect(cleanset[1:5])
removeURL = function(x)gsub('http.*','',x)
cleanset = tm_map(cleanset,content_transformer(removeURL))
inspect(cleanset[1:5])
cleanset=tm_map(cleanset,removeWords,c('anyone','walker16'))
cleanset=tm_map(cleanset,gsub,pattern='stocks',replacement='stock')
cleanset=tm_map(cleanset,stripWhitespace)
inspect(cleanset[1:5])
