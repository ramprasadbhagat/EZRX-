import 'package:ezrxmobile/application/order/material_list/material_list_bloc.dart';
import 'package:ezrxmobile/domain/order/entities/material_info.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteIcon extends StatelessWidget {
  final MaterialInfo materialInfo;
  const FavouriteIcon({Key? key, required this.materialInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<MaterialListBloc>().add(materialInfo.isFavourite
            ? MaterialListEvent.deleteFavourite(item: materialInfo,)
            : MaterialListEvent.addFavourite(item: materialInfo,));
      },
      icon: Icon(
        materialInfo.isFavourite
        ?Icons.favorite
        :Icons.favorite_border_outlined,
        color: ZPColors.darkYellow,
      ),
    );
  }
}
