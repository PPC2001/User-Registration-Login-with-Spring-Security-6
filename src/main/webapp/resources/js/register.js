$(document).ready(function() {

});

function registerUser() {
	var username = $('#userName').val();
	var mobileNo = $('#mobileNo').val();
	var email = $('#email').val();
	var password = $('#password').val();

	if (username == "" || mobileNo == "" || email == "" || password == "") {
		Swal.fire("Kindy Enter the details");
		return false;
	} else {
		submitUserDetails();
	}
}

function submitUserDetails() {
	var userVO = $('#userVO').serialize();

	$.ajax({
		type: "POST",
		url: "http://localhost:6060/api/register/save",
		data: userVO,
		success: function(responseData) {
			console.log(responseData);
			if (responseData != undefined) {
				if (responseData.errMessage != null) {
					Swal.fire({
						icon: 'error',
						title: responseData.errMessage,
						timer: 1500
					});
				}

				if (responseData.successMsg != null) {
					Swal.fire({
						icon: 'success',
						title: responseData.successMsg,
						showConfirmButton: false,
						timer: 1500
					});
					$('#userVO')[0].reset();
				}
			}
		},
		error: function() {
			// Handle network or server error (if needed)
		}
	});
}

/*console.log('responseData.successMsg - ' + responseData.successMsg);
*/