// app/javascript/controllers/comments_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["content", "list"]

  connect() {
    console.log("Comments controller connected!")
  }

  submit(event) {
    event.preventDefault() // Prevent the default form submission

    const form = this.element
    const formData = new FormData(form)

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
      .then(html => {
        this.listTarget.insertAdjacentHTML("beforeend", html) // Append the new comment to the list
        this.contentTarget.value = "" // Clear the textarea
      })
      .catch(error => {
        console.error("Error:", error)
      })
  }
}
