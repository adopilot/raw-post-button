import Component from "@glimmer/component";
import { action } from "@ember/object";
import { service } from "@ember/service";
import DButton from "discourse/components/d-button";
import FullscreenCode from "discourse/components/modal/fullscreen-code";
import { ajax } from "discourse/lib/ajax";
import { popupAjaxError } from "discourse/lib/ajax-error";

export default class ShowOtvoriButton extends Component {
  static hidden = true;

  @service modal;
  @service currentUser; // <-- Inject the currentUser service
  @action

async ShowOtvori() {
    try {
      
      const post = this.args.post;
      const postId = post?.id??0;
      const postNumber = post?.post_number??0;
      const topicId = post?.topic_id??0;
      const username = this.currentUser.username;
    
     const permalink = window.location.origin;
    

            window.open(
              `http://core.robot.ba/ProblemiKasa/Create?url=${encodeURIComponent(window.location.origin)}&user=${encodeURIComponent(username)}&topicId=${encodeURIComponent(topicId)}&postId=${encodeURIComponent(postId)}&postNumber=${encodeURIComponent(postNumber)}`,
              "_blank",
              "width=1120,height=800"
            );

    } catch (e) {
      popupAjaxError(e);
    }
  }

  <template>
    <DButton
      class="post-action-menu__raw-post btn-flat"
      ...attributes
      @action={{this.ShowOtvori}}
      @icon="cart-plus"
      @label={{if @showLabel (themePrefix "otvori_label")}}
      @title={{themePrefix "otvori_title"}}
    />
  </template>
}
