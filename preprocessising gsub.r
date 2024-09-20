a = read.csv(file.choose(), header=TRUE)
str(a)
google_tweets=a;
View(google_tweets)
google_text=a$text
#convert all text to lower text
google_text =  tolower(google_text)
google_text[1:5]
#replace blank space("rt")
google_text = gsub("rb", "",google_text)
#replace @UserName
google_text = gsub("@//w+", "", google_text)
#remove punctuation
google_text = gsub("[[:punct:]]", "",google_text)
#remove tabs
google_text = gsub("[ |\t]{2,}", "" ,google_text)

#remove blank spaces at the beginnening
google_text = gsub("^ ","",google_text)
#remove blank spaces at the end
google_text = gsub(" $", "",google_text)
