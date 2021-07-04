import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proximity/app/animated_align/animated_align_page.dart';
import 'package:proximity/app/animated_container/animated_container_page.dart';
import 'package:proximity/app/animated_padding/animated_padding.dart';
import 'package:proximity/app/animated_positioned/animated_positioned_page.dart';
import 'package:proximity/app/autocomplete_core/autocomplete_core_page.dart';
import 'package:proximity/app/device_info_plus/device_info_plus_page.dart';
import 'package:proximity/app/flutter_progress_hud/flutter_progress_hud_page.dart';
import 'package:proximity/app/package_info_plus/package_info_plus_page.dart';
import 'package:proximity/app/radio_list_tile/radio_list_tile.dart';
import 'package:proximity/app/reorderable_list_view/reorderable_list_view_page.dart';
import 'package:proximity/app/show_modal_bottom_sheet/show_modal_bottom_sheet.dart';
import 'package:proximity/app/slider/slider_page.dart';
import 'package:proximity/app/url_launcher/url_launcher_page.dart';

import '../align/align_page.dart';
import '../animated_switcher/animated_switcher.dart';
import '../expanded/expanded_page.dart';
import '../expansion_panel/expansion_panel_page.dart';
import '../flexible/flexible_page.dart';
import '../fractionally_sized_box/fractionally_sized_box.dart';
import '../indexed_stack/indexed_stack_page.dart';
import '../physical_model/physical_model.dart';
import '../rotated_box/rotated_box.dart';
import '../scrollbar/scrollbar_page.dart';
import '../search_delegate/search_delegate_page.dart';
import '../sliver/sliver_app_bar_page.dart';
import '../sliver/sliver_list_and_sliver_grid_view_page.dart';
import '../sliver/sliver_page.dart';
import '../switch_list_tile/switch_list_tile_page.dart';
import '../table/table_page.dart';
import 'algolia_page.dart';

class AlgoliaSearchIndex {
  final String name;
  final String description;
  final List<String> tag;
  final String gif;

  AlgoliaSearchIndex(this.name, this.description, this.tag, this.gif);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'tag': tag,
      'gif': gif,
    };
  }

  factory AlgoliaSearchIndex.fromMap(Map<String, dynamic> map) {
    return AlgoliaSearchIndex(
      map['name'],
      map['description'],
      List<String>.from(map['tag']),
      map['gif'],
    );
  }

  String toJson() => json.encode(toMap());

  static Widget retrieveWidget(String widgetName) {
    switch (widgetName) {
      case 'AnimatedPadding':
        {
          return AnimatedPaddingPage();
        }
      case 'RadioListTile':
        {
          return RadioListTilePage();
        }
      case 'PackageInfoPlus':
        {
          return PackageInfoPlusPage();
        }
      case 'DeviceInfoPlus':
        {
          return DeviceInfoPlusPage();
        }
      case 'UrlLauncher':
        {
          return UrlLauncherPage();
        }
      case 'FlutterProgressHud':
        {
          return FlutterProgressHudPage();
        }
      case 'showModalBottomSheet':
        {
          return ShowModalBottomSheetPage();
        }
      case 'AutocompleteCore':
        {
          return AutocompleteCorePage();
        }
      case 'AnimatedContainer':
        {
          return AnimatedContainerPage();
        }
      case 'AnimatedAlign':
        {
          return AnimatedAlignPage();
        }
      case 'AnimatedPositioned':
        {
          return AnimatedPositionedPage();
        }
      case 'ReorderableListView':
        {
          return ReorderableListViewPage();
        }
      case 'Slider':
        {
          return SliderPage();
        }
      case 'Expanded':
        {
          return ExpandedPage();
        }
      case 'Flexible':
        {
          return FlexiblePage();
        }
      case 'Align':
        {
          return AlignPage();
        }
      case 'FractionallySizedBox':
        {
          return FractionallySizedBoxPage();
        }
      case 'IndexedStack':
        {
          return IndexedStackPage();
        }
      case 'Sliver':
        {
          return SliverPage();
        }
      case 'SliverAppBar':
        {
          return SliverAppBarPage();
        }
      case 'SliverListAndSliverGridView':
        {
          return SliverListAndSliverGridViewPage();
        }
      case 'Algolia':
        {
          return AlgoliaPage();
        }
      case 'Search':
        {
          return SearchDelegatePage();
        }
      case 'Table':
        {
          return TablePage();
        }
      case 'SwitchListTile':
        {
          return SwitchListTilePage();
        }
      case 'AnimatedSwitcher':
        {
          return AnimatedSwitcherPage();
        }
      case 'RotatedBox':
        {
          return RotatedBoxPage();
        }
      case 'Scrollbar':
        {
          return ScrollbarPage();
        }
      case 'ExpansionPanel':
        {
          return ExpansionPanelPage();
        }
      case 'PhysicalModel':
        {
          return PhysicalModelPage();
        }
      default:
        return AlgoliaPage();
    }
  }
}

