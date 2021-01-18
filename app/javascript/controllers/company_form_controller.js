import { Controller } from "stimulus";

export default class CompanyFormController extends Controller {
  static targets = ["emailField", "emailFieldError", "submitButton"];

  invalidFields = new Set();

  connect() {
    this.emailFieldTarget.addEventListener("blur", (e) => {
      const email = e.target.value;
      if (email.length > 0 && !email.match(/@getmainstreet.com$/)) {
        e.target.classList.add("is-invalid");
        this.emailFieldErrorTarget.classList.remove("d-none");
        this.invalidFields.add("email");
      } else {
        e.target.classList.remove("is-invalid");
        this.emailFieldErrorTarget.classList.add("d-none");
        this.invalidFields.delete("email");
      }
      this.ensureDisabledIfInvalid();
    });
  }

  ensureDisabledIfInvalid() {
    this.submitButtonTarget.disabled = this.invalidFields.size > 0;
  }
}
