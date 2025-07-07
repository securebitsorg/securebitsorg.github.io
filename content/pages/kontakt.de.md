---
title: "Kontakt"
date: 2017-01-24
draft: false
---
## Hast du eine Frage oder ein Feedback für mich?

{{< rawhtml >}}
<button id="zammad-feedback-form">Feedback</button>

<script id="zammad_form_script" src="https://ticket.secure-bits.org/assets/form/form.js"></script>

<script>
$(function() {
  $('#zammad-feedback-form').ZammadForm({
    agreementMessage: 'Datenschutzerklärung und Nutzungsbedingungen akzeptieren',
    messageTitle: 'Feedback-Formular',
    messageSubmit: 'Übermitteln',
    messageThankYou: 'Vielen Dank für Ihre Anfrage (#%s). Wir melden uns umgehend.',
    showTitle: true,
    modal: true
  });
});
</script>
{{< /rawhtml >}}