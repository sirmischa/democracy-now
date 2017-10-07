
/* Function to register a voter and store them in variable 'voter' */
function register(first,last,addr,city,state,zip,social,email,phone) {
	var voter = {
		first_name:first,
		last_name:last,
		address:addr,
		city:city,
		state:state,
		zip:zip,
		social_security:social,
		email:email,
		phone:phone
	}
	console.log(voter);
}

/* Get the value inside the textarea in the voter's entry form */
function getValue(id){
	return document.getElementById(id).value;
}
