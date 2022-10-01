import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';

class AppMethods {
  late UserBloc userBloc;
  late SalesOrgBloc salesOrgBloc;
  AppMethods({
    required UserBloc userBlocVal,
    required SalesOrgBloc salesOrgBlocVal,
  }) {
    userBloc = userBlocVal;
    salesOrgBloc = salesOrgBlocVal;
  }
  //  Method to fetch pickAndPack value

  //  MATERIAL LIST:-
  //  Condition 1: Must be sales rep
  //  Condition 2: If SG user then pickAndPack = "include"
  //  Condition 3: For Covid Tab Materials and Non-SG user, pickAndPack = "only"
  //  Condition 4: Rest Cases pickAndPack = ""

  //  SEARCH BONUS:-
  //  Condition 1: Must be sales rep
  //  Condition 2: If SG and MY user, then pickAndPack = "include"
  //  Condition 3: rest Cases pickAndPack = ""

  String getPickAndPackValue(
    bool ispickandpackenabled, {
    bool isFromBonusSearchAndValidate = false,
  }) {
    var country = salesOrgBloc.state.salesOrganisation.salesOrg.country;
    if (country == 'SG' ||
        (country == 'TH' && checkOrderTypeEnable) ||
        (isFromBonusSearchAndValidate &&
            (country == 'SG' ||
                country == 'MY' ||
                country == 'PH' ||
                (country == 'TH' && checkOrderTypeEnable)))) {
      return 'include';
    } else if (ispickandpackenabled) {
      return 'only';
    } else {
      return '';
    }
  }

  ///Method to check if user is salesrep user Disable Order Type is false
  ///Also if selected sales org is TH and enableOrderType is true respect to the logged in user
  bool get checkOrderTypeEnable {
    var myUser = userBloc.state.user;
    var salesOrgState = salesOrgBloc.state;
    if (myUser.role.type.loginUserType == 'salesRep' &&
        !salesOrgState.configs.disableOrderType) {
      if (salesOrgState.salesOrganisation.salesOrg.country == 'TH' &&
          !myUser.enableOrderType) {
        return false;
      }

      return true;
    }

    return false;
  }
}
