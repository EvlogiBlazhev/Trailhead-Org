public class AnimalLocator {

    public class clsAnimal {
        public Integer id;	
		public String name;	
		public String eats;	
		public String says;
    }
	
    public class JSONoutput{
        public clsAnimal animal;
    }    
    	
    public static String getAnimalNameById(Integer i){
        JSONoutput results;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + i);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        if(response.getStatusCode() == 200){
            results = (JSONoutput) JSON.deserialize(response.getBody(), JSONoutput.class);   
        }
        return(results.animal.name);
    }
}