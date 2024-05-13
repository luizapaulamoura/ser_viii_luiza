
#library(gridExtra)
library(tidyverse)
library(magrittr)
library(dplyr)
library(readr)
#library(ggthemes)
#library(ggplot2)
library(readxl)
library(tm)
#install.packages("C:\\Users\\luiza\\Downloads\\wordcloud_2.6.zip", repos = NULL, type = "source")

#Mineração

#install.packages("wordcloud")
#install.packages("tm")

library(wordcloud)
library(tidytext)

df <- read_xlsx("bncc_.xlsx")

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
hab_text <- tm_map(hab_text,removeWords, stopwords("portuguese"))

#nuvem de palavras



#wordcloud(hab_text,min.freq=2,max.words=100)
formatacao <- brewer.pal(8,"Dark2")
wordcloud(hab_text,min.freq=2,max.words=40, random.order=T, colors=formatacao)




#library(RColorBrewer)
#
#library(fpc)

#####
#Limpeza do texto com a Document Term Matrix
#hab_dtm <- DocumentTermMatrix(hab_text)   
#print(hab_dtm)

#sintomas_frequencia <- colSums(as.matrix(sintomas_dtm))   
#length(sintomas_frequencia) 
#tail(bitcoin_frequencia,10)

#Removendo termos espar?os
#hab_dtms <- removeSparseTerms(hab_dtm, 0.98) 
#hab_dtm

#hab_frequencia <- colSums(as.matrix(hab_dtms))   
#length(hab_frequencia) 

#hab_frequencia <- sort(colSums(as.matrix(hab_dtms)), decreasing=TRUE) 
#hab_frequencia

#Convertendo a matriz de frequencia em dataframe para o plot
#hab_plot <- data.frame(word=names(hab_frequencia), freq=hab_frequencia)  
#view(hab_plot)

#Criando o grafico
#grafico <- ggplot(subset(hab_plot, hab_frequencia>10), aes(x = reorder(word, -freq), y = freq)) +
#  geom_bar(stat = "identity") + 
#  theme(axis.text.x=element_text(angle=45, hjust=1)) +
#  ggtitle("Grafico de barras com os termos mais frequentes") +
#  labs(y="Frequência", x = "Termos")
#grafico  



























