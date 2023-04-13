// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

import { Application } from "@hotwired/stimulus";
import MobileMenuController from "./controllers/mobile_menu_controller";

const application = Application.start();
application.register("mobile-menu", MobileMenuController);

document.getElementById("mobile-menu-button").addEventListener("click", () => {
  application.getControllerForElementAndIdentifier(document.getElementById("mobile-menu-button"), "mobile-menu").toggle();
});
