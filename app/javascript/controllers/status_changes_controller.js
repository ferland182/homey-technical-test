import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["select"];

  connect() {
    console.log("Status change controller connected!")
  }

  change(event) {
    const form = event.target.form;
    const formData = new FormData(form);

    fetch(form.action, {
      method: form.method,
      body: formData,
      headers: { "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content },
    })
      .then(response => {
        if (response.ok) {
          return response.text()
        } else {
          throw new Error("Network response was not ok.")
        }
      })
  }
}
