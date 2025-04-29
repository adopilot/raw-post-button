import { apiInitializer } from "discourse/lib/api";
import ShowOtvoriButton from "../components/show-kasaProblemOtvori-button";
import ShowZatvoriButton from "../components/show-kasaProblemZatvori-button";
import ShowNaplatiButton from "../components/show-naplati-button copy";

export default apiInitializer("1.34.0", (api) => {
  const currentUser = api.getCurrentUser();
  if (!currentUser) {
    return;
  }

  if (
    !(currentUser.staff || currentUser.trust_level >= settings.min_trust_level)
  ) {
    return;
  }

  api.registerValueTransformer(
    "post-menu-buttons",
    ({
      value: dag,
      context: { firstButtonKey,lastHiddenButtonKey, secondLastHiddenButtonKey },
    }) => {
      dag.add("show-naplati", ShowNaplatiButton);
      dag.add("show-otvori", ShowOtvoriButton);
      dag.add("show-zatvori", ShowNaplatiButton);
     
    
    }
  );
});
