import 'package:flutter/material.dart';

enum AppAlertType { error, info, success }

class AppAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final AppAlertType type;
  final VoidCallback? onOk;

  const AppAlertDialog({
    super.key,
    required this.title,
    required this.message,
    required this.type,
    this.onOk,
  });

  Color get _color {
    switch (type) {
      case AppAlertType.error:
        return Colors.red;
      case AppAlertType.success:
        return Colors.green;
      case AppAlertType.info:
      default:
        return Colors.blue;
    }
  }

  IconData get _icon {
    switch (type) {
      case AppAlertType.error:
        return Icons.error_outline;
      case AppAlertType.success:
        return Icons.check_circle_outline;
      case AppAlertType.info:
      default:
        return Icons.info_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Icon(_icon, color: _color),
          const SizedBox(width: 8),
          Text(title, style: TextStyle(color: _color)),
        ],
      ),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            if (onOk != null) onOk!();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }

  // Método estático para mostrar o alerta facilmente
  static Future<void> showAlert(
    BuildContext context, {
    required String title,
    required String message,
    required AppAlertType type,
    VoidCallback? onOk,
  }) {
    return showDialog(
      context: context,
      builder: (_) => AppAlertDialog(
        title: title,
        message: message,
        type: type,
        onOk: onOk,
      ),
    );
  }
}