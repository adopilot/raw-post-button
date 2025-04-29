import Component from "@glimmer/component";
import { action } from "@ember/object";
import { service } from "@ember/service";
import DButton from "discourse/components/d-button";
import FullscreenCode from "discourse/components/modal/fullscreen-code";
import { ajax } from "discourse/lib/ajax";
import { popupAjaxError } from "discourse/lib/ajax-error";

export default class ShowAdoButton extends Component {
  static hidden = true;

  @service modal;

  @action

async showRaw() {
    try {
     const link = window.location.href;
            const title = document.title;
            window.open(
              `http://dnn.robot.ba/ipPref/Task?url=${encodeURIComponent(link)}&title=${encodeURIComponent(title)}`,
              "_blank",
              "width=1120,height=480"
            );
    } catch (e) {
      popupAjaxError(e);
    }
  }

  <template>
    <DButton
      class="post-action-menu__raw-post raw-post"
      ...attributes
      @action={{this.showRaw}}
      @icon="file-lines"
      @label={{if @showLabel (themePrefix "ado_label")}}
      @title={{themePrefix "ado_title"}}
    />
  </template>
}
