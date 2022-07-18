
tokenization <- function(file){
    library(tidyverse)
    library(tidytext)
    wordFreq <- as_data_frame(file) %>% unnest_tokens(word, value) %>% count(word, sort=T)

    return(wordFreq)
}
