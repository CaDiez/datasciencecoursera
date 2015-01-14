pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
    
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
        
        ##Creamos un data frame vacío
        dat <- data.frame() 
        
        ##Obtenemos los archivos que cumplen la condicion
        arcnames <- sprintf("%03d.csv", id)
        
        ##Obtenemos el full name integrandolo con el directorio
        arcdir <- file.path(directory, arcnames)        
        #ciclo de creacion del data frame
        for (i in 1:length(arcdir)){
               dat <- rbind(dat, read.csv(arcdir[i]))
        }
        ##Se calcula la media de todos los renglones especificamente para 
        ##el contaminante (popllutant) deseado
        pollutant_mean<-mean(dat[,pollutant],na.rm=T)
        ##Resultado de la funcion
        pollutant_mean
}
