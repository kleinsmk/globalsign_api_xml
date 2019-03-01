#Test url for posting soap calls too - need to adjust in XML pvoderfile
$uri = "https://test-gcc.globalsign.com/kb/ws/v1/ManagedSSLService"
#request format 
$result = Invoke-WebRequest -Uri $uri -InFile .\pvorder.xml –contentType "text/xml" –method POST

#cast result to xml
[xml]$result.content

#error message in xml 
$response.Envelope.Body.PVOrderResponse.Response.OrderResponseHeader.Errors.error

#success code variable location
$response.Envelope.Body.PVOrderResponse.Response.OrderResponseHeader.SuccessCode

#parsed cert
$xml.Envelope.Body.PVOrderResponse.Response.PVOrderDetail.Fulfillment.ServerCertificate.X509Cert

#Link for managment website
https://test-gcc.globalsign.com/bm

#must be output in type ascii to get a utf-8 encoded file format wihtout BOM
$xml.Envelope.Body.PVOrderResponse.Response.PVOrderDetail.Fulfillment.ServerCertificate.X509Cert | Out-File -FilePath C:\Users\551479\Desktop\sky.test.com.crt -Encoding ascii