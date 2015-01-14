complete <- function(directory, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return a data frame of the form:
        ## id nobs
        ## 1  117
        ## 2  1041
        ## ...
        ## where 'id' is the monitor ID number and 'nobs' is the
        ## number of complete cases
        
        
        ##Obtenemos los archivos que cumplen la condicion
        arcnames <- sprintf("%03d.csv", id)
        
        ##Obtenemos el full name integrandolo con el directorio
        arcdir <- file.path(directory, arcnames) 
        
        ##¿Cuantos archivos hay?¿Sera el numero de renglones del frame
        nrengs<-length(arcdir)
        
        ##Creacion del frame
        dat<-data.frame()
        
        ##ciclo de creacion del data frame
        for (i in 1:nrengs){
                
                ##Leemos el archivo y asignamos el atributo segun corresponda
                dat1<- read.csv(arcdir[i])
                dat[i,"id"]<- id[i]
                dat[i,"nobs"]<-sum(complete.cases(dat1))
        }
        ##regresamos el Frame
        dat
}
