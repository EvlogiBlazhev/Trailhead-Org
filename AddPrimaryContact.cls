public class AddPrimaryContact implements Queueable {

	private Contact contact;
	private String state;

	public AddPrimaryContact(Contact c, String state){
		this.contact = c;
		this.state = state;	
	}

	public void execute(QueueableContext context) {

		List<Account> accts = [select id
							   from Account 
							   where BillingState =: state limit 200];

		List<Contact> clonedContacts = new List<Contact>();
        
        for(Account a: accts){
        	Contact c = new Contact();
        	c = this.contact.clone(false,false,false,false);
        	c.AccountId = a.id;

        	clonedContacts.add(c);
        }

        insert clonedContacts;
	}
}