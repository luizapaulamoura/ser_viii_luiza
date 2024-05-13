
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

# ler o df
df <- read_xlsx("bncc_.xlsx")

#view(df)
glimpse(df)

#filtrar somente habilidades
habilidades <- df$HABILIDADES

#view(habilidades)

print(habilidades)

# fazer corpus
hab_text <- VCorpus(VectorSource(habilidades))
print(hab_text)


# todos os caracteres em caixa baixa
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
# fazer matriz termo documento
#hab_dtm <- DocumentTermMatrix(hab_text)   
#print(hab_dtm)


# frequência das palavraS
#hab_frequencia <- colSums(as.matrix(hab_dtm))   
#length(sintomas_frequencia) 
#tail(bitcoin_frequencia,10)

# tirar termos esparÇos
#hab_dtms <- removeSparseTerms(hab_dtm, 0.98) 
#hab_dtm

#hab_frequencia <- colSums(as.matrix(hab_dtms))   
#length(hab_frequencia) 

#hab_frequencia <- sort(colSums(as.matrix(hab_dtms)), decreasing=TRUE) 
#hab_frequencia

#matriz de frequÊncia
#hab_plot <- data.frame(word=names(hab_frequencia), freq=hab_frequencia)  
#view(hab_plot)

# plot
#grafico <- ggplot(subset(hab_plot, hab_frequencia>10), aes(x = reorder(word, -freq), y = freq)) +
#  geom_bar(stat = "identity") + 
#  theme(axis.text.x=element_text(angle=45, hjust=1)) +
#  ggtitle("Grafico de barras com os termos mais frequentes") +
#  labs(y="Frequência", x = "Termos")
#grafico  



























