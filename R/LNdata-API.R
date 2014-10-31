library(RCurl)
#install.packages('rjson')
library(rjson)
lndata_api_key<-'6df0f39e1b9f4dc86c735abdbcbf093bc41c31e3'

curl<-getCurlHandle()
#curlSetOpt(curl=curl,.opts=list(COOKIE=strCookie))
#curlSetOpt(curl=curl,.opts=list(USERAGENT="Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:28.0)$
#curlSetOpt(curl=curl,.opts=list(HTTPHEADER=c("Accept: text/html,application/xhtml+xml,appli$
#                                  "Accept-Language: en-US,en;q=0.5",
#                                paste("Accept-Encoding: gzip, deflate", "Conn$
#                                             "Content-Length: 406",
#                                              paste('Cookie: ',strCookie,'; ckLng=ESP; __u$
#                                              "Pragma: no-cache", "Cache-Control: no-cache"$
#          )
#curlSetOpt(curl=curl,.opts=list(POST=1))
#curlSetOpt(curl=curl,.opts=list(POSTFIELDS='{"aEstadoTabla":[{"TablaNombre":"tbAcciones","F$
                                        

get_lndata<-function(dataset){
  query_url<-paste('http://lanacion.cloudapi.junar.com/datastreams/invoke/',dataset,'?auth_key=',lndata_api_key,sep='')  
  ret_json<-getURL(query_url, write = basicTextGatherer(),curl=curl)  
  ret<-fromJSON(ret_json)
  ret
}

get_lndata('IPC-CIUDA-AUTON-DE-BUENO')

get_lndata('VARIA-DE-LA-INFLA-EN')

