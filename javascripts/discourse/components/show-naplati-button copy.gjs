import Component from "@glimmer/component";
import { action } from "@ember/object";
import { service } from "@ember/service";
import DButton from "discourse/components/d-button";
import FullscreenCode from "discourse/components/modal/fullscreen-code";
import { ajax } from "discourse/lib/ajax";
import { popupAjaxError } from "discourse/lib/ajax-error";

export default class ShowNaplatiButton extends Component {
  static hidden = true;

  @service modal;
  @service currentUser; // <-- Inject the currentUser service
  @action

async ShowNaplati() {
    try {
      
    const postNumber = this.args.post?.post_number;
    const topicId = this.args.post?.topic_id;
    const username = this.currentUser.username;
    
    const username = this.currentUser.username;

    if (!postNumber || !topicId) {
      throw new Error("Cannot determine post or topic ID");
    }
    
    const permalink = `${window.location.origin}/t/${topicId}/${postNumber}`;    

            window.open(
              `http://olderp.robot.ba/ipPref/Task?url=${encodeURIComponent(permalink)}&u=${encodeURIComponent(username)}`,
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
