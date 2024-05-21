@RestResource(urlMapping='/InvoiceUpdates/*')
global class InvoiceWebhookService {     @HttpPost     
global static void updateInvoiceStatus() {    
  RestRequest req = RestContext.request;         // Deserialize the request body to get the invoice ID and new status 
Map<String, Object> requestBody = (Map<String, Object>) JSON.deserializeUntyped(req.requestBody.toString());     
String invoiceId = (String)requestBody.get('invoiceId');     
String status = (String)requestBody.get('status');     // Query for the invoice record in Salesforce and update its status   
  Invoice__c invoice = [SELECT Id, Status__c FROM Invoice__c WHERE InvoiceID__c = :invoiceId LIMIT 1];     
    if (invoice != null) {             invoice.Status__c = status;     
        update invoice;       
                         }   
} 
}
