import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="send-image"
export default class extends Controller {
  static targets = ['form', 'result']
  connect() {
    console.log('connected');
  }

  uploadImage(event) {
    event.preventDefault();
    let url = event.currentTarget.action;
    fetch(url, {
      method: 'POST',
      body: new FormData(event.currentTarget),
      headers: {
        "X-CSRF-Token": document.head.querySelector('meta[name="csrf-token"]').content,
        "Accept": "application/json"
      }
    }).then(response => response.text())
    .then(data=>{
      this.resultTarget.innerHTML = data;
    })
  }
}
