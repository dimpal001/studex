import 'package:flutter/material.dart';

class CustomAlertDialog extends StatefulWidget {
  final String title;
  final String description;
  final Color variant;
  final VoidCallback? onConfirm;
  final String confirmText;
  final String cancelText;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.description,
    this.variant = Colors.blue,
    this.onConfirm,
    this.confirmText = "Confirm",
    this.cancelText = "Cancel",
  });

  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _closeDialog() {
    _animationController.reverse().then((_) => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: Row(
          children: [
            Icon(Icons.check_circle, color: widget.variant),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                widget.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        content: Text(widget.description),
        actionsPadding: EdgeInsets.zero,
        actions: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: _closeDialog,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(12)),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      alignment: Alignment.center,
                      child: Text(
                        widget.cancelText,
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withAlpha(200),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimary
                                  .withAlpha(150),
                              width: 0.1),
                        ),
                      ),
                    ),
                  ),
                ),
                if (widget.onConfirm != null) ...[
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        widget.onConfirm?.call();
                        _closeDialog();
                      },
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(12)),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.confirmText,
                              style: TextStyle(
                                color: widget.variant,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimary
                                    .withAlpha(150),
                                width: 0.1),
                            top: BorderSide(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimary
                                    .withAlpha(150),
                                width: 0.1),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void showCustomDialog(
  BuildContext context, {
  required String title,
  required String description,
  Color variant = Colors.blue,
  VoidCallback? onConfirm,
  String confirmText = "Confirm",
  String cancelText = "Cancel",
}) {
  showDialog(
    context: context,
    builder: (context) => CustomAlertDialog(
      title: title,
      description: description,
      variant: variant,
      onConfirm: onConfirm,
      confirmText: confirmText,
      cancelText: cancelText,
    ),
  );
}
