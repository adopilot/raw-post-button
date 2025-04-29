import { apiInitializer } from "discourse/lib/api";
import ShowRawButton from "../components/show-raw-button";
import ShowAdoButton from "../components/show-ado-button";

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
      dag.add("show-raw", ShowRawButton);
      dag.add("show-ado", ShowAdoButton);
      });
    
    }
  );
});
