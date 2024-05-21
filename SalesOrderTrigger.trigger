trigger SalesOrderTrigger on Sales_Order__c (after insert, after update) {
  for (Sales_Order__c order : Trigger.new) { 
    if (order.Status__c == 'Confirmed') {   
      String invoiceId = InvoiceServiceClient.createInvoice(order);  
    if (invoiceId != null) { // Update the sales order or create an invoice record with the invoice ID       
      }        
    }    
  }
}
