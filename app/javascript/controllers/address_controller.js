import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  static targets = ["stateSelect"]
  change(event) {
    let country = console.log(event.target.selectedOptions[0].value)
    let target = this.stateSelectTarget.id
    get('/employees/states?target=${target}country=${country}', {
      responseKind: "turbo-stream"
    })
  }
}