class AlgoliaIndex {
  static final index = [
    {
      'name': 'AnimatedPadding',
      'description':
          'Animated version of Padding which automatically transitions the indentation over a given duration whenever the given inset changes.',
      'tag': ['null safety', 'package', 'video'],
      'gif': 'assets/gif/animated_padding.gif'
    },
    {
      'name': 'RadioListTile',
      'description':
          'A ListTile with a Radio. In other words, a radio button with a label.',
      'tag': [
        'null safety',
        'widget',
      ],
      'gif': 'assets/gif/radio_list_tile.gif'
    },
    {
      'name': 'PackageInfoPlus',
      'description':
          'This Flutter plugin provides an API for querying information about an application package.',
      'tag': ['null safety', 'package'],
      'gif': 'assets/gif/package_info_plus.gif'
    },
    {
      'name': 'DeviceInfoPlus',
      'description':
          'Get current device information from within the Flutter application.',
      'tag': [
        'null safety',
        'package',
      ],
      'gif': 'assets/gif/device_info_plus.gif'
    },
    {
      'name': 'UrlLauncher',
      'description':
          'A Flutter plugin for launching a URL. Supports iOS, Android, web, Windows, macOS, and Linux.',
      'tag': [
        'null safety',
        'package',
      ],
      'gif': 'assets/gif/url_launcher.gif'
    },
    {
      'name': 'FlutterProgressHud',
      'description':
          'Highly customizable modal progress indicator with fade animation.',
      'tag': [
        'null safety',
        'package',
      ],
      'gif': 'assets/gif/flutter_progress_hud.gif'
    },
    {
      'name': 'showModalBottomSheet',
      'description': 'Shows a modal material design bottom sheet.',
      'tag': [
        'null safety',
        'widget',
      ],
      'gif': 'assets/gif/show_modal_bottom_sheet.gif'
    },
    {
      'name': 'AutocompleteCore',
      'description':
          'A widget, Autocomplete, that allows the user to select one option among many',
      'tag': ['null safety', 'widget'],
      'gif': 'assets/gif/autocomplete.gif'
    },
    {
      'name': 'AnimatedContainer',
      'description':
          'Animated version of Container that gradually changes its values over a period of time.',
      'tag': ['null safety', 'widget', 'video'],
      'gif': 'assets/gif/animated_container.gif'
    },
    {
      'name': 'AnimatedAlign',
      'description':
          'Animated version of Align which automatically transitions the child\'s position over a given duration whenever the given alignment changes.',
      'tag': ['null safety', 'widget'],
      'gif': 'assets/gif/animated_align.gif'
    },
    {
      'name': 'AnimatedPositioned',
      'description':
          'Animated version of Positioned which automatically transitions the child\'s position over a given duration whenever the given position changes.',
      'tag': ['null safety', 'widget', 'video'],
      'gif': 'assets/gif/animated_positioned.gif'
    },
    {
      'name': 'ReorderableListView',
      'description':
          'A list whose items the user can interactively reorder by dragging.',
      'tag': ['null safety', 'widget', 'video'],
      'gif': 'assets/gif/reorderable_list_view.gif'
    },
    {
      'name': 'Slider',
      'description': 'A Material Design slider.',
      'tag': ['null safety', 'widget', 'video'],
      'gif': 'assets/gif/slider.gif'
    },
    {
      'name': 'Expanded',
      'description':
          'A widget that expands a child of a Row, Column, or Flex so that the child fills the available space.',
      'tag': ['null safety', 'widget', 'video'],
      'gif': 'assets/gif/expanded.gif'
    },
    {
      'name': 'Flexible',
      'description':
          'A widget that controls how a child of a Row, Column, or Flex flexes.',
      'tag': ['null safety', 'widget', 'video'],
      'gif': 'assets/gif/flexible.gif'
    },
    {
      'name': 'Align',
      'description':
          'A widget that aligns its child within itself and optionally sizes itself based on the child\'s size.',
      'tag': ['null safety', 'widget', 'video'],
      'gif': 'assets/gif/align.gif'
    },
    {
      'name': 'FractionallySizedBox',
      'description':
          'A widget that sizes its child to a fraction of the total available space.',
      'tag': ['null safety', 'widget', 'video'],
      'gif': 'assets/gif/fractionally_sized_box.gif'
    },
    {
      'name': 'IndexedStack',
      'description':
          'A Stack that shows a single child from a list of children.',
      'tag': ['null safety', 'widget', 'video'],
      'gif': 'assets/gif/indexed_stack.gif'
    },
    {
      'name': 'Sliver',
      'description':
          'A sliver is a portion of a scrollable area that you can define to behave in a special way.',
      'tag': ['null safety', 'widget', 'video'],
      'gif': 'assets/gif/sliver_app_bar.gif'
    },
    {
      'name': 'SliverAppBar',
      'description':
          'A material design app bar that integrates with a CustomScrollView.',
      'tag': ['null safety', 'widget', 'video'],
      'gif': 'assets/gif/sliver_app_bar.gif'
    },
    {
      'name': 'SliverListAndSliverGridView',
      'description':
          'A sliver that places multiple box children in a two dimensional arrangement. A sliver that places multiple box children in a linear array along the main axis.',
      'tag': ['null safety', 'widget', 'video'],
      'gif': 'assets/gif/sliver_list_and_sliver_grid_view.gif'
    },
    {
      'name': 'Algolia',
      'description': 'full-text search, typo tolerant',
      'tag': ['null safety', 'plugin'],
      'gif': 'assets/gif/algolia.gif'
    },
    {
      'name': 'Search',
      'description': 'Text search in Flutter',
      'tag': ['null safety', 'video'],
      'gif': 'assets/gif/search_delegate.gif'
    },
    {
      'name': 'Table',
      'description':
          'A widget that uses the table layout algorithm for its children.',
      'tag': ['null safety', 'video', 'widget'],
      'gif': 'assets/gif/table.gif'
    },
    {
      'name': 'SwitchListTile',
      'description':
          'A ListTile with a Switch. In other words, a switch with a label.',
      'tag': ['null safety', 'video', 'widget'],
      'gif': 'assets/gif/switch_list_tile.gif'
    },
    {
      'name': 'AnimatedSwitcher',
      'description': 'Animated cross-fade between 2 widgets.',
      'tag': ['null safety', 'video', 'widget'],
      'gif': 'assets/gif/animated_switcher.gif'
    },
    {
      'name': 'RotatedBox',
      'description':
          'A widget that rotates its child by a integral number of quarter turns.',
      'tag': ['null safety', 'video', 'widget'],
      'gif': 'assets/gif/rotated_box.gif'
    },
    {
      'name': 'Scrollbar',
      'description': 'A Material Design scrollbar.',
      'tag': ['null safety', 'video', 'widget'],
      'gif': 'assets/gif/scrollbar.gif'
    },
    {
      'name': 'ExpansionPanel',
      'description': 'A material expansion panel.',
      'tag': ['null safety', 'video', 'widget'],
      'gif': 'assets/gif/expansion_panel.gif'
    },
    {
      'name': 'PhysicalModel',
      'description':
          'A widget representing a physical layer that clips its children to a shape.',
      'tag': ['null safety', 'video', 'widget'],
      'gif': 'assets/gif/physical_model.gif'
    },
  ];
}
