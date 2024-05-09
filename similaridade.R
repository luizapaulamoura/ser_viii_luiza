#library(gridExtra)
library(tidyverse)
library(magrittr)
library(dplyr)
library(readr)
#library(ggthemes)
#library(ggplot2)
library(readxl)
#install.packages("C:\\Users\\luiza\\Downloads\\wordcloud_2.6.zip", repos = NULL, type = "source")
library(tidytext)
#Mineração

#install.packages("wordcloud")
#install.packages("tm")
library(tm)
#library(wordcloud)
library(tidytext)

df <- read_xlsx("bncc_trad.xlsx")

#view(df)
glimpse(df)

habilidades <- df$HABILIDADES

#view(habilidades)

print(habilidades)

#Produzir corpus
hab_text <- VCorpus(VectorSource(habilidades))
print(hab_text)

#Tratamento dos caracteres especiais

#hab_text <- tm_map(hab_text,
#                       content_transformer(function(x) iconv(x, to = 'UTF-8', sub = 'byte')))

#tratamento cara caixa baixa
hab_text <- tm_map(hab_text, content_transformer(tolower))

#tirar pontuação
hab_text <- tm_map(hab_text, removePunctuation)

# tirar stop words
hab_text <- tm_map(hab_text,removeWords, stopwords("english"))

hab_dtm <- DocumentTermMatrix(hab_text)   
print(hab_dtm)


#  TEXTO DO IDS

library(pdftools)
# Carregar o texto do PDF
text <- pdf_text("./Introduction to Data Science_Curriculum_v 6.0.pdf")




#Set data source
source_text<-VectorSource(text)

#Set data source as corpus
CV_Corpus_ids<-Corpus(source_text)

#Clean data
CV_Corpus_ids=tm_map(CV_Corpus_ids,stripWhitespace)
CV_Corpus_ids=tm_map(CV_Corpus_ids,removePunctuation)
CV_Corpus_ids=tm_map(CV_Corpus_ids,content_transformer(tolower))
CV_Corpus_ids=tm_map(CV_Corpus_ids,removeWords,stopwords(kind = 'en'))

#Create Term Document Matrix
dtm_ids=TermDocumentMatrix(CV_Corpus_ids)



#    similaridade com quanteda

install.packages("quanteda")

install.packages("Matrix", dependencies = TRUE)
library(tidytext)


install.packages("Matrix")
#update.packages(ask = FALSE)
library(Matrix)
library(quanteda)

