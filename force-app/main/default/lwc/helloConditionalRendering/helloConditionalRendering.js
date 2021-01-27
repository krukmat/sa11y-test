import { LightningElement } from "lwc";
 
export default class HelloConditionalRendering extends LightningElement {
  areDetailsVisible = false;
 
  get buttonStyle() {
    return `background-color:${this.areDetailsVisible ? "blue" : "red"}`;
  }
 
  toggleDetails() {
    this.areDetailsVisible = !this.areDetailsVisible;
    const button = this.template
      .querySelector("button")
      .setAttribute("aria-expanded", this.areDetailsVisible);
  }
}