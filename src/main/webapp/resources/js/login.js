function validateUser() {
	var username = $('#userName').val();
	var password = $('#password').val();

	if (username == "" || password == "") {
		Swal.fire("Kindy Enter the details");
		return false;
	}
	return true;
}