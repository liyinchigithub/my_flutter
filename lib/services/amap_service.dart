import 'package:flutter/services.dart';

class AmapService {
  static final AmapService instance = AmapService._internal();

  AmapService._internal();

  static const MethodChannel _methodChannel = MethodChannel('amap_methods');

  bool _hasAgreedPrivacyPolicy = false;  // 私有字段，存储用户是否同意隐私政策

  // 公开的getter方法，用于访问用户是否同意隐私政策的状态
  bool get hasAgreedPrivacyPolicy => _hasAgreedPrivacyPolicy;

  /// 设置是否已经包含高德隐私政策并弹窗展示显示用户查看
  void updatePrivacyShow(bool hasContains, bool hasShow) {
    _methodChannel.invokeMethod('updatePrivacyStatement', {
      'hasContains': hasContains,
      'hasShow': hasShow
    });
  }

  /// 设置是否已经取得用户同意
  void updatePrivacyAgree(bool hasAgree) {
    _methodChannel.invokeMethod('updatePrivacyStatement', {
      'hasAgree': hasAgree
    });
    _hasAgreedPrivacyPolicy = hasAgree;  // 更新内部状态
  }
}