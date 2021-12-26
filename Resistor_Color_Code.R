RCB=function(resistor){
  #le tableau de donees
  bande1_2 =as.character(0:9)
  colors_=c('black','brown','red','orange','yellow','green','blue','violet','grey','white')
  bande3 = c( '','0','00','000','0000','00000','000000','0000000','00000000','000000000')
  df=data.frame(colors_,bande1_2,bande3)
  #Remplacer resistor en une list de char
  num=unlist(strsplit(toString(resistor),split = ''))
  col1=df[df$bande1_2==num[1],1] #on recupere la couleur du digit 1
  col2=df[df$bande1_2==num[2],1] #on recupere la couleur du digit 2
  if(length(num)==2)
    col3=df[1,1]
  else{
    num=stringr::str_c(num[3:length(num)],collapse = '')
    if(num %in% df[,3])
      col3=df[df$bande3==num,1]
    else
      col3=df[df$bande1_2==num,1]
     }

  return(c(col1,col2,col3))
}
#test
RCB(68000);RCB(22);RCB(48);RCB(1800)