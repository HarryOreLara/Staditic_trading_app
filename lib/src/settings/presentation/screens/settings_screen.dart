import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:staditic_trading_app/src/settings/infraestructure/constants/menu_items.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Configuracion",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
            onPressed: () {
              context.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: appSettingsItems.length,
      itemBuilder: (context, index) {
        final menuItem =
            appSettingsItems[index]; //esta es una instanacia del menuItem
        return _CustomListTile(
            menuItem: menuItem); //mando la instancia para la lista
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final SettingsItems menuItem;

  const _CustomListTile({
    required this.menuItem,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final styleText = Theme.of(context).textTheme;
    return ListTile(
      leading: Icon(
        menuItem.icon,
        color: colors.secondary,
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: colors.secondary,
      ),
      title: Text(
        menuItem.title,
        style: styleText.labelMedium,
      ),
      subtitle: Text(
        menuItem.subTitle,
        style: styleText.labelSmall,
      ),
      onTap: () {
        //Navigator.pushNamed(context, menuItem.link);
        context.push(menuItem.link);
        //context.pushNamed(CardsScreen.name);
      },
    );
  }
}
