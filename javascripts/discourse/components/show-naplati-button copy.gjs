import Component from "@glimmer/component";
import { action } from "@ember/object";
import { service } from "@ember/service";
import { popupAjaxError } from "discourse/lib/ajax-error";

export default class ShowNaplatiButton extends Component {
  @service currentUser;

  @action
  async ShowNaplati() {
    try {
      const post = this.args.context;
      const postNumber = post?.post_number;
      const topicId = post?.topic_id;
      const username = this.currentUser.username;

      if (!postNumber || !topicId) {
        console.warn("Missing postNumber or topicId", post);
        return;
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
}
