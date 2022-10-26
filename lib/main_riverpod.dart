import 'dart:developer';

import 'package:enum_extension/screen/river_pod_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [ProviderLogger()],
      child: MaterialApp(
        home: RiverPodScreen(),
      ),
    ),
  );
}

class ProviderLogger extends ProviderObserver {
  @override
  void didAddProvider(ProviderBase provider, Object? value, ProviderContainer container) {
    super.didAddProvider(provider, value, container);
    log('<didAddProvider> $provider');
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    super.didDisposeProvider(provider, container);
    log('<didDisposeProvider> $provider');
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log('\n"provider": "${provider.name ?? provider.runtimeType}",\n' '"newValue": "$newValue"\n');
  }
}
