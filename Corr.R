corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
    
    ##Obtenemos los archivos que cumplen la condicion
    arcnames <- list.files(directory)
    
    ##Obtenemos el full name integrandolo con el directorio
    arcdir <- file.path(directory, arcnames) 
    
    ##¿Cuantos archivos hay?¿Sera el numero de renglones del frame
    nrengs<-length(arcnames)
    
    ##Creacion del frame
    dat<-data.frame()
    
    cor_vector <-vector(mode="numeric", length=0)
    
    ##ciclo de creacion del data frame
    for (i in 1:nrengs){
      
      ##Leemos el archivo y asignamos el atributo segun corresponda

      dat <- read.csv(arcdir[i])
      
      gooddata<- complete.cases(dat)
      
      dat <- dat[gooddata, ] 
      ##aplicamos el treshold solo a los datos buenos y minimizamos
      ##el set de datos de acuerdo a lo requerido
      if (nrow(dat) > threshold) { 
      correl <- cor(dat[["sulfate"]], dat[["nitrate"]]) 
      cor_vector <- append(cor_vector, correl)  
      } 
      ##Si no cumple el treshold se hace nada
    }
    ##Imprimimos el vector, si no hay dato se va con el default de 0
    ##Si lo hay se imprime el vector
    cor_vector
}
