import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../app/core/network/module/module.dart';
import '../auth_source.dart';
import '../auth_source_impl.dart';

final authSourceModule = Provider<AuthSource>(
    (ref) => AuthSourceImpl(dioClient: ref.read(dioClientProvider)));
