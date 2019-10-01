#some code to make an interaction plot in R

#create some random data 
n=360 #sample size
nf=2    #number of factors


datasize=n
ex.data<-matrix(data = NA, nrow = datasize, ncol = nf+1)
ex.data[,1]=as.matrix(c(rep(1,datasize/2),rep(2,datasize/2)),1,datasize) #create design
ex.data[,2]=as.matrix(rep(c(1,2,3),datasize/3),datasize,1)
ex.data[,3]=rnorm(datasize)  #random data
ex.data

#make dataframe and factors
ex.data.df=as.data.frame(ex.data) 
ex.data.df$V1=as.factor(ex.data.df$V1)
ex.data.df$V2=as.factor(ex.data.df$V2)

#fit ANOVA model
xx=lm(V3~V1*V2,data=ex.data.df)
summary(aov(xx))

#interaction plot
interaction.plot(ex.data[,1], ex.data[,2], ex.data[,3])
