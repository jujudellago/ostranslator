$(document).on('turbolinks:load', function() {
  $(".info-row").parent("tr").addClass("info");
  $(".danger-row").parent("tr").addClass("danger");
  $(".success-row").parent("tr").addClass("success");


  $('.data_table').DataTable({
  	"pageLength": 50
	});
});
