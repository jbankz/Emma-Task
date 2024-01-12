import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wat_mobile/ui/features/authentication/data/repository/module/module.dart';
import 'package:wat_mobile/ui/features/authentication/data/service/auth_service_impl.dart';
import 'package:wat_mobile/ui/features/authentication/domain/service/auth_service.dart';

final authServiceModule = Provider<AuthService>(
    (ref) => AuthServiceImpl(repository: ref.read(authRepoModule)));
