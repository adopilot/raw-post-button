import Component from "@glimmer/component";
import { action } from "@ember/object";
import { service } from "@ember/service";
import DButton from "discourse/components/d-button";
import { popupAjaxError } from "discourse/lib/ajax-error";

export default class ShowNaplatiButton extends Component {
  @service modal;
  @service currentUser; // <-- Inject the currentUser service

  @action
  async ShowNaplati() {
    try {
      const link = window.location.href;
      const title = document.title;
      const username = this.currentUser.username;

      window.open(
        `http://olderp.robot.ba/ipPref/Task?url=${encodeURIComponent(link)}&title=${encodeURIComponent(title)}&u=${encodeURIComponent(username)}`,
        "_blank",
        "width=1120,height=480"
      );
    } catch (e) {
      popupAjaxError(e);
    }
  }
}
