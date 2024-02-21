import 'package:flutter/material.dart';

class SettingsItems {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const SettingsItems(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appSettingsItems = <SettingsItems>[
  SettingsItems(
      title: 'UI Controls + Tiles',
      subTitle: 'Una serie de controles el flutter',
      link: '/ui-control',
      icon: Icons.car_rental_outlined),
  SettingsItems(
      title: 'Introduccion a la aplicacion',
      subTitle: 'Pequeño tutorial introductorio',
      link: '/tutorial',
      icon: Icons.accessible_rounded),
  SettingsItems(
      title: 'Cambiar tema',
      subTitle: 'Cambiar tema de la aplicacion',
      link: '/theme-change',
      icon: Icons.color_lens_outlined),
];
