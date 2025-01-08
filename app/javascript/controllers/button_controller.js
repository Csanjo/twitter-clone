import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="button"
export default class extends Controller {
  static targets = ["button"]

  connect() {
    this.buttonTarget.addEventListener('mouseenter', () => this.onHover());
    this.buttonTarget.addEventListener('mouseleave', () => this.onLeave());
  }
  toggleActive() {

    this.buttonTarget.classList.toggle("btn-active")

    if (this.buttonTarget.classList.contains("btn-active")) {
      this.buttonTarget.textContent = "Following";  //
    } else {
      this.buttonTarget.textContent = "Follow";
  }
 }

 onHover() {
  if (this.buttonTarget.classList.contains("btn-active")) {
    this.buttonTarget.textContent = "Unfollow";
  }
}

onLeave() {
  if (this.buttonTarget.classList.contains("btn-active")) {
    this.buttonTarget.textContent = "Following";  // Revert text when active and not hovered
  }
}
}
