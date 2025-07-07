---
title: "Contact"
date: 2017-01-24
draft: false
---
{{< rawhtml >}}

<button id="zammad-feedback-form">Feedback</button>

<script id="zammad_form_script" src="https://ticket.secure-bits.org/assets/form/form.js"></script>

<script>
$(function() {
  $('#zammad-feedback-form').ZammadForm({
    messageTitle: 'Feedback-Formular',
    messageSubmit: 'Übermitteln',
    messageThankYou: 'Vielen Dank für Ihre Anfrage (#%s). Wir melden uns umgehend.',
    modal: true
  });
});
</script>
{{< /rawhtml >}}
