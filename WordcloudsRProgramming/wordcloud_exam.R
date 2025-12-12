setwd("C:/DMiningR/DM_Course/WordcloudsRProgramming")
getwd()

packages <- c("tm", "SnowballC", "wordcloud", "RColorBrewer")
to_install <- packages[!(packages %in% rownames(installed.packages()))]
if(length(to_install)) install.packages(to_install, dependencies = TRUE)

#libraries
library(tm)
library(SnowballC)
library(wordcloud)
library(RColorBrewer)

packages %in% rownames(installed.packages())

# Here reads files into R and creates Corpus
text_data <- readLines("feedback.txt", warn = FALSE)
length(text_data)
corpus <- VCorpus(VectorSource(text_data))
print(corpus[[1]]$content)

#Text Cleaning process 
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeWords, stopwords("english"))
corpus <- tm_map(corpus, stripWhitespace)

for(i in 1:3) cat(sprintf("[%d] %s\n", i, as.character(corpus[[i]]$content)))


#------------------------------PART 2-------------------------------------------

tdm <- TermDocumentMatrix(corpus)
m <- as.matrix(tdm)
word_freq <- sort(rowSums(m), decreasing = TRUE)
freq_df <- data.frame(word = names(word_freq), freq = word_freq, row.names = NULL)

head(freq_df, 15)

tdm <- TermDocumentMatrix(corpus)
m <- as.matrix(tdm)
word_freq <- sort(rowSums(m), decreasing = TRUE)
freq_df <- data.frame(
  word = names(word_freq),
  freq = word_freq,
  row.names = NULL
)
top10 <- head(freq_df, 10)
print(top10)

#------------------------------PART 3-------------------------------------------

png("wordcloud_exam.png", width = 800, height = 600)

# Generate the word cloud
wordcloud(
  words = freq_df$word,
  freq = freq_df$freq,
  min.freq = 2,
  max.words = 1000,
  random.order = FALSE,
  scale = c(4, 0.5),
  colors = brewer.pal(8, "Dark2")
)

dev.off()
cat("Saved wordcloud_exam.png in working directory.\n")

#------------------------------PART 4-------------------------------------------

freq_sorted <- freq_df[order(freq_df$freq), ]

rare_words <- head(freq_sorted, 5)

print("5 least frequent words:")
print(rare_words)
png("wordcloud_rare.png", width = 800, height = 600)

wordcloud(
  words = rare_words$word,
  freq = rare_words$freq,
  min.freq = 1,
  max.words = 5,
  random.order = FALSE,
  scale = c(4, 1.5),
  colors = brewer.pal(8, "Dark2")
)

dev.off()

cat("Saved wordcloud_rare.png in working directory.\n")