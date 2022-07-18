
nextWords <- function(rawStr,n){
    # 1. Let's remove the numbers and punctuations
    filt_list <- gsub('[[:punct:]]|[[:digit:]]', "", tolower(rawStr))
    filt_list <- unlist(strsplit(filt_list,"\\s+"))
    # 2. Extract the last 6 words for the query
    if (length(filt_list) > 6){
        filt_list <- filt_list[(length(filt_list)-5):length(filt_list)]
        filt_str <- paste(filt_list, collapse=" ")
    }else{
        filt_str <- paste(filt_list, collapse=" ")
    }

    # 3. Returns all the matched words
    pred_text <- nGramAll[filtrStr==nGramAll$query, ]$predict
    if (length(predText) > 0){
        final_text <- pred_text
    }else{
        filt_str <- paste(filt_list[2:length(filt_list)], collapse=" ")
        pred_text <- nGramAll[filtStr==nGramAll$query, ]$predict
        if(length(pred_text) > 0){
            final_text <- pred_text
        }else{
            filt_str <- paste(filt_list[4:length(filt_list)], collapse = " ")
            pred_text <- nGramAll[filt_str==nGramAll$query,]$predict
            if (length(pred_text) > 0){
                final_text <- pred_text
            }else{
                filt_str <- paste(filt_list[5: length(filt_list)], collapse= " ")
                pred_text <- nGramALl[filt_str == nGramAll$query,]$predict
                if(length(pred_text) > 0){
                    final_text <- pred_text
                }else{
                    filt_str <- paste(filt_list[6: length(filt_list)], collapse= " ")
                    pred_text <- nGramALl[filt_str == nGramAll$query,]$predict
                    if(length(pred_text) > 0){
                        final_text <- pred_text
                    }else{
                        final_text <- 'the'
                    }
                }
            }
        }
    }
    rerurn(final_text[1:n])
}