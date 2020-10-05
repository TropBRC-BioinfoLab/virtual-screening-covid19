library(rpubchem)

#import data senyawa

fps<-matrix(0,nrow(drug_latih),881) #buat matrix kosong fp
fps<-cbind(drug_latih$...1,drug_latih$...2,fps) #combine the id and name

dat <- lapply(drug_latih$...1, get.cid)
dat <- dplyr::bind_rows(dat)
str(dat)

get.cid(drug_latih$...1[1])


#mols <- parse.smiles(smiles)
for (i in c(1:392)){#nrow(allherbs))) {#nrow(newdrug2)
  print(i)
  parsed<-parse.smiles(allherbs$...1[i])
  if(!is.null(parsed[[1]])){ fp<-get.fingerprint(parsed[[1]],type='pubchem');
  fps[1,fp@bits]<-1;
  }
}