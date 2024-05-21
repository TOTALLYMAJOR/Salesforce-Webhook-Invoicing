public class InvoiceServiceClient {  private static final String ENDPOINT_URL = 'callout:InvoiceService'; 
  
  public static String createInvoice(Sales_Order__c order) {         // Prepare request      
  HttpRequest req = new HttpRequest();      
  req.setEndpoint(ENDPOINT_URL + '/invoices');  
  req.setMethod('POST');      
  req.setHeader('Content-Type', 'application/json');         // Include the sales order data in the request body    
  req.setBody(JSON.serialize(order));                  // Send request     
  Http http = new Http();         HttpResponse res = http.send(req);                  // Handle response        
  if (res.getStatusCode() == 200) {             // Parse the response to extract the invoice ID 
  Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());   
  return (String)result.get('invoiceId');         
  }else {  
  // Handle errors           
  System.debug('Error creating invoice: ' + res.getBody());  
  return null;        
    }  
  } 
}


