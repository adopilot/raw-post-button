import Component from "@glimmer/component";
import { action } from "@ember/object";
import { service } from "@ember/service";
import DButton from "discourse/components/d-button";
import FullscreenCode from "discourse/components/modal/fullscreen-code";
import { ajax } from "discourse/lib/ajax";
import { popupAjaxError } from "discourse/lib/ajax-error";

export default class ShowZatvoriButton extends Component {
  static hidden = true;

  @service modal;

  @action

async ShowZatvori() {
    try {
      const link = window.location.href;
            window.open(
              `http://core.rgt.ba/ProblemiKasa/Zatvori?url=${encodeURIComponent(link)}`,
              "_blank",
              "width=800,height=600"
            );
    } catch (e) {
      popupAjaxError(e);
    }
  }

  <template>
    <DButton
      class="post-action-menu__raw-post btn-flat"
      ...attributes
      @action={{this.ShowZatvori}}
      @icon="cart-arrow-down"
      @label={{if @showLabel (themePrefix "zatvori_label")}}
      @title={{themePrefix "zatvori_title"}}
    />
  </template>
}
