$(document).ready(function() {
  $("#expense_recurrence").val("never")
  var endDateSelector = function(form, nextForm, condition) {
    $(form).change(function(){
      console.log($(this).val())
      if ($(this).val() != condition) {
        $(nextForm).removeClass("hidden");
      } else {
        $(nextForm).addClass("hidden");
        $("#end-condition").val(0)
        $("#end-date-select").addClass("hidden");
      }
    })
  }

  endDateSelector("#expense_recurrence", "#end-condition", "never")
  endDateSelector("#end-condition", "#end-date-select", 0)
})