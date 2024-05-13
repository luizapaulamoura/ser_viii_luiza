library(pdftools)
library(tidytext) 
library(wordcloud) 
library(magrittr)
library(dplyr)
library(ggplot2)
library(tm)

# texto do PDF
text <- pdf_text("./Introduction to Data Science_Curriculum_v 6.0.pdf")

# criar data frame 
text_df <- data.frame(line = 1:length(text), text = text)

# tokenizar as palavras e tirar as stopwords (inglês é padrão)
text_tok <- text_df %>%
  unnest_tokens(word, text) %>%
  anti_join(stop_words)

# tirar números e a palavra "v_6.0" (sempre fica no rodapé)
text_tok <- text_tok %>%
  filter(!grepl("^\\d+$", word)) %>%
  filter(word != "v_6.0")

#frequência das palavras
word_freq <- text_tok %>% 
  count(word, sort = TRUE)

top_words <- head(word_freq, 60)

# nuvem de palavras 
wordcloud(words = top_words$word, freq = top_words$n, scale=c(3,0.5),
          colors = brewer.pal(8, "Dark2"), random.order = FALSE,
          random.color = FALSE, max.words = 100, min.freq = 2)
