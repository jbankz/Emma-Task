import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wat_mobile/ui/features/authentication/data/source/module/module.dart';

import '../../../domain/repository/auth_repository.dart';
import '../auth_repository_impl.dart';

final authRepoModule = Provider<AuthRepository>(
    (ref) => AuthRepositoryImpl(source: ref.read(authSourceModule)));
