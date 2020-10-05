library(protr)

unip = getUniProt(prot_latih_uniprot$...1[1])
for (i in c(2:nrow(prot_latih_uniprot))){
  if(i!=176&&i!=326){
    #skip(176,326)
    unip<-rbind(unip, getUniProt(prot_latih_uniprot$...1[i]))
    print(i)
  }

}

#aac<-extractAAC(unip[1][[1]])
#ctdc<-extractCTDC(unip[1][[1]])
#ctdt<-extractCTDT(unip[1][[1]])
#ctdd<-extractCTDD(unip[1][[1]])
#paac<-extractPAAC(unip[1][[1]])
dc<-extractDC(unip[1][[1]])
targetuji<-as.character(prot_latih_uniprot$...1)
protname<-targetuji[1]
for (i in c(2:(nrow(prot_latih_uniprot)-2))){
    dc<-rbind(dc,extractDC(unip[i][[1]]))
    protname<-rbind(protname, targetuji[i])
    print(i)
}
#allp<-cbind(aac,ctdc,ctdt,ctdd,paac,protname)
allp<-cbind(dc,protname)

write.csv(allp, "D:/Bela/Biofarmaka/new/covid19/data/targetlatihunip_dip.csv")
