import Component from "@glimmer/component";
import { action } from "@ember/object";
import { service } from "@ember/service";
import DButton from "discourse/components/d-button";
import FullscreenCode from "discourse/components/modal/fullscreen-code";
import { ajax } from "discourse/lib/ajax";
import { popupAjaxError } from "discourse/lib/ajax-error";
import { apiInitializer } from "discourse/lib/api";

export default class ShowNaplatiButton extends Component {
  static hidden = true;

  @service modal;

  @action

async ShowNaplati() {
    try {
            const currentUser = api.getCurrentUser();
            const link = window.location.href;
            const title = document.title;
            window.open(
              `http://olderp.robot.ba/ipPref/Task?url=${encodeURIComponent(link)}&title=${encodeURIComponent(title)}&u=${encodeURIComponent(currentUser.username)}`,
              "_blank",
              "width=1120,height=480"
            );
    } catch (e) {
      popupAjaxError(e);
    }
  }

  <template>
    <DButton
      class="post-action-menu__raw-post btn-flat"
      ...attributes
      @action={{this.ShowNaplati}}
      @icon="check"
      @label={{if @showLabel (themePrefix "naplata_label")}}
      @title={{themePrefix "naplata_title"}}
    />
  </template>
}
