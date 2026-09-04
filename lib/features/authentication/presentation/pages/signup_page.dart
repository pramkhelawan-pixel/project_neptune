import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/pelav_colors.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/auth_card.dart';
import '../../../../core/widgets/primary_button.dart';
import '../providers/auth_controller.dart';

/// Public, production URLs for the legal documents -- served via GitHub
/// Pages from this repo's docs/ folder (see auth_repository.dart's
/// confirm-email/reset-password redirects for the same pattern).
const _termsUrl =
    'https://pramkhelawan-pixel.github.io/project_neptune/terms-and-conditions.html';
const _privacyUrl =
    'https://pramkhelawan-pixel.github.io/project_neptune/privacy-policy.html';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _termsTapRecognizer = TapGestureRecognizer();
  final _privacyTapRecognizer = TapGestureRecognizer();

  // Never pre-selected under any code path -- consent must be an explicit,
  // affirmative action by the user.
  bool _acceptedLegalTerms = false;

  @override
  void initState() {
    super.initState();
    _termsTapRecognizer.onTap = () => _openUrl(_termsUrl);
    _privacyTapRecognizer.onTap = () => _openUrl(_privacyUrl);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _termsTapRecognizer.dispose();
    _privacyTapRecognizer.dispose();
    super.dispose();
  }

  Future<void> _openUrl(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) return;
    if (!_acceptedLegalTerms) return;

    await ref.read(authControllerProvider.notifier).signUp(
      email: _emailController.text.trim(),
      password: _passwordController.text,
      acceptedLegalTerms: _acceptedLegalTerms,
    );

    if (!mounted) return;

    final state = ref.read(authControllerProvider);

    state.whenOrNull(
      error: (error, stackTrace) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
      },
      data: (_) {
        final hasSession =
            ref.read(authRepositoryProvider).currentSession != null;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              hasSession
                  ? 'Account created successfully.'
                  : 'Account created. Please check your email to verify your account.',
            ),
          ),
        );

        context.go(hasSession ? AppRoutes.home : AppRoutes.login);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: AuthCard(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppTextField(
                      controller: _emailController,
                      label: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icons.email_outlined,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email.';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // Always obscured, no visibility toggle -- unlike
                    // Login's password field, this is a deliberate
                    // visual-only migration and doesn't introduce the
                    // extra toggle interaction Login has.
                    AppTextField(
                      controller: _passwordController,
                      label: 'Password',
                      obscureText: true,
                      prefixIcon: Icons.lock_outline,
                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return 'Password must be at least 6 characters.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    AppTextField(
                      controller: _confirmPasswordController,
                      label: 'Confirm Password',
                      obscureText: true,
                      prefixIcon: Icons.lock_outline,
                      validator: (value) {
                        if (value != _passwordController.text) {
                          return 'Passwords do not match.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: _acceptedLegalTerms,
                          onChanged: (value) {
                            setState(() {
                              _acceptedLegalTerms = value ?? false;
                            });
                          },
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: RichText(
                              text: TextSpan(
                                style: Theme.of(context).textTheme.bodyMedium,
                                children: [
                                  const TextSpan(text: 'I agree to the '),
                                  TextSpan(
                                    text: 'Terms & Conditions',
                                    style: TextStyle(
                                      color: context.colors.primaryForeground,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: _termsTapRecognizer,
                                  ),
                                  const TextSpan(text: ' and '),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: TextStyle(
                                      color: context.colors.primaryForeground,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: _privacyTapRecognizer,
                                  ),
                                  const TextSpan(text: '.'),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    PrimaryButton(
                      text: 'Create Account',
                      isLoading: authState.isLoading,
                      onPressed: (authState.isLoading || !_acceptedLegalTerms)
                          ? null
                          : _signUp,
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Text('Already have an account?'),
                        TextButton(
                          onPressed: () => context.go(AppRoutes.login),
                          child: const Text('Sign In'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}