import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:html' as html;

import 'package:portfolio/presentation/widgets/snack_bar/custom_snackbar.dart';

class DownloadCVButton extends StatefulWidget {
  const DownloadCVButton({super.key});

  @override
  State<DownloadCVButton> createState() => _DownloadCVButtonState();
}

class _DownloadCVButtonState extends State<DownloadCVButton>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  late AnimationController _heartbeatController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _heartbeatAnimation;
  bool _isHovered = false;
  bool _isDownloading = false;

  // Path to your CV in assets
  static const String cvAssetPath = 'assets/files/dibash_thapa_cv.pdf';
  static const String cvFileName = 'dibash_thapa_cv.pdf';

  @override
  void initState() {
    super.initState();

    // Scale animation for hover
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );

    // Heartbeat animation (continuous pulse)
    _heartbeatController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _heartbeatAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.08)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.08, end: 1.0)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.0, end: 1.05)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 15,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.05, end: 1.0)
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 15,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(1.0),
        weight: 30,
      ),
    ]).animate(_heartbeatController);

    // Start heartbeat animation
    _heartbeatController.repeat();
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _heartbeatController.dispose();
    super.dispose();
  }

  Future<void> _downloadCV() async {
    if (_isDownloading) return;

    setState(() => _isDownloading = true);

    try {
      if (kIsWeb) {
        await _downloadCVWeb();
      }

      if (mounted) {
        _showCustomSnackbar(
          context,
          message: 'CV downloaded successfully!',
          icon: Icons.check_circle,
          backgroundColor: Colors.green,
        );
      }
    } catch (e) {
      if (mounted) {
        _showCustomSnackbar(
          context,
          message: 'Failed to download CV',
          icon: Icons.error_outline,
          backgroundColor: Colors.red,
        );
      }
      debugPrint('Error downloading CV: $e');
    } finally {
      if (mounted) {
        setState(() => _isDownloading = false);
      }
    }
  }

  // Custom floating snackbar at top right
  void _showCustomSnackbar(
    BuildContext context, {
    required String message,
    required IconData icon,
    required Color backgroundColor,
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 80,
        right: 20,
        child: CustomSnackbar(
          message: message,
          icon: icon,
          backgroundColor: backgroundColor,
          onDismiss: () {
            overlayEntry.remove();
          },
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // Auto dismiss after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }

  // Web-specific download
  Future<void> _downloadCVWeb() async {
    final ByteData data = await rootBundle.load(cvAssetPath);
    final Uint8List bytes = data.buffer.asUint8List();

    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', cvFileName)
      ..click();

    html.Url.revokeObjectUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => _isHovered = true);
        _scaleController.forward();
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        _scaleController.reverse();
      },
      child: AnimatedBuilder(
        animation: Listenable.merge([_scaleAnimation, _heartbeatAnimation]),
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value * _heartbeatAnimation.value,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  colors: _isHovered
                      ? [const Color(0xFF5A52E0), const Color(0xFF4A42C0)]
                      : [const Color(0xFF6C63FF), const Color(0xFF5A52E0)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF6C63FF)
                        .withValues(alpha: _isHovered ? 0.4 : 0.3),
                    blurRadius: _isHovered ? 16 : 12,
                    offset: Offset(0, _isHovered ? 6 : 4),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: _isDownloading ? null : _downloadCV,
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _isDownloading
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              )
                            : const Icon(
                                Icons.download_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                        const SizedBox(width: 12),
                        Text(
                          _isDownloading ? 'Downloading...' : 'Download CV',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
