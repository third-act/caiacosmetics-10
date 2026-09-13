import 'package:flutter/material.dart';

/// Bottom scroll inset so tab content clears the floating TabPill.
///
/// Use with [Scaffold.extendBody] — padding belongs inside scroll views,
/// not as a viewport-shrinking wrapper around tab roots.
const kTabContentPadding = 120.0;

const tabScrollBottomInset = SliverPadding(
  padding: EdgeInsets.only(bottom: kTabContentPadding),
);
