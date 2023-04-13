import { Application } from "stimulus";
import MobileMenuController from "./controllers/mobile_menu_controller";

const application = Application.start();
application.register("mobile-menu", MobileMenuController);

document.getElementById("mobile-menu-button").addEventListener("click", () => {
  application.getControllerForElementAndIdentifier(document.getElementById("mobile-menu-button"), "mobile-menu").toggle();
});
