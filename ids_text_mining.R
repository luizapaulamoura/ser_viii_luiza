library(pdftools) # Ler os documentos PDF
library(tidytext) # Colocar o texto no formato tidytext
library(wordcloud) # Função para criar uma nuvem de palavras
library(magrittr)
library(dplyr)
library(ggplot2)
library(tm)

# Carregar o texto do PDF
text <- pdf_text("./Introduction to Data Science_Curriculum_v 6.0.pdf")

# Criar um data frame com a estrutura necessária
text_df <- data.frame(line = 1:length(text), text = text)

# Tokenizar as palavras e remover as stopwords
text_tok <- text_df %>%
  unnest_tokens(word, text) %>%
  anti_join(stop_words)

# Remover números e a palavra específica "v_6.0"
text_tok <- text_tok %>%
  filter(!grepl("^\\d+$", word)) %>%
  filter(word != "v_6.0")

# Calcular a frequência das palavras
word_freq <- text_tok %>% 
  count(word, sort = TRUE)

top_words <- head(word_freq, 60)

# Criar a nuvem de palavras com estilo mais sutil
wordcloud(words = top_words$word, freq = top_words$n, scale=c(3,0.5),
          colors = brewer.pal(8, "Dark2"), random.order = FALSE,
          random.color = FALSE, max.words = 100, min.freq = 2)
