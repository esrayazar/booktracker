function submitRating(rating)
{
	console.log("rating",rating);
	document.getElementById("rateval").value = rating;
	document.getElementById("ratingForm").submit();
}

function readRating(id)
{
	console.log("rating",id);
	var radio = document.getElementById(id);
	console.log(radio);
	document.getElementById(id).checked=true;
	
}