
rmProfanity <- function(file, reference){
    file <- tolower(file)
    for (i in 1:length(reference)){
        file <- gsub(pattern=reference[i], replacement= '', x=file)
    }
    return(file)
}
