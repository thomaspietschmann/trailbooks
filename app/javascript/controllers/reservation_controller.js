import { Controller } from "stimulus";

export default class extends Controller {
  static targets = [ 'refresh' ];

  connect() {
    console.log("Hi from stimulus")
  };

  refresh(event) {
    console.log(event.detail)
    this.refreshTarget.outerHTML = event.detail[2].response
  }
}
